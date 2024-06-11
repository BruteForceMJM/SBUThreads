package Cli.src;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.File;
import java.util.List;

public class Admin {
    private String firstName;
    private String lastName;
    private String id;


    public Admin() {
    }

    public Admin(String firstName, String lastName, String id) {
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

    public void addStudent(String courseID, String studentID) throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        File studentsFile = new File("Students.json");
        File coursesFile = new File("Courses.json");
        List<Student> students = mapper.readValue(studentsFile, new TypeReference<>() {
        });
        List<Course> courses = mapper.readValue(coursesFile, new TypeReference<>() {
        });
        for (Course course : courses) {
            if (course.getId().equals(courseID)) {
                for (Student student : students) {
                    if (student.getID().equals(studentID)) {
                        course.addStudent(student);
                    }
                }
            }
        }
        mapper.writerWithDefaultPrettyPrinter().writeValue(studentsFile, students);
        mapper.writerWithDefaultPrettyPrinter().writeValue(coursesFile, courses);
    }

    public void removeStudent(String courseID, String studentID) throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        File studentsFile = new File("Students.json");
        File coursesFile = new File("Courses.json");
        List<Student> students = mapper.readValue(studentsFile, new TypeReference<>() {
        });
        List<Course> courses = mapper.readValue(coursesFile, new TypeReference<>() {
        });
        for (Course course : courses) {
            if (course.getId().equals(courseID)) {
                for (Student student : students) {
                    if (student.getID().equals(studentID)) {
                        course.removeStudent(student);
                    }
                }
            }
        }
        mapper.writerWithDefaultPrettyPrinter().writeValue(studentsFile, students);
        mapper.writerWithDefaultPrettyPrinter().writeValue(coursesFile, courses);
    }

    public void addProfessor(String courseID, String professorID) throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        File professorsFile = new File("Professors.json");
        File coursesFile = new File("Courses.json");
        List<Professor> professors = mapper.readValue(professorsFile, new TypeReference<>() {
        });
        List<Course> courses = mapper.readValue(coursesFile, new TypeReference<>() {
        });
        for (Course course : courses) {
            if (course.getId().equals(courseID)) {
                for (Professor professor : professors) {
                    if (professor.getID().equals(professorID)) {
                        professor.addCourse(course);
                    }
                }
            }
        }
        mapper.writerWithDefaultPrettyPrinter().writeValue(professorsFile, professors);
        mapper.writerWithDefaultPrettyPrinter().writeValue(coursesFile, courses);
    }

    public void removeProfessor(String courseID, String professorID) throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        File professorsFile = new File("Professors.json");
        File coursesFile = new File("Courses.json");
        List<Professor> professors = mapper.readValue(professorsFile, new TypeReference<>() {
        });
        List<Course> courses = mapper.readValue(coursesFile, new TypeReference<>() {
        });
        for (Course course : courses) {
            if (course.getId().equals(courseID)) {
                for (Professor professor : professors) {
                    if (professor.getID().equals(professorID)) {
                        professor.removeCourse(course);
                    }
                }
            }
        }
        mapper.writerWithDefaultPrettyPrinter().writeValue(professorsFile, professors);
        mapper.writerWithDefaultPrettyPrinter().writeValue(coursesFile, courses);
    }

    @Override
    public String toString() {
        return "Admin{" +
                "firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", id='" + id + '\'' +
                '}';
    }
}