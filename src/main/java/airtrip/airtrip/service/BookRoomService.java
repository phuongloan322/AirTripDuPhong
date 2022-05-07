package airtrip.airtrip.service;

import airtrip.airtrip.entity.BookRoom;
import airtrip.airtrip.entity.Place;
import airtrip.airtrip.repository.AccountRepository;
import airtrip.airtrip.repository.BookRoomRepository;
import airtrip.airtrip.repository.PlaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class BookRoomService {

    @Autowired
    private BookRoomRepository bookRoomRepository;

    @Autowired
    private PlaceRepository placeRepository;

    @Autowired
    private AccountRepository accountRepository;

    public List<BookRoom> getBookRoom(long accThueId) {
        return this.bookRoomRepository.getBookRoomByAccountId(accThueId);
    }

    public BookRoom findById(long bookId) {
        return this.bookRoomRepository.findById(bookId).orElse(null);
    }

    public List<BookRoom> getBookRoomAcceptById(long accThueId, int isAccept, boolean isPayment) {
        return this.bookRoomRepository.getBookRoomAcceptById(accThueId, isAccept, isPayment);
    }

    public List<BookRoom> getBookRoomFinish(long accThueId, boolean isPayment) {
        return this.bookRoomRepository.getBookRoomFinish(accThueId, isPayment);
    }

    public List<BookRoom> getBookRoomAccept(long accId, boolean pay) {
        return this.bookRoomRepository.getBookRoomAccept(accId, pay);
    }

    public List<BookRoom> getBookRoomCancel(long accId, int isAccept) {
        return this.bookRoomRepository.getBookRoomCancel(accId, isAccept);
    }

    public List<BookRoom> getBookRoomAllAccept(long accId) {
        return this.bookRoomRepository.getBookRoomAllAccept(accId);
    }

    public void addBookRoom(BookRoom roombean) {
        this.bookRoomRepository.save(roombean);
    }

    public void deleteBookRoom(long bookId) {
        this.bookRoomRepository.deleteById(bookId);
    }

    public void acceptBookRoom(long bookId, int isAccept) {
        BookRoom bookRoom = this.bookRoomRepository.findById(bookId).orElse(null);
        bookRoom.setIsAccept(isAccept);
        this.bookRoomRepository.save(bookRoom);
    }

    @Transactional(rollbackFor = Exception.class)
    public void isReviewBookRoom(long bookId) {
        BookRoom bookRoom = bookRoomRepository.findById(bookId).orElseThrow(RuntimeException::new);
        bookRoom.setIsReview(true);
    }

    @Transactional(rollbackFor = Exception.class)
    public void isPayment(long bookId) {
        BookRoom bookRoom = bookRoomRepository.findById(bookId).orElseThrow(RuntimeException::new);
        bookRoom.setIsPayment(true);
        this.bookRoomRepository.save(bookRoom);
    }

    public long daysBetween2Dates(String startDay, String endDay) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        Date currentDate = new Date();
        Date date1 = null;
        Date date2 = null;
        long getDaysDiff = 0;

        try {
            date1 = simpleDateFormat.parse(startDay);
            date2 = simpleDateFormat.parse(endDay);

            long getDiff = date2.getTime() - date1.getTime();

            getDaysDiff = getDiff / (24 * 60 * 60 * 1000);
            if (getDaysDiff < 0) getDaysDiff = -getDaysDiff;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return getDaysDiff;
    }

    public List<BookRoom> getBookingByPlace(long placeId) {
        return this.bookRoomRepository.getBookingByPlace(placeId);
    }

    public List<BookRoom> getBookRoomCoomingSoon(long accountId, int i, boolean b) {
        return this.bookRoomRepository.getBookRoomCoomingSoon(accountId, i, b);
    }

    public List<BookRoom> getBookRoomCheckoutSoon(long accountId, int i, boolean b) {
        return this.bookRoomRepository.getBookRoomCheckoutSoon(accountId, i, b);
    }

    public List<BookRoom> getBookRoomByFinish(long accountId, int i, boolean b) {
        return this.bookRoomRepository.getBookRoomByFinish(accountId, i, b);
    }

    public List<BookRoom> getBookRoomCancelHost(long accountId, int i) {
        return this.bookRoomRepository.getBookRoomCancelHost(accountId, i);
    }

    public BookRoom getBookRoomById(long bookId) {
        return this.bookRoomRepository.findById(bookId).orElse(null);
    }

    public List<BookRoom> getBookRoomByAccount(long accountId) {
        return this.bookRoomRepository.getBookRoomByAccount(accountId);
    }

    public Page<BookRoom> findBookRoomByPaginatedAdmin(int pageNo, String search, String filter, String status, int pageSize) {
        Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
        if(filter == "" && search != "") {
            return this.bookRoomRepository.searchAll(search, pageable);
        }
        else if(filter != "") {
            if(filter.equals("danhmuc")) {
                String[]a = status.split("/");
                System.out.println(a[0]);
                System.out.println(a[1]);
                return this.bookRoomRepository.searchStatus(Integer.parseInt(a[0]),Boolean.parseBoolean(a[1]), pageable);
            } else if(filter.equals("date")) {
                return this.bookRoomRepository.searchDate(search, pageable);
            } else if(filter.equals("price")) {
                return this.bookRoomRepository.serachPrice(Long.parseLong(search) - 50, Long.parseLong(search) + 50, pageable);
            } else if(filter.equals("price asc")) {
                return this.bookRoomRepository.searchASC(search,pageable);
            } else if(filter.equals("price desc")) {
                return this.bookRoomRepository.searchDESC(search,pageable);
            }
        }
        return this.bookRoomRepository.getBookRoomAllAdmin(pageable);
    }

    public List<BookRoom> getAllBookRoom() {
        return this.bookRoomRepository.findAll();
    }
}

