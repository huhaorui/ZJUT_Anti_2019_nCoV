package servlet;

import util.Mail;
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
import java.util.UUID;

@WebServlet(name = "ForgetPasswordServlet", urlPatterns = "/forgetPassword")
public class ForgetPasswordServlet extends HttpServlet {
    String getResetLink(String email, HttpServletRequest request) {
        String id = null, token = null;
        String URL = "https://javaweb.huhaorui.com/" + request.getContextPath() + "/resetPassword?";
        Connection conn = DatabaseProvider.getConn();
        try {
            PreparedStatement sql = conn.prepareStatement("select id from admin where email=?");
            sql.setString(1, email);
            ResultSet result = sql.executeQuery();
            if (result.next()) {
                id = result.getString(1);
                token = UUID.randomUUID().toString().replace("-", "");
                URL += "id=" + id + "&token=" + token;
            }
            result.close();
            sql.close();
            sql = conn.prepareStatement("delete from password_reset where id=?");
            sql.setString(1, id);
            sql.execute();
            sql.close();
            sql = conn.prepareStatement("insert into password_reset(id, token) values(?,?)");
            sql.setString(1, id);
            sql.setString(2, token);
            sql.execute();
            sql.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return URL;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String email = request.getParameter("email");
        Connection conn = DatabaseProvider.getConn();
        try {
            PreparedStatement sql = conn.prepareStatement("select * from admin where id=? and email=?");
            sql.setString(1, id);
            sql.setString(2, email);
            ResultSet result = sql.executeQuery();
            if (!result.next()) {
                response.sendRedirect("forget_password.jsp?reset=error");
            } else {
                if (Mail.mail(getResetLink(email, request), email)) {
                    response.sendRedirect("forget_password.jsp?reset=ok");
                } else {
                    response.sendRedirect("forget_password.jsp?reset=error");
                }
            }
            result.close();
            sql.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("forget_password.jsp");
    }
}
