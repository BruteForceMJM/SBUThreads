import java.util.ArrayList;
import java.util.List;

public class Professor {
    private final String firstName;
    private final String lastName;
    private final String id;
    private final List<Course> courses = new ArrayList<>();

    public Professor(String firstName, String lastName, String id) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getId() {
        return id;
    }

    public int getCoursesNum() {
        return courses.size();
    }

    public void scoreStudent(Course course, Student student, Double score) throws Exception {
        if (!courses.contains(course)) {
            throw new IllegalActionException();
        }
        course.scoreStudent(student, score);
    }

    public void scoreTask(Course course, Task task, Student student, Double score) throws Exception {
        if (!courses.contains(course)) {
            throw new IllegalActionException();
        }
        course.scoreTask(task, student, score);
    }

    public void addTask(Course course, Task task) throws Exception {
        if (!courses.contains(course)) {
            throw new IllegalActionException();
        }
        course.addTask(task);
    }

    public void removeTask(Course course, Task task) throws Exception {
        if (!courses.contains(course)) {
            throw new IllegalActionException();
        }
        course.removeTask(task);
    }

    public void addCourse(Course course) throws Exception {
        if (courses.contains(course)) {
            throw new CourseAlreadyExistsException();
        } else if (!course.getProfessor().equals(this)) {
            throw new IllegalActionException();
        }
        courses.add(course);
    }

}
