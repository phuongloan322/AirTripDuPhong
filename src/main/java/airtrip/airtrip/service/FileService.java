package airtrip.airtrip.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
@Slf4j
public class FileService {


    private static final Path CURRENT_FOLDER = Paths.get(System.getProperty("user.dir"));
    public static final String FOLDER_IMAGE_PREFIX = "asset/images";

    /**
     * @param request
     * @param image
     * @return name image
     */
    public String saveImage(HttpServletRequest request, MultipartFile image) throws Exception {
        Path staticPath = Paths.get("src/main/resources/static");
        Path imagePath = Paths.get("images");
        if (!Files.exists(CURRENT_FOLDER.resolve(staticPath).resolve(imagePath))) {
            Files.createDirectories(CURRENT_FOLDER.resolve(staticPath).resolve(imagePath));
        }
        Path file = CURRENT_FOLDER.resolve(staticPath)
                .resolve(imagePath).resolve(image.getOriginalFilename());

        String name = image.getOriginalFilename();
        try (OutputStream os = Files.newOutputStream(file)) {
            os.write(image.getBytes());
            return "/" + FOLDER_IMAGE_PREFIX + "/" + name;
        } catch (Exception e) {
            log.error("saveImage {}", e.getMessage());
            return null;
        }
    }

    public String saveImageToServer(HttpServletRequest request, MultipartFile image) {
        String uploadRootPath = request.getServletContext().getRealPath("asset/images");

        File uploadRootDir = new File(uploadRootPath);
        //
        // Tạo thư mục gốc upload nếu nó không tồn tại.
        if (!uploadRootDir.exists()) {
            uploadRootDir.mkdirs();
        }

        // Tên file gốc tại Client.
        String name = image.getOriginalFilename();

        if (name != null && name.length() > 0) {
            try {
                // Tạo file tại Server.
                File serverFile = new File(uploadRootDir.getAbsolutePath() + File.separator + name);

                // Luồng ghi dữ liệu vào file trên Server.
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(image.getBytes());
                stream.close();
                //
                System.out.println("Write file: " + serverFile);
            } catch (Exception e) {
                System.out.println("Error Write file: " + name);
            }
        }
        return name;
    }
}
