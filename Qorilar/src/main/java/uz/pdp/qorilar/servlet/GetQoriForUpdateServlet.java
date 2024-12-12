package uz.pdp.qorilar.servlet;

import uz.pdp.qorilar.entity.Qori;
import uz.pdp.qorilar.repo.QoriRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/getQori")
public class GetQoriForUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String qoriId = req.getParameter("qoriId");
        if (qoriId == null || qoriId.isEmpty()) {
            req.setAttribute("qori", "Qori tanlashingiz kerak");
            req.getRequestDispatcher("/updateFor" + name + ".jsp").forward(req, resp);
            return;
        }
        Qori qori = QoriRepo.getQori(Integer.parseInt(qoriId));
        req.setAttribute("qori", qori);
        req.getRequestDispatcher("/updateFor" + name + ".jsp").forward(req, resp);
    }
}
