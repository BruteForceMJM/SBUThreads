package Cli.src;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Professor extends Person {
    private final List<Course> courses = new ArrayList<>();

    public Professor() {
    }

    public Professor(String id) {
        super(id);
    }

    public Professor(String id, String password, String firstName, String lastName) {
        super(id, password, firstName, lastName);
    }

    public List<String> getCourses() {
        return courses.stream()
                .map(Course::getId)
                .toList();
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Professor professor = (Professor) o;
        return Objects.equals(getID(), professor.getID());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getID());
    }

    public void removeCourse(Course course) throws Exception {
        if (!courses.contains(course)) {
            throw new CourseNotFoundException();
        } else if (!course.getProfessor().equals(this)) {
            throw new IllegalActionException();
        }
        courses.remove(course);
    }
}