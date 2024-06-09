package Cli.src;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;

public class Cli {

    private static final Admin admin = new Admin("admin", "admin", "admin");
    private static final Console console = System.console();

    public static void main(String[] args) throws Exception {
        System.out.println("Welcome to SBUThreads!!");
        Thread.sleep(1000);
        clearScreen();
        System.out.println("Pick up Your Role");
        String choice = console.readLine("1-Admin 2-Professor 3-Student: ");

        boolean validNumber = false;
        int userChosenNumber;
        while (!validNumber) {
            try {
                userChosenNumber = Integer.parseInt(choice);
                if (userChosenNumber < 1 || userChosenNumber > 3) {
                    throw new illegalNumberException();
                }
                validNumber = true;
            } catch (illegalNumberException e) {
                choice = console.readLine("Enter a Valid Choice");
            }
        }
        boolean isAdmin = choice.equals("1");
        boolean isProfessor = choice.equals("2");
        boolean isStudent = choice.equals("3");
        Thread.sleep(1000);
        clearScreen();
        if (isAdmin) {
            adminLogin();


            Thread.sleep(1000);
            clearScreen();

            int userMenuNumber = adminAction();

            Thread.sleep(1000);
            clearScreen();

            switch (userMenuNumber) {
                case 1:
                    adminAllActions(Situation.Add, Role.Student);
                    break;
                case 2:
                    adminAllActions(Situation.Remove, Role.Student);
                    break;
                case 3:
                    adminAllActions(Situation.Add, Role.Professor);
                    break;
                case 4:
                    adminAllActions(Situation.Remove, Role.Professor);
                case 5:
                    adminCreateCourse();
            }
        } else if (isProfessor) {
            Thread.sleep(1000);
            clearScreen();
            System.out.println("Please Choose One Option");
            professorFlow();
        } else if (isStudent) {
            Thread.sleep(1000);
            clearScreen();
            System.out.println("Please Choose One Option");
            studentFlow();
        }
    }

    private static void studentFlow() throws Exception {
        int chosenNumber = signupLoginChoice();
        if (chosenNumber == 1) {
            userSignup(Role.Student);
        } else {
            String studentID = userLogin(Role.Student);
            studentChooseAction(studentID);
        }
    }

    private static void studentChooseAction(String studentID) {
    }

    private static void professorFlow() throws Exception {
        int chosenNumber = signupLoginChoice();
        if (chosenNumber == 1) {
            userSignup(Role.Professor);
        } else {
            String professorID = userLogin(Role.Professor);
            professorChooseAction(professorID);
        }
    }

    private static int signupLoginChoice() {
        boolean validChosenNumber = false;
        int chosenNumber = Integer.parseInt(console.readLine("1-Signup  2-Login: "));
        while (!validChosenNumber) {
            try {
                if (chosenNumber < 1 || chosenNumber > 2) {
                    throw new illegalNumberException("Your Chosen Number is Invalid");
                }
                validChosenNumber = true;
            } catch (illegalNumberException e) {
                chosenNumber = Integer.parseInt(console.readLine("Enter Valid Number: "));
            }
        }
        return chosenNumber;
    }

    private static void clearScreen() {
        System.out.print("\033[H\033[2J");
        System.out.flush();
    }


    private static void adminLogin() {
        clearScreen();
        boolean adminLoginIsValid = false;
        while (!adminLoginIsValid) {
            try {
                String adminUserName = console.readLine("Enter your username: ");
                char[] adminPassword = console.readPassword("Enter your Password: ");
                if (!adminUserName.equals("admin")) {
                    throw new UsernameInvalidException();
                }
                if (!Arrays.equals(adminPassword, "admin".toCharArray())) {
                    throw new PasswordInvalidException();
                }
                adminLoginIsValid = true;
            } catch (UsernameInvalidException | PasswordInvalidException e) {
                System.out.println("Your Username or Password is Invalid!!");
            }
        }
    }

    private static int adminAction() {
        clearScreen();
        System.out.println("Which Action do You Want to Do?");
        System.out.println("1-Add a Student to Specific Course");
        System.out.println("2-Remove a Student from Specific Course");
        System.out.println("3-Add a Professor to Specific Course");
        System.out.println("4-Remove a Professor from Specific Course");
        System.out.println("5-Create a Course");
        boolean validChosenNumber = false;
        int userMenuNumber = Integer.parseInt(console.readLine());
        while (!validChosenNumber) {
            try {
                if (userMenuNumber < 1 || userMenuNumber > 5) {
                    throw new illegalNumberException("The Number You Picked, is invalid!!");
                }
                validChosenNumber = true;
            } catch (illegalNumberException e) {
                userMenuNumber = Integer.parseInt(console.readLine("Please Pick a Valid Number: "));
            }
        }
        return userMenuNumber;
    }

    private static void adminAllActions(Situation situation, Role role) throws Exception {
        System.out.println("Write Information About Course:");
        String courseID = console.readLine("Course ID: ");

        // ToDo : checking if course id is valid

        if (role == Role.Student) {
            String studentID = console.readLine("Student ID: ");
            // ToDo : checking if student id is valid
            if (situation == Situation.Add) {
                admin.addStudent(new Course(courseID), new Student(studentID));
                System.out.println("Added Successfully");
            } else if (situation == Situation.Remove) {
                admin.removeStudent(new Course(courseID), new Student(studentID));
                System.out.println("Removed Successfully");
            }
        } else if (role == Role.Professor) {
            String professorID = console.readLine("Professor ID: ");
            // ToDo : checking if professor id is valid
            if (situation == Situation.Add) {
                admin.addProfessor(new Course(courseID), new Professor(professorID));
                System.out.println("Added Successfully");
            } else if (situation == Situation.Remove) {
                admin.removeProfessor(new Course(courseID), new Professor(professorID));
                System.out.println("Removed Successfully");
            }
        } else {
            throw new IllegalActionException();
        }
    }

    private static void userSignup(Role role) throws IOException {
        clearScreen();
        String userFirstName = console.readLine("Enter Your FirstName: ");
        String userLastName = console.readLine("Enter Your LastName: ");
        String userID = console.readLine("Enter Your ID: ");
        boolean validId = false;
        while (!validId) {
            try {
                if (!Pattern.matches("[0-9]{9}", userID)) {
                    throw new RuntimeException();
                }
                if (!checkIfUnique(userID, role)) {
                    throw new IllegalActionException();
                }
                validId = true;
            } catch (RuntimeException e) {
                System.out.println("Your ID Must Contain Numbers Only\nAlso, the Length of Your ID must be 9");
                userID = console.readLine("Please Enter a Valid ID: ");
            } catch (IllegalActionException e) {
                System.out.println("Your ID Must be Unique!!");
                userID = console.readLine("Please Enter a Valid ID: ");
            }
        }
        System.out.print("Enter your password: ");
        String professorPassword = console.readLine("Enter your password: ");
        boolean validPassword = false;
        while (!validPassword) {
            try {
                if (!Pattern.matches("^(?=.*[#$@!%&*?])(?=.*\\d)[A-Za-z\\d#$@!%&*?]{8,}$", professorPassword)) {
                    throw new RuntimeException();
                }
                validPassword = true;
            } catch (RuntimeException e) {
                System.out.println("Your Password isn't Strong Enough");
                professorPassword = console.readLine("Please Choose a Strong Password: ");
            }
        }

        String professorConfirmPassword = console.readLine("Confirm your password: ");
        boolean isSame = false;
        while (!isSame) {
            try {
                if (!professorConfirmPassword.equals(professorPassword)) {
                    throw new RuntimeException();
                }
                isSame = true;
            } catch (RuntimeException e) {
                System.out.println("The Passwords You Entered aren't Same!");
                console.readLine("Confirm Your Password: ");
            }
        }
        if (role == Role.Student) {
            Student student = new Student(userID, userFirstName, userLastName);
            ObjectMapper mapper = new ObjectMapper();
            File file = new File("Students.json");
            List<Student> students = mapper.readValue(file, new TypeReference<>() {
            });
            students.add(student);
            mapper.writerWithDefaultPrettyPrinter().writeValue(file, students);
        } else if (role == Role.Professor) {
            Professor professor = new Professor(userFirstName, userLastName, userID);
            ObjectMapper mapper = new ObjectMapper();
            File file = new File("Professors.json");
            List<Professor> professors = mapper.readValue(file, new TypeReference<>() {
            });
            professors.add(professor);
            mapper.writerWithDefaultPrettyPrinter().writeValue(file, professors);
        }
    }

    private static boolean checkIfUnique(String id, Role role) {
        File file;
        if (role == Role.Professor) {
            file = new File("Professors.json");
        } else {
            file = new File("Students.json");
        }
        try {
            ObjectMapper mapper = new ObjectMapper();
            List<Professor> professors = mapper.readValue(file, new TypeReference<>() {
            });
            for (Professor professor : professors) {
                if (professor.getId().equals(id)) {
                    return false;
                }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return true;
    }

    private static String userLogin(Role role) throws Exception {
        clearScreen();
        boolean validUsername = false;
        String professorId = console.readLine("Enter Your ID Please: ");
        while (!validUsername) {
            try {
                if (!Pattern.matches("[0-9]{9}", professorId)) {
                    throw new RuntimeException();
                }
                validUsername = true;
            } catch (RuntimeException e) {
                System.out.println("Your ID is Invalid!!");
                professorId = console.readLine("Please Enter a Valid ID: ");
            }
        }
        boolean validPassword = false;
        String professorPassword = console.readLine("Enter Your Password Please: ");
        while (!validPassword) {
            try {
                if (professorPassword.length() < 8) {
                    throw new RuntimeException();
                }
                validPassword = true;
            } catch (RuntimeException e) {
                System.out.println("Your Password Must Be AtLeast 8 Characters!!");
                professorPassword = console.readLine("Please Enter a Valid Password: ");
            }
        }
        // TODO : checking if login is valid
        return professorId;
    }


    private static void professorChooseAction(String professorID) throws Exception {
        System.out.println("1-Add Task");
        System.out.println("2-Remove Task");
        System.out.println("3-Score student");
        System.out.println("4-Score Task");
        int userNumber = Integer.parseInt(console.readLine("What Action do You Want to Do: "));
        boolean validNumber = false;
        while (!validNumber) {
            try {
                if (userNumber < 1 || userNumber > 4) {
                    throw new RuntimeException();
                }
                validNumber = true;
            } catch (Exception e) {
                System.out.print("please choose valid number:");
                userNumber = Integer.parseInt(console.readLine("Please Choose Valid Number: "));
            }
        }
        switch (userNumber) {
            case 1:
                professorTaskAction(Situation.Add);
                break;
            case 2:
                professorTaskAction(Situation.Remove);
                break;
            case 3:
                professorScoreStudent();
                break;
            case 4:
                professorScoreTask();
        }
    }

    private static void adminCreateCourse() throws Exception {
        System.out.println("Complete Course Information Please");
        String courseID = console.readLine("Course ID: ");
        validateID(courseID);
        String professorID = console.readLine("Professor ID: ");
        validateID(professorID);
        String courseName = console.readLine("Course Name: ");
        int semesterInt = Integer.parseInt(console.readLine("Enter Semester Number: "));
        boolean validSemester = false;
        while (!validSemester) {
            try {
                if (semesterInt < 1 || semesterInt > 8) {
                    throw new RuntimeException();
                }
                validSemester = true;
            } catch (Exception e) {
                semesterInt = Integer.parseInt(console.readLine("Enter a Valid Semester Number: "));
            }
        }
        Semester semester = switch (semesterInt) {
            case 1 -> Semester.ONE;
            case 2 -> Semester.TWO;
            case 3 -> Semester.THREE;
            case 4 -> Semester.FOUR;
            case 5 -> Semester.FIVE;
            case 6 -> Semester.SIX;
            case 7 -> Semester.SEVEN;
            case 8 -> Semester.EIGHT;
            default -> throw new IllegalStateException("Unexpected value: " + semesterInt);
        };
        int unitNum = Integer.parseInt(console.readLine("Unit Number: "));
        Course course = new Course(courseID, courseName, new Professor(professorID), semester, unitNum);
        // TODO : Adding course info to file
        System.out.println("Course Added Successfully!!");
    }

    private static void validateID(String professorID) {
        boolean validId = false;
        while (!validId) {
            try {
                if (!Pattern.matches("[0-9]{9}", professorID)) {
                    throw new UsernameInvalidException();
                }
                validId = true;
            } catch (UsernameInvalidException e) {
                professorID = console.readLine("Enter a Valid ID: ");
            }
        }
    }

    private static void professorTaskAction(Situation situation) {
        String taskId = console.readLine("Enter Task ID: ");
        if (situation == Situation.Remove) {
            // TODO
        } else {
            System.out.print("Write Some Info about Task Deadline");
            int day = Integer.parseInt(console.readLine("Days: "));
            int hour = Integer.parseInt(console.readLine("Hours: "));
            Task task = new Task(taskId, day, hour);
        }
    }

    private static void professorScoreStudent() {
        // TODO
    }

    private static void professorScoreTask() {
        // TODO
    }
}