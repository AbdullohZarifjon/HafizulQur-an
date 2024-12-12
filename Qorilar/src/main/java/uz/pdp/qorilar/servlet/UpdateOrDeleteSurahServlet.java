package uz.pdp.qorilar.servlet;

import uz.pdp.qorilar.repo.SurahRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateOrDelete")
public class UpdateOrDeleteSurahServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("surahId");
        String qoriId = req.getParameter("qoriId");
        String why = req.getParameter("why");
        String name = req.getParameter("name");

        if (why.equals("delete")) {
            SurahRepo.deleteSurah(Integer.parseInt(id));
            resp.sendRedirect("/updateForSurah.jsp?qoriId=" + qoriId);
            return;
        } else {
            if (name != null && !name.isEmpty()) {
                SurahRepo.updateNameById(Integer.parseInt(id), name);
                resp.sendRedirect("/updateForSurah.jsp?qoriId=" + qoriId);
                return;
            } else {
                resp.sendRedirect("/updateForSurah.jsp?qoriId=" + qoriId);
                return;
            }
        }
    }
}
