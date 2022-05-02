package airtrip.airtrip.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.relational.core.mapping.Table;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table("Category")
public class Category {

    @Id
    private String categoryId;
    private String name;

    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL)
    private List<LitleCategory> litleCategoryList;
}
