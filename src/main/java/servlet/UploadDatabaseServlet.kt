package servlet

import com.google.gson.GsonBuilder
import conn.DatabaseProvider
import util.Import
import util.Router.Companion.multiFields
import java.io.IOException
import javax.servlet.ServletException
import javax.servlet.annotation.MultipartConfig
import javax.servlet.annotation.WebServlet
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@WebServlet(name = "UploadDatabaseServlet", urlPatterns = ["/uploadDatabase"])
class UploadDatabaseServlet : HttpServlet() {
    @Throws(ServletException::class, IOException::class)
    override fun doPost(req: HttpServletRequest, resp: HttpServletResponse) {
        val multiFields = req.multiFields().build()
        val fields = multiFields.fields
        val id = fields["id"]
        val password = fields["password"]
        val captcha = fields["captcha"]
        val session = req.session.id
        val conn = DatabaseProvider.getConn()
        var sql = conn.prepareStatement("select * from admin where id=? and password=? and level>=8")
        sql.setString(1, id)
        sql.setString(2, password)
        var resultSet = sql.executeQuery()
        if (!resultSet.next()) {
            resp.sendRedirect("../admin/router")
            return
        }
        sql = conn.prepareStatement("select * from captcha where session=? and captcha=?")
        sql.setString(1, session)
        sql.setString(2, captcha)
        resultSet = sql.executeQuery()
        if (resultSet.next()) {
            sql = conn.prepareStatement("delete from captcha where session=?")
            sql.setString(1, session)
            sql.execute()
        } else {
            resp.sendRedirect("../admin/router")
            return
        }
        resp.contentType = "application/json;charset=UTF-8"

        val streams = multiFields.streams
        val result = streams.firstOrNull { it.field == "data" && (it.filename.endsWith(".xls") || it.filename.endsWith(".xlsx")) }?.let { Import(it) }?.insert()
        multiFields.close()
        if (result?.firstOrNull { it.first.first == 0 } != null) {
            resp.sendRedirect("../logout")
            return
        } else {
            resp.sendRedirect("upload")
            return
        }
//        val gson = GsonBuilder().setPrettyPrinting().enableComplexMapKeySerialization().serializeNulls().create()
//        resp.writer.write(gson.toJson(result))
    }

    @Throws(ServletException::class, IOException::class)
    override fun doGet(request: HttpServletRequest, response: HttpServletResponse) {
        response.sendRedirect("../admin/router")
    }
}