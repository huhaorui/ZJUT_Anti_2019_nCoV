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
import java.sql.SQLException;

@WebServlet(name = "DestroyHealthCodeServlet", urlPatterns = "/DestroyHealthCode")
public class DestroyHealthCodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = DatabaseProvider.getConn();
        String id = request.getParameter("id");
        String token = request.getParameter("token");
        try {
            PreparedStatement sql = conn.prepareStatement("update health_code_token set used='true' where uid=? and token=?");
            sql.setString(1, id);
            sql.setString(2, token);
            sql.execute();
            sql.close();
            response.sendRedirect("check_health_code.jsp?id=" + id + "&token=" + token);
            conn.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
}
