package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * @author HHR
 */
@WebServlet(name = "UploadPunchServlet", urlPatterns = "/uploadPunch")
public class UploadPunchServlet extends HttpServlet {
    int getProblemNumber(String problem) {
        return 0;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = null, id = null, person_id = null, tel = null, danger14 = null, aboard14 = null, touch14 = null, ill14 = null, problem = null;
        request.setCharacterEncoding("UTF-8");
        try {
            name = request.getParameter("name");
            id = request.getParameter("id");
            person_id = request.getParameter("person_id");
            tel = request.getParameter("tel");
            danger14 = request.getParameter("danger14");
            aboard14 = request.getParameter("aboard14");
            touch14 = request.getParameter("touch14");
            ill14 = request.getParameter("ill14");
            problem = request.getParameter("problem");
        } catch (NullPointerException e) {
            response.sendRedirect("main.jsp");
        }
        if ("true".equals(problem)) {
            Map<String, String[]> parameter = request.getParameterMap();
            String[] problems = parameter.get("status");
            if (problems.length != 0) {
                int problemNumber = 0;
                for (String p : problems) {
                    problemNumber += getProblemNumber(p);
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("main.jsp");
    }
}
