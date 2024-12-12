package uz.pdp.qorilar.servlet;

import uz.pdp.qorilar.entity.Surah;
import uz.pdp.qorilar.repo.SurahRepo;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/file/get2")
public class FileDownloadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String audioId = request.getParameter("audioId");
        if (audioId == null || audioId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Audio ID is missing");
            return;
        }


        Surah surah = SurahRepo.getSurah(Integer.parseInt(audioId));
        if (surah == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
            return;
        }

        response.setContentType("audio/mpeg");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + surah.getName() + "\"");

        byte[] audioBytes = surah.getContent();
        response.setContentLength(audioBytes.length);

        try (OutputStream out = response.getOutputStream()) {
            out.write(audioBytes);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
