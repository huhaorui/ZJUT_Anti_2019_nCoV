package servlet;

import conn.DatabaseProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = null, password = null, name = null;
        Connection conn = DatabaseProvider.getConn();
        request.setCharacterEncoding("UTF-8");
        if (request.getParameter("user") != null && request.getParameter("user").equals("admin")) {
            if (request.getParameter("id") != null) {
                id = request.getParameter("id");
                response.getWriter().println(id);
            }
            if (request.getParameter("password") != null) {
                password = request.getParameter("password");
                response.getWriter().println(password);
            }
            PreparedStatement sql = null;
            try {
                sql = conn.prepareStatement("select * from admin where id=? and password=?");
                sql.setString(1, id);
                sql.setString(2, password);
                ResultSet result = sql.executeQuery();
                if (result.next()) {
                    request.getRequestDispatcher("admin.jsp").forward(request, response);
                } else {
                    response.sendRedirect("error.jsp?user=admin");
                }
                result.close();
                sql.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } else {
            if (request.getParameter("id") != null) {
                id = request.getParameter("id");
                response.getWriter().println(id);
            }
            if (request.getParameter("password") != null) {
                password = request.getParameter("password");
                response.getWriter().println(password);
            }
            if (request.getParameter("name") != null) {
                name = request.getParameter("name");
                response.getWriter().println(name);
            }
            PreparedStatement sql = null;
            try {
                System.out.println(id + password + name);
                sql = conn.prepareStatement("select * from Teacher_Student where id=? and right(person_id,8)=? and name=?");
                sql.setString(1, id);
                sql.setString(2, password);
                sql.setString(3, name);
                ResultSet result = sql.executeQuery();
                if (result.next()) {
                    request.getRequestDispatcher("main.jsp").forward(request, response);
                } else {
                    response.sendRedirect("error.jsp?user=user");
                }
                result.close();
                sql.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}
