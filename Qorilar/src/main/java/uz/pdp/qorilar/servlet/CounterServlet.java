package uz.pdp.qorilar.servlet;

import uz.pdp.qorilar.entity.Counter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/counter")
public class CounterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String plus = req.getParameter("plus");
        String nol = req.getParameter("nol");
        if (plus != null && !plus.isEmpty()) {
            Counter.counter ++;
        } else if (nol != null && !nol.isEmpty()) {
            Counter.counter = 0;
        }

        String categoryName = req.getParameter("categoryName");
        resp.sendRedirect("/?categoryName=" + categoryName);
    }
}
