package Cli.src;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;


public class Student extends Person {
    private final List<Course> courses = new ArrayList<>();
    private List<Course> currentCourses = new ArrayList<>();
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
        Course course1 = new Course("12345", "Ap", new Professor("12345"), Semester.ONE, 3);
        ObjectMapper mapper = new ObjectMapper();
        File file = new File("Courses.json");
        List<Course> courses = mapper.readValue(file, new TypeReference<>() {
        });
//        courses.add(course1);
//        mapper.writerWithDefaultPrettyPrinter().writeValue(file, courses);
        for (Course course: courses) {
            System.out.println(course);
        }
    }

    public List<Course> getCourses() {
        return new ArrayList<>(courses);
    }

    public List<Course> getCurrentCourses() {
        updateCurrentCourses();
        return new ArrayList<>(currentCourses);
    }

    private void updateCurrentCourses() {
        currentCourses = currentCourses
                .stream()
                .parallel()
                .filter(course -> course.getSemester().equals(currentSemester))
                .collect(Collectors.toList());
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
        currentCourses.stream()
                .parallel()
                .forEach(course -> adoptedUnitsNum.addAndGet(course.getUnitsNum()));
        return adoptedUnitsNum.get();
    }

    public int showTotalUnitsNum() {
        AtomicInteger totalUnitsNum = new AtomicInteger(0);
        courses.stream()
                .parallel()
                .forEach(course -> totalUnitsNum.addAndGet(course.getUnitsNum()));
        return totalUnitsNum.get();
    }

    public double showTotalAverage() throws NoCoursesAvailableException {
        if (courses.isEmpty()) {
            return 0;
        }
        AtomicReference<Double> totalAverage = new AtomicReference<>(0D);
        courses.stream()
                .parallel()
                .forEach(course -> totalAverage.updateAndGet(v -> {
                    try {
                        return v + course.getStudentsGrades().get(this) * course.getUnitsNum();
                    } catch (StudentDoesNotExistException e) {
                        throw new RuntimeException(e);
                    }
                }));
        return totalAverage.get() / showTotalUnitsNum();
    }

    public double showGPAOfCurrentSemester() throws Exception {
        if (currentCourses.isEmpty()) {
            return 0;
        }
        updateCurrentCourses();
        AtomicReference<Double> GPAOfCurrentSemester = new AtomicReference<>(0D);
        currentCourses.stream()
                .parallel()
                .forEach(course -> GPAOfCurrentSemester.updateAndGet(v -> {
                    try {
                        return v + course.getStudentsGrades().get(this) * course.getUnitsNum();
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
        if (courses.contains(course)) {
            throw new CourseAlreadyExistsException();
        }
        courses.add(course);
        currentCourses.add(course);
    }
}