import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

public class Task {
    protected double score;
    protected String id;
    protected LocalDateTime deadline;
    protected boolean isAvailable;

    public Task(String id, int days, int hours, int minutes) {
        this(id, days, hours);
        deadline = deadline.plusMinutes(minutes);
    }

    public Task(String id, int days, int hours) {
        deadline = LocalDateTime.now().plusDays(days)
                .plusHours(hours);
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Task task = (Task) o;
        return Objects.equals(id, task.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    public void setDeadline(LocalDateTime deadline) {
        this.deadline = deadline;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }

    public void showTime() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss a");
        String time = deadline.format(formatter);
        System.out.println(time);
    }
}