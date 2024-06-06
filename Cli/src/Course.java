package Cli.src;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

class StudentData {
    private final Student student;
    private final HashMap<Task, Double> tasksScores = new HashMap<>();
    private double score;

    public StudentData(Student student) {
        this.student = student;
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

    public Student getStudent() {
        return student;
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
        return Objects.equals(student, that.student);
    }

    @Override
    public int hashCode() {
        return Objects.hash(student);
    }
}

public class Course {
    private final HashSet<StudentData> studentsData = new HashSet<>();
    private final String id;
    private final LinkedList<Task> tasks = new LinkedList<>();
    private Semester semester;
    private String courseName;
    private Professor professor;
    private int unitsNum;
    private boolean isAvailable;
    private LocalDateTime examDate;

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

    public String getId() {
        return id;
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

    public Map<Student, Double> getStudentsGrades() throws StudentDoesNotExistException {
        if (studentsData.isEmpty()) {
            throw new StudentDoesNotExistException();
        }
        return studentsData.stream()
                .collect(Collectors
                        .toMap(StudentData::getStudent, StudentData::getScore));
    }

    public List<Student> getStudents() throws StudentDoesNotExistException {
        if (studentsData.isEmpty()) {
            throw new StudentDoesNotExistException();
        }
        return studentsData.stream()
                .map(StudentData::getStudent)
                .collect(Collectors.toList());
    }

    public void addStudent(Student student) throws StudentAlreadyExistsException {
        StudentData newStudent = new StudentData(student);
        if (studentsData.contains(newStudent)) {
            throw new StudentAlreadyExistsException();
        }
        studentsData.add(newStudent);
    }

    public void removeStudent(Student student) throws StudentDoesNotExistException {
        StudentData oldStudent = new StudentData(student);
        if (!studentsData.contains(oldStudent)) {
            throw new StudentDoesNotExistException();
        }
        studentsData.remove(oldStudent);
    }

    public int getUnitsNum() {
        return unitsNum;
    }

    public void setUnitsNum(int unitsNum) {
        this.unitsNum = unitsNum;
    }

    public int getStudentsNum() {
        return studentsData.size();
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }

    public int getAssignmentsNum() {
        return tasks.size();
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
}