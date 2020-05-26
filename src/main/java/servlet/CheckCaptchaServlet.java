package servlet;

import conn.DatabaseProvider;
import util.Mail;

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

@WebServlet(name = "CheckCaptchaServlet", urlPatterns = "/checkCaptcha")
public class CheckCaptchaServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Connection conn = DatabaseProvider.getConn();
        String session = request.getSession().getId();
        String captcha = request.getParameter("captcha");
        try {
            PreparedStatement sql = conn.prepareStatement("select * from captcha where session=? and captcha=?");
            sql.setString(1, session);
            sql.setString(2, captcha);
            ResultSet result = sql.executeQuery();
            if (!result.next()) {
                response.setStatus(403);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
