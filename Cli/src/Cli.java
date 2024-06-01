import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Pattern;

import info.ProfessorInfo;
import readWriteInFile.Login;
import readWriteInFile.LoginRole;
import readWriteInFile.Signup;

public class Cli {

    private static final Admin admin = new Admin("admin", "admin", "admin");

    public static void main(String[] args) throws Exception {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Welcome to our Management Daneshjooyar System!!");
        Thread.sleep(1000);
        System.out.print("\033[H\033[2J");
        System.out.flush();
        System.out.println("Please choose one option:");
        System.out.println("1-Admin 2-Professor");


        boolean validNumber = false;
        int userChosenNumber = 0;
        while (!validNumber) {
            try {
                userChosenNumber = scanner.nextInt();
                if (userChosenNumber < 1 || userChosenNumber > 2) {
                    throw new illegalNumberException();
                }
                validNumber = true;
            } catch (illegalNumberException e) {
                System.out.println("Choose valid option:");
            }
        }


        boolean isAdmin = userChosenNumber == 1;
        Thread.sleep(1500);
        System.out.print("\033[H\033[2J");
        System.out.flush();
        if (isAdmin) {
            adminLogin(scanner);


            Thread.sleep(1500);
            System.out.print("\033[H\033[2J");
            System.out.flush();

            int userMenuNumber = adminAction(scanner);

            Thread.sleep(1000);
            System.out.print("\033[H\033[2J");
            System.out.flush();

            switch (userMenuNumber) {
                case 1:
                    adminAllActions(scanner, Situation.Add, Role.Student);
                    break;
                case 2:
                    adminAllActions(scanner,Situation.Remove, Role.Student);
                    break;
                case 3:
                    adminAllActions(scanner,Situation.Add, Role.Professor);
                    break;
                case 4:
                    break;
            }
        }
        if (!isAdmin) {
            Thread.sleep(1500);
            System.out.print("\033[H\033[2J");
            System.out.flush();
            System.out.println("please choose one option:");
            System.out.println("1-Signup  2-Login");
            boolean validChosenNumber = false;
            int chosenNumber = 0;
            while (!validChosenNumber) {
                try {
                    chosenNumber = scanner.nextInt();
                    if (chosenNumber < 1 || chosenNumber > 2) {
                        throw new illegalNumberException("your chosen number is invalid");
                    }
                    validChosenNumber = true;
                } catch (illegalNumberException e) {
                    System.out.print("enter valid number:");
                }
            }
            if (chosenNumber == 1) {
                professorSignup(scanner);
            } else {
                professorLogin(scanner);
            }
        }
    }


    private static void adminLogin(Scanner scanner) {
        boolean adminUserNameValid = false;
        boolean adminPasswordValid = false;
        while (!adminUserNameValid || !adminPasswordValid) {
            try {
                System.out.print("Enter your username:");
                String adminUserName = scanner.next();
                System.out.print("Enter your Password:");
                String adminPassword = scanner.next();
                if (!adminUserName.equals("admin")) {
                    throw new UsernameInvalidException();
                }
                if (!adminPassword.equals("admin")) {
                    throw new PasswordInvalidException();
                }
                adminUserNameValid = true;
                adminPasswordValid = true;
            } catch (UsernameInvalidException | PasswordInvalidException e) {
                System.out.println("your username or password is invalid!!");
            }
        }
    }

    private static int adminAction(Scanner scanner) {
        System.out.println("Which action do you want to do:");
        System.out.println("1-addStudent to specific course");
        System.out.println("2-removeStudent from specific course");
        System.out.println("3-addProfessor to specific course");
        System.out.println("4-removeProfessor from specific course");
        boolean validChosenNumber = false;
        int userMenuNumber = 0;
        while (!validChosenNumber) {
            try {
                userMenuNumber = scanner.nextInt();
                if (userMenuNumber < 1 || userMenuNumber > 4) {
                    throw new illegalNumberException("your chosen number is invalid!!");
                }
                validChosenNumber = true;
            } catch (illegalNumberException e) {
                System.out.println(e.getMessage());
                System.out.println("please choose valid number:");
            }
        }
        return userMenuNumber;
    }

    private static void adminAllActions(Scanner scanner, Situation situation, Role role) throws Exception {
        System.out.println("Write information about course:");
        System.out.print("Course name:");
        String courseName = scanner.next();
        System.out.print("Professor id:");
        String professorId = scanner.next();
        String professorName = null;
        String professorFamily = null;
        File professorFile = new File("D:\\Project\\FirstSection\\Cli\\pro.txt");
        try (Scanner readProfessorsFile = new Scanner(professorFile)) {
            while (readProfessorsFile.hasNextLine()) {
                String[] phrase = readProfessorsFile.nextLine().split("_");
                if (phrase[2].equals(professorId)) {
                    professorName = phrase[0];
                    professorFamily = phrase[1];
                }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        if (professorName == null || professorFamily == null) {
            throw new ProfessorNotFoundException("The professor doesn't find with this id!!");
        }

        System.out.print("Semester:");
        boolean isSemesterValid = false;
        int semester = 0;
        Semester enumSemester = null;
        while (!isSemesterValid) {
            try {
                semester = scanner.nextInt();
                if (semester < 1 || semester > 8) {
                    throw new InvalidSemesterException();
                }
                isSemesterValid = true;
            } catch (InvalidSemesterException e) {
                System.out.println("Enter valid Semester:");
            }
        }
        enumSemester = switch (semester) {
            case 1 -> Semester.ONE;
            case 2 -> Semester.TWO;
            case 3 -> Semester.THREE;
            case 4 -> Semester.FOUR;
            case 5 -> Semester.FIVE;
            case 6 -> Semester.SIX;
            case 7 -> Semester.SEVEN;
            case 8 -> Semester.EIGHT;
            default -> enumSemester;
        };
        System.out.println("Unit Numbers:");
        int unitNum = scanner.nextInt();

        Student student = null;
        if (role.equals(Role.Student)) {
            System.out.println("------------------");
            System.out.print("Student ID:");
            boolean validStudentId = false;
            String studentId = "";
            while (!validStudentId) {
                try {
                    studentId = scanner.next();
                    if (!Pattern.matches("[0-9]{9}", studentId)) {
                        throw new InvalidStudentIdException();
                    }
                    validStudentId = true;
                } catch (InvalidStudentIdException e) {
                    System.out.println("Please write valid Student id:");
                }
            }


            File studentFile = new File("D:\\Project\\FirstSection\\Cli\\student.txt");
            String studentName = null;
            try (Scanner readStudentFile = new Scanner(studentFile)) {
                while (readStudentFile.hasNextLine()) {
                    String[] phrase = readStudentFile.nextLine().split("_");
                    if (phrase[1].equals(studentId)) {
                        studentName = phrase[0];
                    }
                }
            }
            if (studentName == null) {
                throw new StudentDoesNotExistException("The student doesn't find with this id!!");
            }
            student = new Student(studentName, studentId);
        }

        Professor professor = new Professor(professorName, professorFamily, professorId);
        Course course = new Course(courseName, professor, enumSemester, unitNum);


        if (situation.equals(Situation.Add) && role.equals(Role.Student)) {
            admin.addStudent(course, student);
            System.out.println("The student add to course successfully....");
        } else if (situation.equals(Situation.Remove) && role.equals(Role.Student)) {
            admin.removeStudent(course, student);
            System.out.println("The student successfully remove....");
        } else if (situation.equals(Situation.Add) && role.equals(Role.Professor)) {
            admin.addProfessor(course, professor);
            System.out.println("The professor successfully added ...");
        }


    }

    private static void professorSignup(Scanner scanner) throws IOException {
        System.out.print("Enter your firstname:");
        String professorFirstName = scanner.next();
        System.out.println("Enter your lastname:");
        String professorLastName = scanner.next();
        System.out.print("Enter your id:");
        String professorId = "";
        boolean validId = false;
        while (!validId) {
            try {
                professorId = scanner.next();
                if (!Pattern.matches("[0-9]{9}", professorId)) {
                    throw new RuntimeException();
                }
                validId = true;

            } catch (RuntimeException e) {
                System.out.print("please write valid id :");
            }
        }

        System.out.print("Enter your password:");
        String professorPassword = "";
        boolean validPassword = false;
        while (!validPassword) {
            try {
                professorPassword = scanner.next();
                if (!Pattern.matches("^(?=.*[#$@!%&*?])(?=.*\\d)[A-Za-z\\d#$@!%&*?]{8,}$", professorPassword)) {
                    throw new RuntimeException();
                }
                validPassword = true;
            } catch (RuntimeException e) {
                System.out.println("your password isn't strong enough");
                System.out.print("please choose strong password:");
            }
        }

        System.out.print("Confirm your password:");
        boolean isSame = false;
        while (!isSame) {
            try {
                String professorConfirmPassword = scanner.next();
                if (!professorConfirmPassword.equals(professorPassword)) {
                    throw new RuntimeException();
                }
                isSame = true;
            } catch (RuntimeException e) {
                System.out.println("The passwords that you wrote isn't same!");
                System.out.print("Confirm your password:");
            }
        }

        Signup.signupTeacher(professorFirstName, professorLastName, LoginRole.Proffesor, professorId, professorPassword, professorId, "D:\\Project\\FirstSection\\Cli\\pro.txt");


    }

    private static void professorLogin(Scanner scanner) throws Exception {
        System.out.print("Your username(id):");
        boolean validUsername = false;
        String professorId = "";
        while (!validUsername) {
            try {
                professorId = scanner.next();
                if (!Pattern.matches("[0-9]{9}", professorId)) {
                    throw new RuntimeException();
                }
                validUsername = true;
            } catch (RuntimeException e) {
                System.out.println("your id is invalid!!");
                System.out.print("please enter valid id:");
            }
        }
        System.out.print("You Password:");
        boolean validPassword = false;
        String professorPassword = "";
        while (!validPassword) {
            try {
                professorPassword = scanner.next();
                if (professorPassword.length() < 8) {
                    throw new RuntimeException();
                }
                validPassword = true;
            } catch (RuntimeException e) {
                System.out.println("you must enter at least 8 character for password!!");
                System.out.print("Your password:");
            }
        }
        List<Boolean> isSuccess = Login.login(professorId, professorPassword, "D:\\Project\\FirstSection\\Cli\\pro.txt");
        if (isSuccess.get(0)) {
            if (isSuccess.get(1)) {
                System.out.println("Welcome User ...");
                chooseActionProfessor(scanner);
            } else {
                System.out.println("your password is incorrect!!!");
            }

        } else {
            System.out.println("your account doesn't find !!");
        }
    }

    private static void chooseActionProfessor(Scanner scanner) throws Exception {
        System.out.println("what action do you want to do :");
        System.out.println("1-add Course");
        System.out.println("2-remove Course");
        System.out.println("3-add Task");
        System.out.println("4-remove Task");
        System.out.println("5-Score student");
        System.out.println("6-Score Task");
        boolean validNumber = false;
        String userChosenNumber = "";
        int userNumber = 0;
        while (!validNumber) {
            try {
                userChosenNumber = scanner.next();
                userNumber = Integer.parseInt(userChosenNumber);
                if (userNumber < 1 || userNumber > 6) {
                    throw new RuntimeException();
                }
                validNumber = true;
            } catch (Exception e) {
                System.out.print("please choose valid number:");
            }
        }

        switch (userNumber) {
            case 1:
                addCourseProfessor(scanner);
                break;
        }

    }

    public static void addCourseProfessor(Scanner scanner) throws Exception {
        System.out.println("Please write these information:");
        System.out.print("Professor name:");
        String professorName = scanner.next();
        System.out.print("Professor lastname:");
        String professorFamily = scanner.next();
        System.out.print("Professor id:");
        boolean validId = false;
        String professorId = "";
        while (!validId) {
            try {
                professorId = scanner.next();
                if (!Pattern.matches("[0-9]{9}", professorId)) {
                    throw new UsernameInvalidException();
                }
                validId = true;
            } catch (UsernameInvalidException e) {
                System.out.print("Enter valid id:");
            }
        }
        Professor professor = new Professor(professorName, professorFamily, professorId);
        System.out.print("Course name:");
        String courseName = scanner.next();
        System.out.print("Semester:");
        boolean validSemester = false;
        String semesterString = "";
        int semesterInt = 0;
        Semester semester = null;
        while (!validSemester) {
            try {
                semesterString = scanner.next();
                semesterInt = Integer.parseInt(semesterString);
                if (semesterInt < 1 || semesterInt > 8) {
                    throw new RuntimeException();
                }
                validSemester = true;
            } catch (Exception e) {
                System.out.print("Enter valid semester:");
            }
        }
        switch (semesterInt) {
            case 1:
                semester = Semester.ONE;
                break;
            case 2:
                semester = Semester.TWO;
                break;
            case 3:
                semester = Semester.THREE;
                break;
            case 4:
                semester = Semester.FOUR;
                break;
            case 5:
                semester = Semester.FIVE;
                break;
            case 6:
                semester = Semester.SIX;
                break;
            case 7:
                semester = Semester.SEVEN;
                break;
            case 8:
                semester = Semester.EIGHT;
                break;
        }
        System.out.print("Unit number:");
        String unitNum = scanner.next();
        int unitIntegerNum = Integer.parseInt(unitNum);
        Course course = new Course(courseName, professor, semester, unitIntegerNum);
        professor.addCourse(course);
        System.out.println("Course added successfully !!");
    }

    public static void professorTaskAction(Scanner scanner, String situation) {
        System.out.print("Task id:");
        String taskId = scanner.next();
        System.out.print("Days for deadline:");
        int day = scanner.nextInt();
        System.out.print("hours for deadline:");
        int hour = scanner.nextInt();
        Task task = new Task(taskId, day, hour);


    }

}
