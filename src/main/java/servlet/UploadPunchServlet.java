package servlet;

import conn.DatabaseProvider;
import model.Status;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Map;

/**
 * @author HHR
 */
@WebServlet(name = "UploadPunchServlet", urlPatterns = "/uploadPunch")
public class UploadPunchServlet extends HttpServlet {
    int getProblemNumber(String problem) {
        switch (problem) {
            case "发烧":
                return 64;
            case "乏力":
                return 32;
            case "干咳":
                return 16;
            case "鼻塞":
                return 8;
            case "咽痛":
                return 4;
            case "流涕":
                return 2;
            case "腹泻":
                return 1;
        }
        return 0;
    }

    String getColorByStatus(String s1, String s2, String s3, String s4, int n) {
        if (s3.equals("true") || s4.equals("true") || new Status(n).getAbnormalCount() > 1) {
            return "red";
        }
        if (s1.equals("true") || s2.equals("true") || new Status(n).getAbnormalCount() == 1) {
            return "yellow";
        }
        return "green";
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = null, id = null, person_id = null, tel = null, danger14 = null, aboard14 = null, touch14 = null, ill14 = null, problem = null;
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            name = request.getParameter("name");
            id = request.getParameter("id");
            person_id = request.getParameter( "person_id");
            tel = request.getParameter("tel");
            danger14 = request.getParameter("danger14");
            aboard14 = request.getParameter("aboard14");
            touch14 = request.getParameter("touch14");
            ill14 = request.getParameter("ill14");
            problem = request.getParameter("problem");
        } catch (NullPointerException e) {
            response.sendRedirect("main.jsp");
            return;
        }
        Connection conn = DatabaseProvider.getConn();
        PreparedStatement sql = null;
        try {
            sql = conn.prepareStatement("select * from Teacher_Student where id=? and person_id=? and name=?");
            sql.setString(1, id);
            sql.setString(2, person_id);
            sql.setString(3, name);
            ResultSet result = sql.executeQuery();
            if (!result.next()) {
                result.close();
                sql.close();
                response.sendRedirect("main.jsp");
                return;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        int problemNumber = 0;
        if ("true".equals(problem)) {
            Map<String, String[]> parameter = request.getParameterMap();
            String[] problems = parameter.get("status");
            if (problems != null) {
                for (String p : problems) {
                    problemNumber += getProblemNumber(p);
                }
            }
        }
        try {
            sql = conn.prepareStatement("select uid, tel, if_danger_14, if_abroad_14, if_touch_illness, if_ill, status, color from health_info where uid=?");
            sql.setString(1, id);
            ResultSet result = sql.executeQuery();
            if (result.next()) {
                if (!result.getString("color").equals("green")) {
                    int timeInNeed = result.getString("color").equals("red") ? 14 : 7;
                    sql = conn.prepareStatement("select * from punch_record where date=?");
                    sql.setDate(1, new java.sql.Date(System.currentTimeMillis()));
                    result = sql.executeQuery();
                    if (!result.next()) {
                        sql = conn.prepareStatement("insert into punch_record values (?,?,?,?,?)");
                        sql.setString(1, id);
                        sql.setDate(2, Date.valueOf(new Date(System.currentTimeMillis()).toLocalDate()));
                        sql.setTime(3, Time.valueOf(new Time(System.currentTimeMillis()).toLocalTime()));
                        sql.setInt(4, problemNumber);
                        sql.setString(5, getColorByStatus(danger14, aboard14, touch14, ill14, problemNumber));
                        sql.executeUpdate();
                        sql = conn.prepareStatement(
                                "select color,date\n" +
                                        "from punch_record\n" +
                                        "where uid=?\n" +
                                        "order by date desc limit ?");
                        sql.setString(1, id);
                        sql.setInt(2, timeInNeed);
                        result = sql.executeQuery();
                        int n = timeInNeed;
                        java.sql.Date first = null, last = null;
                        while (n-- > 0 && result.next()) {
                            if (first == null) first = result.getDate("date");
                            if (!result.getString("color").equals("green")) {
                                response.sendRedirect("main.jsp?ok=punch");
                                sql.close();
                                result.close();
                                conn.close();
                                return;
                            }
                        }
                        last = result.getDate("date");
                        assert first != null;
                        if ((first.getTime() - last.getTime()) / 86400000 > timeInNeed - 1) {
                            response.sendRedirect("main.jsp?ok=punch");
                        } else if (n == -1) {
                            sql = conn.prepareStatement("update health_info set color='green' where uid=?");
                            sql.setString(1, id);
                            sql.execute();
                            response.sendRedirect("recover.jsp?time=" + timeInNeed + "&name=" + name);
                        } else {
                            response.sendRedirect("main.jsp?ok=punch");
                        }
                    } else {
                        response.sendRedirect("main.jsp?error=punched");
                    }
                } else {
                    response.sendRedirect("main.jsp?error=punched");
                }
            } else {
                sql = conn.prepareStatement("insert into health_info values(?,?,?,?,?,?,?,?)");
                sql.setString(1, id);
                sql.setString(2, tel);
                sql.setInt(3, "true".equals(danger14) ? 1 : 0);
                sql.setInt(4, "true".equals(aboard14) ? 1 : 0);
                sql.setInt(5, "true".equals(touch14) ? 1 : 0);
                sql.setInt(6, "true".equals(ill14) ? 1 : 0);
                sql.setInt(7, problemNumber);
                sql.setString(8, getColorByStatus(danger14, aboard14, touch14, ill14, problemNumber));
                sql.execute();
                sql = conn.prepareStatement("insert into punch_record values (?,?,?,?,?)");
                sql.setString(1, id);
                sql.setDate(2, Date.valueOf(new Date(System.currentTimeMillis()).toLocalDate()));
                sql.setTime(3, Time.valueOf(new Time(System.currentTimeMillis()).toLocalTime()));
                sql.setInt(4, problemNumber);
                sql.setString(5, getColorByStatus(danger14, aboard14, touch14, ill14, problemNumber));
                sql.execute();
                response.sendRedirect("main.jsp?ok=punch");
            }
            sql.close();
            result.close();
            conn.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("main.jsp");
    }
}
