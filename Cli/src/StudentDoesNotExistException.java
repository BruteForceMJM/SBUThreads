package Cli.src;

public class StudentDoesNotExistException extends Exception{
    public StudentDoesNotExistException(String message){
        super(message);
    }
    public StudentDoesNotExistException(){
        super();
    }
}
