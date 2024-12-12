package uz.pdp.qorilar.servlet;

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
@WebServlet("/updateQori")
public class UpdateQoriServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        Part part = req.getPart("image");
        int qoriId = Integer.parseInt(req.getParameter("qoriId"));

        QoriRepo.updateQori(qoriId, name, part);
        resp.sendRedirect("/updateForHafiz.jsp");
    }
}
