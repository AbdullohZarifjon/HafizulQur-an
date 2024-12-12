package uz.pdp.qorilar.servlet;

import uz.pdp.qorilar.entity.Qori;
import uz.pdp.qorilar.entity.Surah;
import uz.pdp.qorilar.repo.SurahRepo;
import uz.pdp.qorilar.repo.QoriRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/file/get")
public class FileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("qoriId");
        String audioId = req.getParameter("audioId");
        if (id != null) {
            int qoriId = Integer.parseInt(id);
            Qori qori = QoriRepo.getQori(qoriId);
            resp.getOutputStream().write(qori.getImage());
            return;
        }
        if (audioId != null) {
            int surahId = Integer.parseInt(audioId);
            Surah surah = SurahRepo.getSurah(surahId);
            resp.getOutputStream().write(surah.getContent());
            return;
        }

    }
}
