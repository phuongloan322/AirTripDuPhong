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
@Table("Place")
public class Place {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long placeId;
    private String name;

    @OneToMany(mappedBy = "place", cascade = CascadeType.ALL)
    private List<Image> images;

    private String address;
    private long price;
    private String phone;
    private String startDay;
    private String endDay;
    private String detail;
    private int numberPlace;
    private Boolean isEmpty;
    private Boolean isAccept;

    @ManyToOne
    @JoinColumn(name = "litleCategoryId")
    private LitleCategory litleCategory;

    @ManyToOne
    @JoinColumn(name = "detailId")
    private DetailPlace detailPlace;

    @ManyToOne
    @JoinColumn(name = "accountId")
    private Account account;

    @OneToMany(mappedBy = "place", cascade = CascadeType.ALL)
    private List<BookRoom> bookRooms;

    @OneToMany(mappedBy = "place", cascade = CascadeType.ALL)
    private List<Review> reviews;
}
