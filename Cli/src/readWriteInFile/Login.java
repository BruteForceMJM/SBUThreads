package readWriteInFile;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Pattern;

public class Login {
    public static List<Boolean> login(String userNameId, String Password, String address) throws FileNotFoundException {
        //this code check if the value is username or userId
        File file = new File(address);
        boolean isExist =false;
        boolean isPasswordCorrect =false;
        try (var in = new FileInputStream(file);
             var bufferedReader = new BufferedReader(new InputStreamReader(in));
             Scanner readFile = new Scanner(bufferedReader)) {
            while (readFile.hasNextLine()) {
                String phrase =readFile.nextLine();
                if (phrase.length()>1){
                    String firstCheck = phrase.split(" ")[0];
                    String passwordCheck = phrase.split(" ")[1];
                    if (firstCheck.equals(userNameId)) {
                        isExist=true;
                        if(passwordCheck.equals(Password)){
                            isPasswordCorrect=true;
                        }
                    }
                }

            }
        } catch (IOException e) {
            e.getCause();
        }

        return Arrays.asList(isExist , isPasswordCorrect);
    }
}
