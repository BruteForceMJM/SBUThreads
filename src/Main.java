import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Main {
    public static void main(String[] args) throws Exception {
        Assignment assignment1 = new Assignment("456", 2, 6);
        Professor professor1 = new Professor("Ali", "Alavi", "12345");
        Professor professor2 = new Professor("Mohammad", "allavi", "0987");
        Course course1 = new Course("AP", professor1, 3);
        Course course2 = new Course("DL", professor2, 3);
        Student student1 = new Student("Javad Zare", "068");
        Student student2 = new Student("Ali Mahdavi", "040");
        Student student3 = new Student("Taghi Taghavi", "050");
        professor1.addCourse(course1);
        professor2.addCourse(course2);
        professor2.addStudent(course2, student1);
        professor2.scoreStudent(course2, student1, 15.0);
        professor1.addStudent(course1, student1);
        professor1.addStudent(course1, student2);
        professor1.addStudent(course1, student3);
        professor1.addTask(course1, assignment1);
        professor1.scoreTask(course1, assignment1, student1, 2D);
        professor1.scoreStudent(course1, student1, 18.0);
        professor1.scoreStudent(course1, student2, 17.0);
        professor1.scoreStudent(course1, student3, 20.0);
        System.out.println(student1.getAdoptedUnitsNum());
        System.out.println(student1.getTotalAverage());

//
//
//
//        System.out.println(professor1.addAssignment(course2, assignment1));
//        System.out.println(professor1.addCourse(course1));
//        System.out.println(professor1.addAssignment(course1, assignment1));
////        System.out.println(professor1.addStudent(course1, student1));
////        System.out.println(professor1.addStudent(course1, student2));
//        System.out.println(professor1.scoreStudent(course1, student2, 15D));
//        System.out.println(professor1.scoreAssignment(course1, assignment1, student1, 5D));
//        System.out.println(professor1.scoreStudent(course1, student1, 9D));
//        System.out.println("best score: " + course1.bestScore());
//
//
//        student1.getCourses();
//        assignment1.showTime();
//        System.out.println(student1.getCurrentCoursesNum());
//        System.out.println(student1.getAdoptedUnitsNum());
//        System.out.println(student1.getTotalAverage());
//        Project project1 = new Project("065", 3, 0);
//        System.out.println(professor2.addProject(course1, project1));
//        System.out.println(professor2.addCourse(course2));
////        System.out.println(professor2.addStudent(course2, student1));
//        System.out.println(professor2.scoreStudent(course2, student1, 8D));
//        System.out.println("total average: " + student1.getGPAOfCurrentSemester());
//        student1.getCourses();
//        course1.getStudents();
    }
}