import java.time.LocalDateTime;
import java.util.Objects;

public class Project extends Task {
    public Project(String id, int days, int hours, int minutes) {
        this(id, days, hours);
        deadline = deadline.plusMinutes(minutes);
    }

    public Project(String id, int days, int hours) {
        super(id, days, hours);
        deadline = LocalDateTime.now().plusDays(days)
                .plusHours(hours);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Project project = (Project) o;
        return Objects.equals(id, project.id);
    }
}
