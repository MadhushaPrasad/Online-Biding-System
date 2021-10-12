package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig(location = "D:\\SLIIT\\Computing\\2nd Year\\1st Sem\\OOP\\Online-Biding-System\\src\\main\\webapp\\assets\\uploadImg",
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet("/upload")
public class imagePuloadTest extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part part = req.getPart("file");
        String fileName = extractFileName(part);
        String filePath = "D:\\SLIIT\\Computing\\2nd Year\\1st Sem\\OOP\\Online-Biding-System\\src\\main\\webapp\\assets\\uploadImg";

        if (fileName != "") {
            String savePath = filePath + File.separator + fileName;
            File fileSaveDir = new File(savePath);
            part.write(savePath);
            System.out.println(savePath + File.separator);
            System.out.println("Saved Path" + savePath);
            System.out.println("Sep Fil" + File.separator);
        }


    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] item = contentDisp.split(";");
        for (String s : item) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}

