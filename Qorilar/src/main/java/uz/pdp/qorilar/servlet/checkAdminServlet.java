package uz.pdp.qorilar.servlet;

import uz.pdp.qorilar.entity.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/checkLogin")
public class checkAdminServlet extends HttpServlet {
    private final String ADMIN = "admin";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("admin");
        String password = req.getParameter("password");

        if (name.equalsIgnoreCase(ADMIN) && password.equalsIgnoreCase(ADMIN)) {
            Admin admin = new Admin(name, password);
            HttpSession session = req.getSession();
            session.setAttribute(ADMIN, admin);
            resp.sendRedirect("/admin.jsp");
            return;
        }
        resp.sendRedirect("/Login.jsp");
    }
}
