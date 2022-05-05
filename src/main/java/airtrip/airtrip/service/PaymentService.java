package airtrip.airtrip.service;

import airtrip.airtrip.entity.Payment;
import airtrip.airtrip.repository.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    public void save(Payment payment) {
        this.paymentRepository.save(payment);
    }

    public List<Payment> findAll() {
        return this.paymentRepository.findAll();
    }

    public Payment findById(String paymentId) {
        return this.paymentRepository.findById(paymentId).orElse(null);
    }

    public List<Payment> getPaymentByAccount(long accountId) {
        return this.paymentRepository.getPaymentByAccount(accountId);
    }

    public Payment getPaymentByBooking(long bookId) {
        return this.paymentRepository.getPaymentByBooking(bookId);
    }

    public List<Payment> getPaymentByAccountHost(long accountId) {
        return this.paymentRepository.getPaymentByAccountHost(accountId);
    }

    public List<Payment> getPaymentBySearchtHost(long accountId, int month1, int year1, int month2, int year2) {
        String startDate = year1+"-"+month1+"-1";
        String endDate = year2+"-"+month2+"-"+numberDate(month2, year2);
        System.out.println(startDate);
        System.out.println(endDate);
        return this.paymentRepository.getPaymentBySearchHost(accountId, startDate, endDate);
    }

    public int numberDate(int month, int year) {
        int date = 0;
        switch (month) {
            // các tháng 1, 3, 5, 7, 8, 10 và 12 có 31 ngày.
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                date = 31;
                break;

            // các tháng 4, 6, 9 và 11 có 30 ngày
            case 4:
            case 6:
            case 9:
            case 11:
                date = 30;
                break;

            // Riêng tháng 2 nếu là năm nhuận thì có 29 ngày, còn không thì có 28 ngày.
            case 2:
                if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
                    date = 29;
                } else {
                    date = 28;
                }
                break;
            }
            return date;
    }

    public Page<Payment> findPaymentByPaginatedAdmin(int pageNo, String search, String filter, int pageSize) {
        Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
        if(filter != "" ) {

        }
        return this.paymentRepository.getPaymentAllAdmin(pageable);
    }

    public List<Payment> getPaymentBySearchtAdmin(int month1, int year1, int month2, int year2) {
        String startDate = year1+"-"+month1+"-1";
        String endDate = year2+"-"+month2+"-"+numberDate(month2, year2);
        System.out.println(startDate);
        System.out.println(endDate);
        return this.paymentRepository.getPaymentBySearchAdmin(startDate, endDate);
    }
}
