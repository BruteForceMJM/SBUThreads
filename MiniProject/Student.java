import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

public class Student {
    private final List<Course> courses = new ArrayList<>();
    private final String name;
    private final String ID;
    private List<Course> currentCourses = new ArrayList<>();
    private Semester currentSemester = Semester.ONE;


    public Student(String name, String ID) {
        this.name = name;
        this.ID = ID;
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

    public String getName() {
        return name;
    }

    public int getCourseNum() {
        return courses.size();
    }

    public int getCurrentCoursesNum() {
        updateCurrentCourses();
        return currentCourses.size();
    }

    public String getID() {
        return ID;
    }

    public int getAdoptedUnitsNum() {
        updateCurrentCourses();
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
                        return v + course.getStudentsGrades().get(this) * course.getUnitsNum();
                    } catch (StudentDoesNotExistsException e) {
                        throw new RuntimeException(e);
                    }
                }));
        return totalAverage.get() / getTotalUnitsNum();
    }

    public double getGPAOfCurrentSemester() throws Exception {
        if (currentCourses.isEmpty()) {
            throw new NoCoursesAvailableException();
        }
        updateCurrentCourses();
        AtomicReference<Double> GPAOfCurrentSemester = new AtomicReference<>(0D);
        currentCourses.stream()
                .parallel()
                .forEach(course -> GPAOfCurrentSemester.updateAndGet(v -> {
                    try {
                        return v + course.getStudentsGrades().get(this) * course.getUnitsNum();
                    } catch (StudentDoesNotExistsException e) {
                        throw new RuntimeException(e);
                    }
                }));
        return GPAOfCurrentSemester.get() / getAdoptedUnitsNum();
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

