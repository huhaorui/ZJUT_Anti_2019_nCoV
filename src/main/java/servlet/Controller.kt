package servlet

import util.Router.context
import util.Router.fields
import util.Router.get
import util.Router.multiFields
import util.Router.post
import java.io.IOException
import javax.servlet.ServletException
import javax.servlet.annotation.MultipartConfig
import javax.servlet.annotation.WebServlet
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

/**
 * @author wcf
 */
@MultipartConfig
@WebServlet(name = "controller", urlPatterns = ["/action/*"])
class Controller : HttpServlet() {

    override fun init() {
        context = servletContext.contextPath

        get("/action") { _, resp ->
            resp.writer.println("hello world")
        }

        get("/action/hello") { req, resp ->
            val name = req.fields()["name"]
            resp.writer.println("hello world, $name")
        }

        post("/action/upload/database") { req, resp ->
            //TODO 验证用户&判断请求类型
            val multiFields = req.multiFields().build()
            val fields = multiFields.fields
            val streams = multiFields.streams

            multiFields.close()
        }

        get("/action/upload/database") { req, resp ->
            val writer = resp.writer
            writer.println("<form action='database' method='post' enctype='multipart/form-data'>" +
                    "文件 <input type='file' required='required' name='data'/><br>" +
                    "账号 <input type='text' required='required' name='account'/><br>" +
                    "密码 <input type='password' required='required' name='password'/><br>" +
                    "<input type='submit' value='提交'/>" +
                    "</form>")
        }

    }

    @Throws(ServletException::class, IOException::class)
    override fun doPost(request: HttpServletRequest, response: HttpServletResponse) {
        request.characterEncoding = "utf-8"
        response.contentType = "text/html;charset=UTF-8"
        //region sample
//        var out = response.getWriter();
//        var teacher = new SQL().query(Teacher.class, new Pair<>("id", "000001")); //id to 0000001
//        var student = new SQL().query(Student.class, new Pair<>("id", "201806061108"));
//        var admin = new SQL().query(Admin.class, new Pair<>("id", "00000"));
//        var major = new SQL().query(Major.class, new Pair<>("id", 2));
//        var collage = new SQL().query(Collage.class, new Pair<>("id", 1));
//        var clazz = new SQL().query(Clazz.class, new Pair<>("id", 5));
//        var healthInfo = new SQL().query(HealthInfo.class, new Pair<>("uid", "201906061418"));
//        var punchRecord = new SQL().queryList(PunchRecord.class, new Pair<>("uid", "201806061219"));
//        var collages = new SQL().queryList(Collage.class, null);
//        var gson = new GsonBuilder().setPrettyPrinting().enableComplexMapKeySerialization().serializeNulls().create();
//        out.write(MessageFormat.format("teacher[000001]:{0}\n\nstudent[201806061108]:{1}\n\nadmin[1]:{2}\n\nmajor[1]:{3}\n\ncollage[1]:{4}\n\nclass[5]:{5}\n\nhealth_info[201806061418]:{6}\n\npunch_record[201806061219]:{7}\n\ncollages:{8}\n\n",
//                gson.toJson(teacher),
//                gson.toJson(student),
//                gson.toJson(admin),
//                gson.toJson(major),
//                gson.toJson(collage),
//                gson.toJson(clazz),
//                gson.toJson(healthInfo),
//                gson.toJson(punchRecord),
//                gson.toJson(collages)));
        //endregion
        val uri = request.requestURI
        post[uri]?.invoke(request, response)
    }

    @Throws(ServletException::class, IOException::class)
    override fun doGet(request: HttpServletRequest, response: HttpServletResponse) {
        request.characterEncoding = "utf-8"
        response.contentType = "text/html;charset=UTF-8"
        val uri = request.requestURI
        get[uri]?.invoke(request, response)
    }
}