package Cli.src;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.Exchanger;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ClientHandler {
    private static final ObjectMapper mapper = new ObjectMapper();
    public static void main(String[] args) {
        Exchanger<Socket> exchanger = new Exchanger<>();
        try (ServerSocket serverSocket = new ServerSocket(8000);
             ExecutorService service = Executors.newCachedThreadPool()) {
            service.execute(() -> {
                while (true) {
                    try {
                        Socket socket = serverSocket.accept();
                        exchanger.exchange(socket);
                    } catch (IOException | InterruptedException e) {
                        throw new RuntimeException(e);
                    }
                }
            });
            service.execute(() -> {
                while (true) {
                    try (Socket socket = exchanger.exchange(null);
                         DataInputStream dis = new DataInputStream(socket.getInputStream());
                         DataOutputStream dos = new DataOutputStream(socket.getOutputStream())) {
                        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(dis));

                        String answer = "";
                        int ch = dis.read();
                        while (ch != 0) {
                            answer += (char) ch;
                            ch = dis.read();
                        }
                        String[] info = answer.split("/");
                        for (String a : info) {
                            System.out.println(a);
                        }
                        if (Objects.equals(info[0], "work")) {

                        } else if (Objects.equals(info[0], "practice")) {

                        } else if (info[0].equals("class")) {

                        } else if (info[0].equals("signup")) {
                            userSignup(info[1], info[2]);
                        } else if (info[0].equals("login")) {
                            if (!userLogin(info[1], info[2])) {
                                dos.writeBytes("error");
                                dos.flush();
                            } else {
                                dos.writeBytes("OK");
                                dos.flush();
                            }
                        }
                        System.out.println(answer);

                    } catch (IOException | InterruptedException e) {
                        throw new RuntimeException(e);
                    }

                }

            });
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
    private static void userSignup(String username, String userPassword) throws IOException {
        Student student = new Student(username, userPassword);
        File file = new File("Students.json");
        List<Student> students = mapper.readValue(file, new TypeReference<>() {
        });
        students.add(student);
        mapper.writerWithDefaultPrettyPrinter().writeValue(file, students);
    }

    private static boolean userLogin(String username, String userPassword) throws IOException {
        File file = new File("Students.json");
        List<Student> students = mapper.readValue(file, new TypeReference<>() {
        });
        for (Student student: students) {
            if (student.getID().equals(username) && student.getPassword().equals(userPassword)) {
                return true;
            }
        }
        return false;
    }
}

