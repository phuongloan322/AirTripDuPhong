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
@Table("BookRoom")
public class BookRoom {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long bookId;
    private String startDay;
    private String endDay;
    private long totalPrice;
    private int people;

    @ManyToOne
    @JoinColumn(name = "placeId")
    private Place place;

    @ManyToOne
    @JoinColumn(name = "accountId")
    private Account account;

    private int isAccept;
    private Boolean isReview;
    private Boolean isPayment;

    @OneToMany(mappedBy = "bookRoom", cascade = CascadeType.ALL)
    private List<CancelBook> cancelBookList;
}
