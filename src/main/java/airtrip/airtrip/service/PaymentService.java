package airtrip.airtrip.service;

import airtrip.airtrip.entity.Payment;
import airtrip.airtrip.repository.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
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

}
