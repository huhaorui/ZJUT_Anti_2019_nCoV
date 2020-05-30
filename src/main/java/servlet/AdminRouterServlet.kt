package servlet;

import model.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdminRouterServlet", urlPatterns = "/adminRouter")
public class AdminRouterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin admin;
        admin = (Admin) request.getSession().getAttribute("admin");
        if (admin == null || admin.equals(new Admin())) {
            response.sendRedirect("login.jsp?user=admin");
            return;
        }
        switch (admin.getLevel()) {
            case 9:
            case 8: {
                response.sendRedirect("system_admin.jsp");
                return;
            }
            case 5:
            case 4: {
                response.sendRedirect("school_admin.jsp");
                return;
            }
            case 3:
            case 2: {
                response.sendRedirect("college_admin.jsp");
                return;
            }
            case 1: {
                response.sendRedirect("scanner.jsp");
                return;
            }
            default: {
                response.sendRedirect("login.jsp?user=admin");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
