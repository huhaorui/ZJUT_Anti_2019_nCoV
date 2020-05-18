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
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        Connection conn = DatabaseProvider.getConn();
        var out = response.getWriter();
        var teacher = new SQL().query(Teacher.class, "id", "000000");
        var student = new SQL().query(Student.class, "id", "201806061108");
        var admin = new SQL().query(Admin.class, "id", "00000");
        var major = new SQL().query(Major.class, "id", "000000");
        var collage = new SQL().query(Collage.class, "id", "000000");
        var clazz = new SQL().query(Clazz.class, "id", "000000");
        var punchRecord = new SQL().query(PunchRecord.class, "id", "000000");
        var healthInfo = new SQL().query(HealthInfo.class, "id", "000000");
        out.write(String.format("%s<br>%s<br>%s<br>%s<br>%s<br>%s<br>%s<br>%s<br>", teacher, student, admin, major, collage, clazz, punchRecord, healthInfo));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
