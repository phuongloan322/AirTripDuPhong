package airtrip.airtrip.service;

import airtrip.airtrip.entity.CancelBook;
import airtrip.airtrip.repository.CancelBookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CancelBookService {

    @Autowired
    private CancelBookRepository cancelBookRepository;

    public void save(CancelBook cancelBook) {
        cancelBookRepository.save(cancelBook);
    }

    public CancelBook findByBookId(long bookId) {
        return this.cancelBookRepository.findByBookId(bookId);
    }

}
