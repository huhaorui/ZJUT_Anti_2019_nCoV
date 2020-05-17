package servlet;

import conn.DatabaseProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * @author wcf
 */

@WebServlet(name = "controller", urlPatterns = {"/action"})
public class Controller extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = DatabaseProvider.getConn();
        response.getWriter().write("hello world");
        try {
            var sql = conn.prepareStatement("insert into collage (id, name) values ('0606', '计算机科学与技术学院、软件学院')");
            sql.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
