package servlet;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import kotlin.Pair;
import model.*;
import util.Import;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.MessageFormat;

/**
 * @author wcf
 */

@WebServlet(name = "controller", urlPatterns = {"/action"})
public class Controller extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=UTF-8");
        var out = response.getWriter();
        var teacher = new SQL().query(Teacher.class, new Pair<>("id", "000001"));
        var student = new SQL().query(Student.class, new Pair<>("id", "201806061108"));
        var admin = new SQL().query(Admin.class, new Pair<>("id", "00000"));
        var major = new SQL().query(Major.class, new Pair<>("id", 2));
        var collage = new SQL().query(Collage.class, new Pair<>("id", 1));
        var clazz = new SQL().query(Clazz.class, new Pair<>("id", 5));
        var healthInfo = new SQL().query(HealthInfo.class, new Pair<>("uid", "201806061108"));
        var punchRecord = new SQL().queryList(PunchRecord.class, new Pair<>("uid", "201806061219"));
        var collages = new SQL().queryList(Collage.class, null);
        var gson = new GsonBuilder().setPrettyPrinting().enableComplexMapKeySerialization().create();
        out.write(MessageFormat.format("teacher[000001]:{0}\n\nstudent[201806061108]:{1}\n\nadmin[1]:{2}\n\nmajor[1]:{3}\n\ncollage[1]:{4}\n\nclass[5]:{5}\n\nhealth_info[201806061108]:{6}\n\npunch_record[201806061219]:{7}\n\ncollages:{8}\n\n",
                gson.toJson(teacher),
                gson.toJson(student),
                gson.toJson(admin),
                gson.toJson(major),
                gson.toJson(collage),
                gson.toJson(clazz),
                gson.toJson(healthInfo),
                gson.toJson(punchRecord),
                gson.toJson(collages)));
        new Import(new File("/Temp/健康码信息导入.xlsx"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
