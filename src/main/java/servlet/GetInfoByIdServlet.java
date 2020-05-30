package servlet;

import conn.DatabaseProvider;
import model.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "GetInfoByIdServlet", urlPatterns = "/getInfoById")
public class GetInfoByIdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        try {
            PreparedStatement sql = DatabaseProvider.getConn().prepareStatement("select * from admin where id=? and password=?");
            sql.setString(1, admin.getId());
            sql.setString(2, admin.getPassword());
            ResultSet result = sql.executeQuery();
            if (result.next()) {
                sql = DatabaseProvider.getConn().prepareStatement("select id, class, name, person_id from view_teacher_student_full where id=? and type='学生'");
                sql.setString(1, id);
                result = sql.executeQuery();
                if (result.next()) {
                    String ans = "<br><p>姓名:" + result.getString("name") + "</p>\n" +
                            "<p>学号:" + result.getString("id") + "</p>\n" +
                            "<p>班级:" + result.getString("class") + "</p>\n";
                    response.getWriter().write(ans);
                } else {
                    response.getWriter().write("<p>未找到该学生</p>");
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
