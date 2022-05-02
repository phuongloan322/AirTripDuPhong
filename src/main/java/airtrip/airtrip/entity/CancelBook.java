package airtrip.airtrip.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.relational.core.mapping.Table;

import javax.persistence.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table("CancelBook")
public class CancelBook {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long cancelId;

    private String reason;

    @ManyToOne
    @JoinColumn(name = "bookId")
    private BookRoom bookRoom;

    private String createTime;

}
