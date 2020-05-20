package servlet;

import kotlin.Pair;
import model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author wcf
 */

@WebServlet(name = "controller", urlPatterns = {"/action"})
public class Controller extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        var out = response.getWriter();
        var teacher = new SQL().query(Teacher.class, new Pair<>("id", "000001"));
        var student = new SQL().query(Student.class, new Pair<>("id", "201806061108"));
        var admin = new SQL().query(Admin.class, new Pair<>("id", 1));
        var major = new SQL().query(Major.class, new Pair<>("id", 2));
        var collage = new SQL().query(Collage.class, new Pair<>("id", 1));
        var clazz = new SQL().query(Clazz.class, new Pair<>("id", 5));
        var punchRecord = new SQL().queryList(PunchRecord.class, new Pair<>("uid", "201806061219"));
        var healthInfo = new SQL().query(HealthInfo.class, "uid", "201806061219");
        var collages = new SQL().queryList(Collage.class, null);
        out.write(String.format("%s<br>%s<br>%s<br>%s<br>%s<br>%s<br>%s<br>%s<br>%s<br>", teacher, student, admin, major, collage, clazz, punchRecord, healthInfo, collages));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
