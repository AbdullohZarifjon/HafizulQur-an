package uz.pdp.qorilar.servlet;

import jakarta.persistence.EntityManager;
import uz.pdp.qorilar.MyListener;
import uz.pdp.qorilar.entity.Qori;
import uz.pdp.qorilar.entity.Surah;
import uz.pdp.qorilar.repo.SurahRepo;
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
@WebServlet("/addContent")
public class AddSurah extends HttpServlet {
    private final SurahRepo surahRepo = new SurahRepo();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String qoriId = req.getParameter("qoriId");
        Part surah = req.getPart("surah");
        String name = req.getParameter("name");

        if (name == null || name.isEmpty()) {
            name = surah.getSubmittedFileName();
        } else {
            name += ".mp3";
        }

        if (surah == null || surah.getSize() == 0) {
            req.setAttribute("contentError", "Surahni tanlashingiz kerak.");
            req.getRequestDispatcher("/admin.jsp").forward(req, resp);
            return;
        }

        String mimeType = surah.getContentType();
        if (mimeType == null || !mimeType.startsWith("audio/")) {
            req.setAttribute("contentError", "Faqat audio faylni yuklash mumkin.");
            req.getRequestDispatcher("/admin.jsp").forward(req, resp);
            return;
        }

        if (qoriId == null || qoriId.isEmpty()) {
            req.setAttribute("contentError", "Qori tanlashingiz kerak.");
            req.getRequestDispatcher("/admin.jsp").forward(req, resp);
            return;
        }

        int id = Integer.parseInt(qoriId);
        Qori qori = QoriRepo.getQori(id);
        Surah attachmentSurah = new Surah(name, surah.getInputStream().readAllBytes(), qori);

        surahRepo.save(attachmentSurah);
        resp.sendRedirect("/admin.jsp");
    }

}
