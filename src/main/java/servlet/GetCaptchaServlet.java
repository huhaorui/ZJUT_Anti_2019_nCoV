package servlet;

import conn.DatabaseProvider;
import org.jetbrains.annotations.NotNull;
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

@WebServlet(name = "GetCaptchaServlet", urlPatterns = "/getCaptcha")
public class GetCaptchaServlet extends HttpServlet {
    private String getCode() {
        StringBuilder code = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            int n = (int) (Math.random() * 10);
            code.append(n);
        }
        return code.toString();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Connection conn = DatabaseProvider.getConn();
        try {
            PreparedStatement sql = conn.prepareStatement("select * from admin where id=? and password=? and level>=8");
            sql.setString(1, id);
            sql.setString(2, password);
            ResultSet result = sql.executeQuery();
            if (result.next()) {
                String code = getCode();
                sql = conn.prepareStatement("insert into captcha values(?,?)");
                sql.setString(1, request.getSession().getId());
                sql.setString(2, code);
                sql.execute();
                Mail.captcha(code, email);
            } else {
                response.setStatus(403);
                sql.close();
                result.close();
                result.close();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
