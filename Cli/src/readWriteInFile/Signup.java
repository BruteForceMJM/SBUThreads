package readWriteInFile;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

import javax.management.relation.Role;

public class Signup {
    //the role will check if userid and role is correct or not
    public void signupStudent(LoginRole role, String userName, String userPassword, String userId, String StudentsAddress) throws IOException {
        File studentFile = new File(StudentsAddress);
        try (Scanner readStudentFile = new Scanner(studentFile);
             FileOutputStream fileOutputStream =new FileOutputStream(studentFile,true);
             OutputStreamWriter outputStreamWriter = new OutputStreamWriter(fileOutputStream , StandardCharsets.UTF_8);
             BufferedWriter bufferedWriter=new BufferedWriter(outputStreamWriter);
             PrintWriter printWriter=new PrintWriter(bufferedWriter , true)) {
            boolean isExist = false;
            while (readStudentFile.hasNextLine()) {
                String checkUserName = readStudentFile.nextLine().split(" ")[0];
                String studentIdCheck = readStudentFile.nextLine().split(" ")[2];
                if (checkUserName.equals(userName)) {
                    isExist = true;
                }
                if (studentIdCheck.equals(userId)) {
                    isExist = true;
                }
            }
            if (!role.equals(LoginRole.Student)){
                throw new StudentDoesntMathException();
            }
            if (!isExist) {
                printWriter.write(String.format("%s %s %s", userName, userPassword, userId));
            }
        }
    }

    public static void signupTeacher(String userFirstName,String userLastName,LoginRole role, String userName, String userPassword, String userId, String TeacherAddress) throws IOException {
        File teacherFile = new File(TeacherAddress);
        try (Scanner readTeacherFile = new Scanner(teacherFile);
             FileOutputStream fileOutputStream =new FileOutputStream(teacherFile,true);
             OutputStreamWriter outputStreamWriter = new OutputStreamWriter(fileOutputStream , StandardCharsets.UTF_8);
             BufferedWriter bufferedWriter=new BufferedWriter(outputStreamWriter);
             PrintWriter printWriter=new PrintWriter(bufferedWriter , true)) {
            boolean isExist = false;
            if(teacherFile.length()!=0){
                while (readTeacherFile.hasNextLine()) {
                    String[] phrase= readTeacherFile.nextLine().split(" ");
                    if(phrase.length>1){
                        String checkUserId = phrase[0];
                        String studentIdCheck = phrase[2];
                        if (checkUserId.equals(userId)) {
                            isExist = true;
                        }
                        if (studentIdCheck.equals(userId)) {
                            isExist = true;
                        }
                    }
                }
            }

            if(!role.equals(LoginRole.Proffesor)){
                throw new ProfessorDoesntMatchException();
            }
            if (!isExist) {
                printWriter.write(String.format("%s %s %s %s\n", userId, userPassword, userFirstName,userLastName));
            }
        }
    }
}
