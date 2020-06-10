package servlet;

import conn.DatabaseProvider;
import model.Admin;
import model.Person;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = null, password = null, name = null, person_id = null;
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Connection conn = DatabaseProvider.getConn();
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
                    int level = result.getInt("level");
                    int target = result.getInt("target");
                    String email = result.getString("email");
                    Admin admin = new Admin(id, level, target, password, email);
                    synchronized (request.getSession()) {
                        request.getSession().setAttribute("admin", admin);
                        request.getSession().setAttribute("person", new Person());
                    }
                    response.sendRedirect("admin/router");
                } else {
                    response.sendRedirect("login/error?user=admin");
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
                sql = conn.prepareStatement("select * from Teacher_Student where id=? and right(person_id,8)=? and name=?");
                sql.setString(1, id);
                sql.setString(2, password);
                sql.setString(3, name);
                ResultSet result = sql.executeQuery();
                if (result.next()) {
                    person_id = result.getString("person_id");
                    Person person = new Person(id, name, person_id);
                    synchronized (request.getSession()) {
                        request.getSession().setAttribute("person", person);
                        request.getSession().setAttribute("admin", new Admin());
                    }
                    response.sendRedirect("student/main");
                } else {
                    response.sendRedirect("login/error?user=student");
                }
                result.close();
                sql.close();
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("card") != null) {
            doPost(request, response);
            return;
        }
        response.sendRedirect("login/student");
    }
}
