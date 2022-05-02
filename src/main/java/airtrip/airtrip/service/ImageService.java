package airtrip.airtrip.service;

import airtrip.airtrip.entity.Account;
import airtrip.airtrip.entity.Image;
import airtrip.airtrip.entity.Place;
import airtrip.airtrip.repository.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Service
public class ImageService {

    @Autowired
    private FileService fileService;

    @Autowired
    private PlaceService placeService;

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private AccountService accountService;

    public void saveImages(Place place, MultipartFile file, Account admin, HttpServletRequest request) {
        String name = fileService.saveImageToServer(request, file);
        if (name != null) {
            try {
                Image image = new Image();
                image.setName(name);
                image.setPlace(placeService.findById(placeService.GetIDLastPlace()));
                this.imageRepository.save(image);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    public void deleteById(long imageId) {
        this.imageRepository.deleteById(imageId);
    }

    public void updateImages(Place place, MultipartFile file, HttpServletRequest request) {
        if (!file.isEmpty()) {
            String name = fileService.saveImageToServer(request, file);
            if (name != null) {
                try {
                    Image image = new Image();
                    image.setName(name);
                    image.setPlace(place);
                    this.imageRepository.save(image);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Transactional
    public void updateImageAccount(Account account, MultipartFile file, HttpServletRequest request, String image) throws Exception {
        if (file.isEmpty()) {
            account.setImage(image);
            this.accountService.save((account));
        } else {
            String name = fileService.saveImageToServer(request, file);
            if (name != null) {
                try {
                    account.setImage(name);
                    this.accountService.save(account);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
