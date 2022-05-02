package airtrip.airtrip.entity;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.relational.core.mapping.Table;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table("Payment")
public class Payment {

    @Id
    private String paymentId;

    @ManyToOne
    @JoinColumn(name = "bookId")
    private BookRoom bookRoom;

    private String status;
    private String email;
    private String countryCode;
    private String postalCode;
    private float totalPrice;
    private float transactionFee;
    private String description;
    private String createTime;



}
