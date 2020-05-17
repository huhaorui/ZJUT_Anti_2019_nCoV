package servlet;

import conn.DatabaseProvider;
import model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

/**
 * @author wcf
 */

@WebServlet(name = "controller", urlPatterns = {"/action"})
public class Controller extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = DatabaseProvider.getConn();
        response.getWriter().write("hello world");
        new SQL().query(Teacher.class, "000000");
        new SQL().query(Student.class, "000000");
        new SQL().query(Admin.class, "000000");
        new SQL().query(Major.class, "000000");
        new SQL().query(Collage.class, "000000");
        new SQL().query(Clazz.class, "000000");
        new SQL().query(PunchRecord.class, "000000");
        new SQL().query(HealthInfo.class, "000000");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
