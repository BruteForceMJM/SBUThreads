import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.net.Socket;

public class ClientHandler extends Thread{
    private Socket socket;
    private Situation role;
    private String address ;
    public ClientHandler(Socket socket,Situation role,String address){
        this.socket=socket;
        this.role=role;
        this.address=address;
        this.start();
    }

    @Override
    public void run() {
        File file=new File(address);
        try(DataInputStream dis=new DataInputStream(socket.getInputStream());
            DataOutputStream dos=new DataOutputStream(socket.getOutputStream());
            ){
            StringBuilder request=new StringBuilder();
            int character=dis.read();
            while(character !=0){
                request.append((char)character);
                character=dis.read();
            }
            System.out.println(request);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
