package servlet;

import conn.DatabaseProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "resetPasswordServlet", urlPatterns = "/resetPassword")
public class resetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String token = request.getParameter("token");
        String password = request.getParameter("password");
        Connection conn = DatabaseProvider.getConn();
        try {
            PreparedStatement sql = conn.prepareStatement("select * from password_reset where id=? and token=?");
            sql.setString(1, id);
            sql.setString(2, token);
            ResultSet result = sql.executeQuery();
            if (result.next()) {
                sql = conn.prepareStatement("update admin set password=? where id=?");
                sql.setString(1, password);
                sql.setString(2, id);
                sql.execute();
                sql = conn.prepareStatement("delete from password_reset where id=?");
                sql.setString(1, id);
                sql.execute();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String token = request.getParameter("token");
        Connection conn = DatabaseProvider.getConn();
        try {
            PreparedStatement sql = conn.prepareStatement("select * from password_reset where id=? and token=?");
            sql.setString(1, id);
            sql.setString(2, token);
            ResultSet result = sql.executeQuery();
            if (result.next()) {
                request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
}