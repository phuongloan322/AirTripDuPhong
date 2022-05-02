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
@Table("DetailPlace")
public class DetailPlace {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long detailId;
    private int phongkhach;
    private int phongngu;
    private int giuong;
    private int phongvs;

    @OneToMany(mappedBy = "detailPlace", cascade = CascadeType.ALL)
    private List<Place> placeList;
}
