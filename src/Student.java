import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

public class Student {
    private final List<Course> courses = new ArrayList<>();
    private final List<Course> currentCourses = new ArrayList<>();
    private final String name;
    private final String ID;

    public Student(String name, String ID) {
        this.name = name;
        this.ID = ID;
    }

    public List<Course> getCourses() {
        return new ArrayList<>(courses);
    }

    public List<Course> getCurrentCourses() {
        return new ArrayList<>(currentCourses);
    }

    public String getName() {
        return name;
    }

    public int getCourseNum() {
        return courses.size();
    }

    public int getCurrentCoursesNum() {
        return currentCourses.size();
    }

    public String getID() {
        return ID;
    }

    public int getAdoptedUnitsNum() {
        AtomicInteger adoptedUnitsNum = new AtomicInteger(0);
        currentCourses.stream()
                .parallel()
                .forEach(course -> adoptedUnitsNum.addAndGet(course.getUnitsNum()));
        return adoptedUnitsNum.get();
    }

    public int getTotalUnitsNum() {
        AtomicInteger totalUnitsNum = new AtomicInteger(0);
        courses.stream()
                .parallel()
                .forEach(course -> totalUnitsNum.addAndGet(course.getUnitsNum()));
        return totalUnitsNum.get();
    }

    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", ID='" + ID + '\'' +
                '}';
    }

    public double getTotalAverage() throws NoCoursesAvailableException {
        if (courses.isEmpty()) {
            throw new NoCoursesAvailableException();
        }
        AtomicReference<Double> totalAverage = new AtomicReference<>(0D);
        courses.stream()
                .parallel()
                .forEach(course -> totalAverage.updateAndGet(v -> {
                    try {
                        return v + course.getStudentsGrades().get(this);
                    } catch (StudentDoesNotExistsException e) {
                        throw new RuntimeException(e);
                    }
                }));
        return totalAverage.get() / courses.size();
    }

    public double getGPAOfCurrentSemester() throws Exception {
        if (currentCourses.isEmpty()) {
            throw new NoCoursesAvailableException();
        }
        AtomicReference<Double> GPAOfCurrentSemester = new AtomicReference<>(0D);
        currentCourses.stream()
                .parallel()
                .forEach(course -> GPAOfCurrentSemester.updateAndGet(v -> {
                    try {
                        return v + course.getStudentsGrades().get(this);
                    } catch (StudentDoesNotExistsException e) {
                        throw new RuntimeException(e);
                    }
                }));
        return GPAOfCurrentSemester.get() / currentCourses.size();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Student student = (Student) o;
        return Objects.equals(ID, student.ID);
    }

    @Override
    public int hashCode() {
        return Objects.hash(ID);
    }

    public void addCurrentCourse(Course course) throws Exception {
        if (courses.contains(course)) {
            throw new CourseAlreadyExistsException();
        }
        courses.add(course);
        currentCourses.add(course);
    }
}

