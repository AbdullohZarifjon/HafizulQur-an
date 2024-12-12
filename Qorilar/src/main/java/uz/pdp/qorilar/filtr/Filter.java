package uz.pdp.qorilar.filtr;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebFilter("/*")
public class Filter extends HttpFilter {
    private List<String> filters = new ArrayList<>(List.of(
            "/",
            "/Login.jsp"
    ));
    private List<String> adminPage = new ArrayList<>(List.of(
            "/admin.jsp",
            "/updateForHafiz.jsp",
            "/updateForSurah.jsp",
            "/addQori",
            "/addContent",
            "/getQori",
            "/updateQori",
            "/updateOrDelete"
    ));

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        if (filters.contains(req.getRequestURI())) {
            chain.doFilter(req, res);
            return;
        }
        if (adminPage.contains(req.getRequestURI())) {
            Object object = req.getSession(false) != null ? req.getSession().getAttribute("admin") : null;
            if (object != null) {
                chain.doFilter(req, res);
            } else {
                res.sendRedirect("/");
            }
            return;
        }
        if (req.getRequestURI().startsWith("/file/get") || req.getRequestURI().startsWith("/file/get2")) {
            if (req.getParameter("audioId") != null || req.getParameter("qoriId") != null) {
                chain.doFilter(req, res);
            } else {
                res.sendRedirect("/");
            }
            return;
        }

        if (req.getRequestURI().startsWith("/counter")) {
            if (req.getParameter("plus") != null || req.getParameter("nol") != null) {
                chain.doFilter(req, res);
            } else {
                res.sendRedirect("/");
            }
            return;
        }

        if (req.getRequestURI().startsWith("/checkLogin")) {
            if (req.getParameter("admin") == null || req.getParameter("password") == null) {
                res.sendRedirect("/Login.jsp");
            } else {
                chain.doFilter(req, res);
            }
            return;
        }
        if (req.getRequestURI().startsWith("/QuronAudio.jsp")) {
            if (req.getParameter("qoriId") != null) {
                chain.doFilter(req, res);
            } else {
                res.sendRedirect("/");
            }
            return;
        }

    }
}
