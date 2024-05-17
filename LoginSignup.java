package LoginSignUp;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Pattern;

public class LoginSignup {
    public static void main(String[] args) throws IOException {
        Scanner scanner=new Scanner(System.in);
        LoginSignup student1=new LoginSignup();
        int studentChosenMenuNumber =student1.chooseStartMenuOption();
        if(studentChosenMenuNumber ==1){
            student1.signUp("D:\\java-projects\\FinalProject\\Data.txt");
        }else{
            student1.logIn("D:\\java-projects\\FinalProject\\Data.txt");
        }
    }
    //this method will show 2 option signup and login and user choose one of them


    public int chooseStartMenuOption(){
        System.out.println("please choose one number:");
        System.out.println("1-SignUp  2-SignIn");
        Scanner scanner =new Scanner(System.in);
        boolean flag =false;
        int userChosenNumber =0;
        while(!flag){
            try{
                userChosenNumber = scanner.nextInt();
                if(userChosenNumber>2 || userChosenNumber<1){
                    throw new InvalidUserActionException();
                }
                flag =true;
            }catch(InvalidUserActionException e){
                System.out.println("please enter a valid number!!");
                System.out.println("1-SignUp  2-SignIn");
            }
        }
        System.out.println("-----------------------------");
        return userChosenNumber;
    }
    public void signUp(String address) throws IOException {
        String userName =signUpUserName();
        String userPassword=signUpPassword();
        String userId =signUPStudentId();
        check(userName,userId,userPassword,address);
    }
    public void check(String userName,String userId,String userPassword , String address) throws IOException {
        while(isExist(userName,userId,address)){
            try{
                throw new UserAlreadyExistException();
            }catch(UserAlreadyExistException e){
                System.out.println(e.getMessage());
                userName=signUpUserName();
                userPassword=signUpPassword();
                userId=signUPStudentId();
            }
        }
        File file = new File(address);
        try(FileWriter fileWriter=new FileWriter(file,true)){
            fileWriter.write(String.format("%s %s %s\n",userName ,userPassword,userId));
        }

    }
    public String signUpUserName(){
        Scanner scanner=new Scanner(System.in);
        System.out.print("*your username:");
        boolean flag=false;
        String userName = "";
        while(!flag){
            try{
                userName= scanner.next();
                boolean check = Pattern.matches("[0-9!@#$%]" ,String.valueOf(userName.charAt(0)));
                if(check){
                    throw new UserNameInvalidException();
                }
                flag=true;
            }catch(UserNameInvalidException e){
                System.out.println(e.getMessage());
                System.out.print("your username:");
            }

        }
        return userName;
    }
    public String signUpPassword(){
        Scanner scanner =new Scanner(System.in);
        System.out.print("*your password:");
        boolean flag =false;
        String userPassword="";
        while(!flag){
            try{
                userPassword= scanner.next();
                if(!Pattern.matches("^(?=.*[#$@!%&*?])(?=.*\\d)[A-Za-z\\d#$@!%&*?]{8,}$",userPassword)){
                    throw new PasswordException();
                }
                flag=true;
            }catch(PasswordException e){
                System.out.println(e.getMessage());
                System.out.print("*your password:");
            }
        }
        return userPassword;
    }
    public String signUPStudentId(){
        Scanner scanner=new Scanner(System.in);
        boolean flag=false;
        String userId="";
        while(!flag){
            try{
                System.out.println("*your student id:");
                userId =scanner.next();
                if(!Pattern.matches("[0-9]{9}",userId)){
                    throw new InvalidStudentIdException();
                }
                flag=true;
            }catch(InvalidStudentIdException e){
                System.out.println(e.getMessage());
                System.out.print("your student id:");
            }
        }
        return userId;
    }
    public static boolean isExist(String userName,String userId,String address) throws FileNotFoundException {
        File file =new File(address);
        try(Scanner readFile = new Scanner(file)){
            while(readFile.hasNextLine()){
                String[] informations = readFile.nextLine().split(" ");
                if(userId.equals(informations[2]) || userName.equals(informations[0])){
                    return true;
                }
            }
        }
        return false;
    }
    public void logIn(String address) throws FileNotFoundException {
        String userNameId =loginUserNameId();
        String userPassword =longInPassword();
        logInCheck(userNameId ,userPassword,address);
    }
    public void logInCheck(String userNameId , String userPassword,String address) throws FileNotFoundException {
        String userInformation = userNameId;
        int checkingNumber;
        if(Pattern.matches("[0-9]",userNameId)){
            checkingNumber =2;
        }else{
            checkingNumber =0;
        }
        while(!LoginIsExist(userNameId,address)){
            System.out.println("The account isn't exist!!");
            userInformation =userNameId = loginUserNameId();
        }
        File file =new File(address);
        boolean isPasswordMatched =false;
        try(Scanner readFile = new Scanner(file)){
            while(readFile.hasNextLine()){
                String[] information =readFile.nextLine().split(" ");
                if(information[1].equals(userPassword)){
                    isPasswordMatched=true;
                }
            }
            if(isPasswordMatched){
                System.out.printf("Welcome %s%n", userNameId);
            }else{
                System.out.println("your password isn't matched!!");
            }
        }
    }
    public static boolean LoginIsExist(String userNameId , String address) throws FileNotFoundException {
        int checkingNumber;
        if(Pattern.matches("[0-9]" , String.valueOf(userNameId.charAt(0)))){
            checkingNumber = 2;
        }else{
            checkingNumber = 0;
        }
        File file =new File(address);
        try(Scanner readFile = new Scanner(file)){
            while(readFile.hasNextLine()){
                String[] information = readFile.nextLine().split(" ");
                if(userNameId.equals(information[checkingNumber])){
                    return true;
                }
            }
        }
        return false;

    }
    public String loginUserNameId(){
        Scanner scanner=new Scanner(System.in);
        String userNameId="";
        System.out.print("*your username or id:");
        try{
            userNameId = scanner.next();
            if(Pattern.matches("[0-9]" , String.valueOf(userNameId.charAt(0)))) {
                boolean flag=false;
                while(!flag){
                    try{
                        System.out.println("*your student id:");
                        userNameId =scanner.next();
                        if(!Pattern.matches("[0-9]{9}",userNameId)){
                            throw new InvalidStudentIdException();
                        }
                        flag=true;
                    }catch(InvalidStudentIdException e){
                        System.out.println(e.getMessage());
                    }
                }
            }else{
                userNameId =signUpUserName();
            }
        }catch(InvalidUserActionException e){
            System.out.println(e.getMessage());
        }

    return userNameId;
    }
    public String longInPassword(){
        return signUpPassword();
    }

}



