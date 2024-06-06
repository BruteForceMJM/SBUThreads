package Cli.src;

public class illegalNumberException extends RuntimeException{
    public illegalNumberException(String message){
        super(message);
    }
    public illegalNumberException(){
        super();
    }
}
