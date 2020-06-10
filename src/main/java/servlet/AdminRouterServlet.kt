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
        if (request.session.getAttribute("admin") == null) {
            response.sendRedirect("../login/admin")
            return
        }
        val admin: Admin = request.session.getAttribute("admin") as Admin

        when (admin.level) {
            9, 8 -> {
                response.sendRedirect("system")
            }
            5, 4 -> {
                response.sendRedirect("school")
            }
            3, 2 -> {
                response.sendRedirect("college")
            }
            1 -> {
                response.sendRedirect("scanner")
            }
            else -> {
                response.sendRedirect("../login/admin")
            }
        }
    }

    @Throws(ServletException::class, IOException::class)
    override fun doGet(request: HttpServletRequest, response: HttpServletResponse) {
        doPost(request, response)
    }
}