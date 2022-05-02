package airtrip.airtrip.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.relational.core.mapping.Table;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table("Review")
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long reviewId;
    private int rate;
    private String content;
    private String dateSubmit;

    @ManyToOne
    @JoinColumn(name = "placeId")
    private Place place;

    @ManyToOne
    @JoinColumn(name = "accountId")
    private Account account;

    @OneToMany(mappedBy = "review", cascade = CascadeType.ALL)
    private List<ReviewReaction> reviewReactions;
}
