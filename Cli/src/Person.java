package Cli.src;

public class Person {
    private String ID;
    private String password;
    private String firstName;
    private String LastName;

    public Person() {

    }

    public Person(String ID) {
        this.ID = ID;
    }

    public Person(String ID, String password, String firstName, String lastName) {
        this.ID = ID;
        this.password = password;
        this.firstName = firstName;
        LastName = lastName;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String lastName) {
        LastName = lastName;
    }

    @Override
    public String toString() {
        return "Student{" +
                "LastName='" + getLastName() + '\'' +
                ", firstName='" + getFirstName() + '\'' +
                ", ID='" + getID() + '\'' +
                '}';
    }
}
