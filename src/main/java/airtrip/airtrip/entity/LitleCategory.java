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
@Table("LitleCategory")
public class LitleCategory {

    @Id
    private String litleCategoryId;
    private String litleName;
    private String detail;

    @ManyToOne
    @JoinColumn(name = "categoryId")
    private Category category;

    @OneToMany(mappedBy = "litleCategory", cascade = CascadeType.ALL)
    private List<Place> placeList;
}
