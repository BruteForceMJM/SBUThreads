package Cli.src;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

class StudentData {
    private final HashMap<Task, Double> tasksScores = new HashMap<>();
    private String studentID;
    private Student student;
    private double score;


    public StudentData() {
    }

    public StudentData(Student student, double score) {
        this.student = student;
        this.score = score;
        this.studentID = student.getID();
    }

    public StudentData(Student student) {
        this(student, 0);
    }

    public HashMap<Task, Double> getTasksScores() {
        return new HashMap<>(tasksScores);
    }

    public void addTask(Task task) {
        tasksScores.put(task, 0D);
    }

    public void removeTask(Task task) {
        tasksScores.remove(task);
    }

    public void scoreTask(Task task, double score) {
        tasksScores.put(task, score);
    }

    public Student returnStudent() {
        return student;
    }

    public String getStudentID() {
        return studentID;
    }

    public double getScore() {
        return score > 0 ? score : 0;
    }

    public void setScore(double score) {
        this.score = score;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        StudentData that = (StudentData) o;
        return Objects.equals(studentID, that.getStudentID());
    }

    @Override
    public int hashCode() {
        return Objects.hash(studentID);
    }
}

public class Course {
    private final HashSet<StudentData> studentsData = new HashSet<>();
    private final HashSet<String> studentsID = new HashSet<>();
    private final LinkedList<Task> tasks = new LinkedList<>();
    private String id;
    private Semester semester;
    private String courseName;
    private Professor professor;
    private int unitsNum;
    private boolean isAvailable;
    private LocalDateTime examDate;

    public Course() {
    }

    public Course(String id) {
        this.id = id;
    }

    public Course(String id, String courseName, Professor professor, Semester semester, int unitsNum) {
        this.id = id;
        this.courseName = courseName;
        this.professor = professor;
        this.semester = semester;
        this.unitsNum = unitsNum;
    }

    public Course(String id, Semester semester, String courseName, Professor professor, int unitsNum, boolean isAvailable, LocalDateTime examDate) {
        this.id = id;
        this.semester = semester;
        this.courseName = courseName;
        this.professor = professor;
        this.unitsNum = unitsNum;
        this.isAvailable = isAvailable;
        this.examDate = examDate;
    }

    public String getId() {
        return id;
    }


    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Professor getProfessor() {
        return professor;
    }

    public void setProfessor(Professor professor) {
        this.professor = professor;
    }

    public Semester getSemester() {
        if (semester == null) {
            return Semester.ONE;
        }
        return semester;
    }

    public void getExamDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss a");
        String time = examDate.format(formatter);
        System.out.println(time);
    }

    public void setExamDate(LocalDateTime examDate) {
        this.examDate = examDate;
    }

    public Map<Student, Double> returnStudentsGrades() throws StudentDoesNotExistException {
        return studentsData.stream()
                .collect(Collectors
                        .toMap(StudentData::returnStudent, StudentData::getScore));
    }

    public Set<String> getStudentsID() throws StudentDoesNotExistException {
        return studentsID;
    }

    public void addStudent(Student student) throws Exception {
        StudentData newStudent = new StudentData(student);
        if (studentsData.contains(newStudent)) {
            throw new StudentAlreadyExistsException();
        }
        student.addCurrentCourse(this);
        studentsData.add(newStudent);
        studentsID.add(student.getID());
    }

    public void removeStudent(Student student) throws StudentDoesNotExistException, CourseNotFoundException {
        StudentData oldStudent = new StudentData(student);
        if (!studentsData.contains(oldStudent)) {
            throw new StudentDoesNotExistException();
        }
        student.removeCourse(this);
        studentsData.remove(oldStudent);
    }

    public HashSet<StudentData> getStudentsData() {
        return studentsData;
    }

    public LinkedList<Task> getTasks() {
        return tasks;
    }

    public int getUnitsNum() {
        return unitsNum;
    }

    public void setUnitsNum(int unitsNum) {
        this.unitsNum = unitsNum;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }

    public void scoreStudent(Student student, Double score) throws StudentDoesNotExistException {
        StudentData studentData = new StudentData(student);
        if (!studentsData.contains(studentData)) {
            throw new StudentDoesNotExistException();
        }
        var oldStudentData = studentsData.stream()
                .parallel()
                .filter(studentData1 -> studentData1.equals(studentData))
                .limit(1)
                .findFirst();
        oldStudentData.ifPresent(data -> data.setScore(score));
    }

    public void scoreTask(Task task, Student student, Double score) throws Exception {
        StudentData studentData = new StudentData(student);
        if (!studentsData.contains(studentData)) {
            throw new StudentDoesNotExistException();
        } else if (!tasks.contains(task)) {
            throw new TaskNotFoundException();
        }
        var oldStudentData = studentsData.stream()
                .parallel()
                .filter(studentData1 -> studentData1.equals(studentData))
                .limit(1)
                .findFirst();
        oldStudentData.ifPresent(data -> data.scoreTask(task, score));
    }

    public void addTask(Task task) throws Exception {
        if (tasks.contains(task)) {
            throw new TaskAlreadyExistsException();
        }
        tasks.add(task);
        studentsData.stream()
                .parallel()
                .forEach(studentData -> studentData.addTask(task));
    }

    public void removeTask(Task task) throws Exception {
        if (!tasks.contains(task)) {
            throw new TaskNotFoundException();
        }
        tasks.remove(task);
        studentsData.stream()
                .parallel()
                .forEach(studentData -> studentData.removeTask(task));
    }

    public Double bestScore() throws Exception {
        return studentsData.stream()
                .max((s1, s2) -> (int) (s1.getScore() - s2.getScore()))
                .orElseThrow(StudentNotFoundException::new).getScore();
    }

    @Override
    public String toString() {
        return "Course{" +
                "courseName='" + courseName + '\'' +
                ", professor=" + professor +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Course course = (Course) o;
        return unitsNum == course.unitsNum &&
                Objects.equals(courseName, course.courseName) &&
                Objects.equals(professor, course.professor);
    }

    @Override
    public int hashCode() {
        return Objects.hash(courseName, professor, unitsNum);
    }
}
