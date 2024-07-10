package Cli.src;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;


public class Student extends Person {
    private final List<String> courses = new ArrayList<>();
    private List<String> currentCourses = new ArrayList<>();
    private Semester currentSemester = Semester.ONE;

    public Student() {
    }

    public Student(String ID) {
        super(ID);
    }

    public Student(String ID, String password, String firstName, String lastName) {
        super(ID, password, firstName, lastName);
    }

    public static void main(String[] args) throws Exception {
//        Student student = new Student("Ali Alavi", "402243068");
//        student.addCurrentCourse(new Course("12345"));
//        Admin admin = new Admin("Ali", "Alavi", "12345");
//        Admin admin2 = new Admin("Mohammad", "Taghavi", "0987");
//        ObjectMapper objectMapper = new ObjectMapper();
//        String jsonString = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(admin);
//        System.out.println(jsonString);
//        JsonNode node = objectMapper.readTree(jsonString);
//        Iterator<String> iterator = node.fieldNames();
//        System.out.println(iterator.next());
//
//        ObjectMapper mapper = new ObjectMapper();
//        File file = new File("admin");
//        List<Admin> admins = mapper.readValue(file, new TypeReference<>() {
//        });
//        admins.add(admin2);
//        mapper.writerWithDefaultPrettyPrinter().writeValue(file, admins);
//        JsonFactory jsonFactory = new JsonFactory();
//        JsonParser parser = jsonFactory.createParser(new File("Students.json"));
//        while (parser.nextToken() != JsonToken.END_OBJECT) {
//            if (parser.currentToken() == JsonToken.FIELD_NAME) {
//                parser.nextToken();
//                System.out.println(parser.getCurrentToken().name());
//            }
////            System.out.println("Product Variations: "+parser.getText());
//        }
//        Course course1 = new Course("12345", "Ap", new Professor("12345"), Semester.ONE, 3);
//        ObjectMapper mapper = new ObjectMapper();
//        File file = new File("Courses.json");
//        List<Course> courses = mapper.readValue(file, new TypeReference<>() {
//        });
////        courses.add(course1);
////        mapper.writerWithDefaultPrettyPrinter().writeValue(file, courses);
//        for (Course course : courses) {
//            System.out.println(course);
//        }
//        File file = new File("Courses.json");
//        List<Course> courses = mapper.readValue(file, new TypeReference<>() {
//        });
//        courses = courses.stream()
//                .filter(course -> course.getId().equals("123"))
//                .toList();
//        System.out.println(courses.stream()
//                .map(Course::getId)
//                .toList());

//        ObjectMapper mapper = new ObjectMapper();
//        File file = new File("Courses.json");
//        List<Course> courses = mapper.readValue(file, new TypeReference<>() {
//        });
//        for (Course course: courses) {
//            System.out.println(course.getStudentsID());
//        }

    }

    public List<String> getCourses() {
        return courses.stream()
                .toList();
    }

    public List<String> getCurrentCourses() {
        updateCurrentCourses();
        return currentCourses.stream()
                .toList();
    }

    private void updateCurrentCourses() {
        try {
            List<Course> courses = returnCurrentCourseList();
            currentCourses = courses
                    .stream()
                    .parallel()
                    .filter(course -> course.getSemester().equals(currentSemester))
                    .map(Course::getId)
                    .collect(Collectors.toList());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private List<Course> returnCurrentCourseList() throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        File file = new File("Courses.json");
        List<Course> courses = mapper.readValue(file, new TypeReference<>() {
        });
        courses = courses.stream()
                .filter(course -> this.currentCourses.contains(course.getId()))
                .toList();
        return courses;
    }

    private List<Course> returnAllCourseList() throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        File file = new File("Courses.json");
        List<Course> courses = mapper.readValue(file, new TypeReference<>() {
        });
        courses = courses.stream()
                .filter(course -> this.courses.contains(course.getId()))
                .toList();
        return courses;
    }

    public Semester getCurrentSemester() {
        return currentSemester;
    }

    public void setCurrentSemester(Semester currentSemester) {
        this.currentSemester = currentSemester;
    }


    public int showAdoptedUnitsNum() {
        updateCurrentCourses();
        AtomicInteger adoptedUnitsNum = new AtomicInteger(0);
        try {
            List<Course> courseList = returnCurrentCourseList();
            courseList.stream()
                    .parallel()
                    .forEach(course -> adoptedUnitsNum.addAndGet(course.getUnitsNum()));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return adoptedUnitsNum.get();
    }

    public int showTotalUnitsNum() {
        AtomicInteger totalUnitsNum = new AtomicInteger(0);
        try {
            List<Course> courseList = returnAllCourseList();
            courseList.stream()
                    .parallel()
                    .forEach(course -> totalUnitsNum.addAndGet(course.getUnitsNum()));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return totalUnitsNum.get();
    }

    public double showTotalAverage() throws NoCoursesAvailableException {
        try {
            List<Course> courseList = returnAllCourseList();
            if (courseList.isEmpty()) {
                return 0;
            }
            AtomicReference<Double> totalAverage = new AtomicReference<>(0D);
            courseList.stream()
                    .parallel()
                    .forEach(course -> totalAverage.updateAndGet(v -> {
                        try {
                            return v + course.returnStudentsGrades().get(this) * course.getUnitsNum();
                        } catch (StudentDoesNotExistException e) {
                            throw new RuntimeException(e);
                        }
                    }));
            return totalAverage.get() / showTotalUnitsNum();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public double showGPAOfCurrentSemester() throws Exception {
        updateCurrentCourses();
        List<Course> courseList = returnCurrentCourseList();
        if (courseList.isEmpty()) {
            return 0;
        }
        AtomicReference<Double> GPAOfCurrentSemester = new AtomicReference<>(0D);
        courseList.stream()
                .parallel()
                .forEach(course -> GPAOfCurrentSemester.updateAndGet(v -> {
                    try {
                        return v + course.returnStudentsGrades().get(this) * course.getUnitsNum();
                    } catch (StudentDoesNotExistException e) {
                        throw new RuntimeException(e);
                    }
                }));
        return GPAOfCurrentSemester.get() / showAdoptedUnitsNum();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Student student = (Student) o;
        return Objects.equals(getID(), student.getID());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getID());
    }

    public void addCurrentCourse(Course course) throws Exception {
        if (currentCourses.contains(course.getId())) {
            throw new CourseAlreadyExistsException();
        }
        courses.add(course.getId());
        currentCourses.add(course.getId());
    }

    public void removeCourse(Course course) throws CourseNotFoundException {
        if (!courses.contains(course.getId())) {
            throw new CourseNotFoundException();
        }
        courses.remove(course.getId());
        currentCourses.remove(course.getId());
    }
}