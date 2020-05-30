package servlet

import model.Admin
import java.io.IOException
import javax.servlet.ServletException
import javax.servlet.annotation.WebServlet
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@WebServlet(name = "AdminRouterServlet", urlPatterns = ["/adminRouter"])
class AdminRouterServlet : HttpServlet() {
    @Throws(ServletException::class, IOException::class)
    override fun doPost(request: HttpServletRequest, response: HttpServletResponse) {
        val admin: Admin = request.session.getAttribute("admin") as Admin
        if (admin == Admin()) {
            response.sendRedirect("login.jsp?user=admin")
            return
        }
        when (admin.level) {
            9, 8 -> {
                response.sendRedirect("system_admin.jsp")
            }
            5, 4 -> {
                response.sendRedirect("school_admin.jsp")
            }
            3, 2 -> {
                response.sendRedirect("college_admin.jsp")
            }
            1 -> {
                response.sendRedirect("scanner.jsp")
            }
            else -> {
                response.sendRedirect("login.jsp?user=admin")
            }
        }
    }

    @Throws(ServletException::class, IOException::class)
    override fun doGet(request: HttpServletRequest, response: HttpServletResponse) {
        doPost(request, response)
    }
}