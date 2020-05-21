package servlet;

import conn.DatabaseProvider;
import model.Person;

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
import java.util.UUID;

@WebServlet(name = "GetHealthCodeServlet", urlPatterns = "/getHealthCode")
public class GetHealthCodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = DatabaseProvider.getConn();
        PreparedStatement sql;
        String token = UUID.randomUUID().toString().replace("-", "");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String person_id = request.getParameter("person_id");
        try {
            sql = conn.prepareStatement("select * from Teacher_Student where person_id=? and id=? and name=?");
            sql.setString(1, person_id);
            sql.setString(2, id);
            sql.setString(3, name);
            ResultSet result = sql.executeQuery();
            if (!result.next()) {
                response.sendRedirect("main.jsp");
                return;
            }
            sql.close();
            result.close();
            sql = conn.prepareStatement("insert into health_code_token values(?,?)");
            sql.setString(1, id);
            sql.setString(2, token);
            sql.execute();
            sql.close();
            response.sendRedirect("view_health_code.jsp");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("main.jsp");
    }
}
