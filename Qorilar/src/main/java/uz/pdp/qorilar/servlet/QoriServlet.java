package uz.pdp.qorilar.servlet;

import uz.pdp.qorilar.entity.Qori;
import uz.pdp.qorilar.repo.QoriRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@MultipartConfig
@WebServlet("/addQori")
public class QoriServlet extends HttpServlet {
    private final QoriRepo qoriRepo = new QoriRepo();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        Part image = req.getPart("image");

        if (name == null || name.isEmpty()) {
            req.setAttribute("qoriError", "Qori nomini to'ldirishingiz kerak.");
            req.getRequestDispatcher("/admin.jsp").forward(req, resp);
            return;
        }

        if (image == null || image.getSize() == 0) {
            req.setAttribute("qoriError", "Qori rasmni yuklashingiz kerak.");
            req.getRequestDispatcher("/admin.jsp").forward(req, resp);
            return;
        }

        String mimeType = image.getContentType();
        if (mimeType == null || !(mimeType.equals("image/jpeg") || mimeType.equals("image/png") || mimeType.equals("image/gif"))) {
            req.setAttribute("qoriError", "Faqat JPEG, PNG yoki GIF rasm fayllarini yuklash mumkin.");
            req.getRequestDispatcher("/admin.jsp").forward(req, resp);
            return;
        }

        Qori qori = new Qori(name, image.getInputStream().readAllBytes());
        qoriRepo.save(qori);

        resp.sendRedirect("/admin.jsp");
    }

}
