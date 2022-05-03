package airtrip.airtrip.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.relational.core.mapping.Table;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table("Account")
public class Account {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long accountId;

    private String name;
    private String address;
    private String phone;
    private String email;
    private String username;
    private String password;
    private String image;
    private String introduce;
    private Boolean isIdentity;
    private String createDate;
    private boolean enabled;

    @OneToMany(mappedBy = "account", cascade = CascadeType.ALL)
    private List<AccountRole> accountRoles;

    @OneToMany(mappedBy = "account", cascade = CascadeType.ALL)
    private List<BookRoom> bookRooms;

    @OneToMany(mappedBy = "account", cascade = CascadeType.ALL)
    private List<Place> places;

    @OneToMany(mappedBy = "account", cascade = CascadeType.ALL)
    private List<ReviewReaction> reviewReactions;

    @OneToMany(mappedBy = "account", cascade = CascadeType.ALL)
    private List<Review> reviews;
}
