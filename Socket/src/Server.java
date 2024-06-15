import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
    public static void start() throws IOException{
        ServerSocket serverSocket=new ServerSocket(3000);
        while(true){
            Socket socket=serverSocket.accept();
            new ClientHandler(socket,Situation.Login,"");
        }
    }

    public static void main(String[] args) throws IOException {
        start();
    }
}
