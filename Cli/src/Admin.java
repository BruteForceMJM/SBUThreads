public class Admin {
    private final String firstName;
    private final String lastName;
    private final String id;

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

    public void addStudent(Course course, Student student) throws Exception {
        course.addStudent(student);
        student.addCurrentCourse(course);
    }

    public void removeStudent(Course course, Student student) throws Exception {
        course.removeStudent(student);
    }

    public void addProfessor(Course course, Professor professor) throws Exception {
        professor.addCourse(course);
    }
}