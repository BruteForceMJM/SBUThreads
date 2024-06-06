package Cli.src;

public class ProfessorNotFoundException extends RuntimeException{
    public ProfessorNotFoundException(String message){
        super(message);
    }
    public ProfessorNotFoundException(){
        super();
    }
}
