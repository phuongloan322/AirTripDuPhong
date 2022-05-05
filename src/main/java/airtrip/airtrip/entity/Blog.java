package airtrip.airtrip.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Blog")
public class Blog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long blogId;

    @ManyToOne
    @JoinColumn(name = "accountId")
    private Account account;

    private String title;
    private String content;
    private String createDate;
    private String image;
}
