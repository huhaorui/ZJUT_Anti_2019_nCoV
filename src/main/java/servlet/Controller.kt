package servlet

import com.google.gson.Gson
import com.google.gson.GsonBuilder
import model.*
import model.FullTarget.Level.*
import servlet.PunchRecordData.availableCollage
import servlet.PunchRecordData.healthInfo
import servlet.PunchRecordData.punchInfo
import servlet.PunchRecordData.exportHealthView
import servlet.PunchRecordData.exportPunchView
import servlet.PunchRecordData.toIntOrDefault
import util.Router
import java.io.IOException
import java.net.URLEncoder
import java.text.SimpleDateFormat
import java.util.*
import javax.servlet.ServletException
import javax.servlet.annotation.WebServlet
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import kotlin.collections.ArrayList
import kotlin.collections.HashMap
import java.sql.Date as SqlDate

/**
 * @author wcf
 */
@WebServlet(name = "controller", urlPatterns = ["/action/*"])
class Controller : HttpServlet(), Router {

    override lateinit var context: String
    override val get = HashMap<String, (HttpServletRequest, HttpServletResponse) -> Unit>()
    override val post = HashMap<String, (HttpServletRequest, HttpServletResponse) -> Unit>()

    override fun init() {
        context = servletContext.contextPath

        get("/action") { _, resp ->
            resp.writer.println("hello world")
        }

        get("/action/hello") { req, resp ->
            val name = req.fields()["name"]
            resp.writer.println("hello world, $name")
        }
        get("/action/admin/college") { req, resp ->
            req.getRequestDispatcher("/college_admin.jsp").forward(req, resp)
        }
        get("/action/admin/overview") { req, resp ->
            req.getRequestDispatcher("/admin_overview.jsp").forward(req, resp)
        }
        get("/action/admin/punchview") { req, resp ->
            req.getRequestDispatcher("/admin_punchview.jsp").forward(req, resp)
        }
        post("/action/admin/router") { req, resp ->
            req.getRequestDispatcher("/adminRouter").forward(req, resp)
        }
        get("/action/admin/scanner") { req, resp ->
            req.getRequestDispatcher("/scanner.jsp").forward(req, resp)
        }
        get("/action/admin/school") { req, resp ->
            req.getRequestDispatcher("/school_admin.jsp").forward(req, resp)
        }
        request("/action/captcha/check") { req, resp ->
            req.getRequestDispatcher("/checkCaptcha").forward(req, resp)
        }
        request("/action/captcha/get") { req, resp ->
            req.getRequestDispatcher("/getCaptcha").forward(req, resp)
        }
        request("/action/getinfo") { req, resp ->
            req.getRequestDispatcher("/getInfoById").forward(req, resp)
        }
        request("/action/healthcode/check") { req, resp ->
            req.getRequestDispatcher("/check_health_code.jsp").forward(req, resp)
        }
        request("/action/healthcode/destroy") { req, resp ->
            req.getRequestDispatcher("DestroyHealthCode").forward(req, resp)
        }
        request("/action/healthcode/error") { req, resp ->
            req.getRequestDispatcher("/error_code.jsp").forward(req, resp)
        }
        post("/action/healthcode/get") { req, resp ->
            req.getRequestDispatcher("/GetHealthCode").forward(req, resp)
        }
        get("/action/healthcode/get") { req, resp ->
            req.getRequestDispatcher("/get_health_code.jsp").forward(req, resp)
        }
        request("/action/healthcode/view") { req, resp ->
            req.getRequestDispatcher("/view_health_code.jsp").forward(req, resp)
        }
        request("/action/information/college") { req, resp ->
            req.getRequestDispatcher("/college_information.jsp").forward(req, resp)
        }
        request("/action/login") { req, resp ->
            req.getRequestDispatcher("/login").forward(req, resp)
        }
        request("/action/login/student") { req, resp ->
            req.getRequestDispatcher("/login.jsp?user=student").forward(req, resp)
        }
        request("/action/login/admin") { req, resp ->
            req.getRequestDispatcher("/login.jsp?user=admin").forward(req, resp)
        }
        request("/action/login/error") { req, resp ->
            req.getRequestDispatcher("/error.jsp").forward(req, resp)
        }
        request("/action/logout") { req, resp ->
            req.getRequestDispatcher("/logOut").forward(req, resp)
        }
        post("/action/password/forget") { req, resp ->
            req.getRequestDispatcher("/forgetPassword").forward(req, resp)
        }
        get("/action/password/forget") { req, resp ->
            req.getRequestDispatcher("/forget_password.jsp").forward(req, resp)
        }
        post("/action/password/reset") { req, resp ->
            req.getRequestDispatcher("/resetPassword").forward(req, resp)
        }
        get("/action/password/reset") { req, resp ->
            req.getRequestDispatcher("/reset_password.jsp").forward(req, resp)
        }
        request("/action/qrcode/get") { req, resp ->
            req.getRequestDispatcher("/GetQrCode").forward(req, resp)
        }
        request("/action/student/history") { req, resp ->
            req.getRequestDispatcher("/punch_history.jsp").forward(req, resp)
        }
        request("/action/student/main") { req, resp ->
            req.getRequestDispatcher("/main.jsp").forward(req, resp)
        }
        request("/action/student/punch") { req, resp ->
            req.getRequestDispatcher("/punch.jsp").forward(req, resp)
        }
        request("/action/student/recover") { req, resp ->
            req.getRequestDispatcher("/recover.jsp").forward(req, resp)
        }
        get("/action/upload/database") { req, resp ->
            req.getRequestDispatcher("/upload_database.jsp").forward(req, resp)
        }
        post("/action/upload/database") { req, resp ->
            req.getRequestDispatcher("/uploadDatabase").forward(req, resp)
        }
        request("/action/upload/punch") { req, resp ->
            req.getRequestDispatcher("/uploadPunch").forward(req, resp)
        }

        post("/action/admin/overview") { req, resp ->
            resp.contentType = "application/json;charset=UTF-8"
            admin(req, resp, arrayListOf(SYSTEM, COLLAGE, SCHOOL),
                    {
                        resp.writer.write(gson.toJson(ArrayList<PunchRecordData.HealthView>().healthInfo()))
                    },
                    { admin, level, _ ->
                        val healthViews: List<Map<String, String>>
                        val fields = req.fields()

                        when (level) {
                            SYSTEM, SCHOOL -> {
                                val collage = fields["collage"]
                                healthViews = if (collage == null) {
                                    PunchRecordData.healthViewAll().healthInfo()
                                } else {
                                    PunchRecordData.healthViewByCollage(collage).healthInfo()
                                }
                            }

                            COLLAGE -> {
                                val target: Collage? = admin.target
                                healthViews = if (target != null) {
                                    PunchRecordData.healthViewByCollage(target.id.toString()).healthInfo()
                                } else {
                                    ArrayList()
                                }
                            }
                            else -> healthViews = ArrayList()
                        }
                        resp.writer.write(gson.toJson(healthViews))
                    }
            )
        }

        request("/action/admin/overview/export") { req, resp ->
            admin(req, resp, arrayListOf(SYSTEM, COLLAGE, SCHOOL)) { admin, level, _ ->
                val healthViews: List<PunchRecordData.HealthView>
                val fields = req.fields()

                when (level) {
                    SYSTEM, SCHOOL -> {
                        val collage = fields["collage"]
                        healthViews = if (collage == null) {
                            PunchRecordData.healthViewAll()
                        } else {
                            PunchRecordData.healthViewByCollage(collage)
                        }
                    }

                    COLLAGE -> {
                        val target: Collage? = admin.target
                        healthViews = if (target != null) {
                            PunchRecordData.healthViewByCollage(target.id.toString())
                        } else {
                            ArrayList()
                        }
                    }
                    else -> healthViews = ArrayList()
                }

                val workbook = healthViews.exportHealthView()

                resp.reset()
                resp.setHeader("Content-Disposition", "attachment;filename=${URLEncoder.encode("健康码数据.xlsx", "utf-8")}")
                resp.setHeader("Connection", "close")
                resp.setHeader("Content-Type", "application/octet-stream")
                val stream = resp.outputStream
                workbook.write(stream)
                stream.close()
            }
        }

        post("/action/admin/punchview") { req, resp ->
            resp.contentType = "application/json;charset=UTF-8"

            admin(req, resp, arrayListOf(SYSTEM, COLLAGE, SCHOOL),
                    {
                        resp.writer.write(gson.toJson(ArrayList<PunchRecordData.PunchView>().punchInfo()))
                    },
                    { admin, level, _ ->
                        val punchViews: List<Map<String, String>>
                        val fields = req.fields()
                        val date = fields["date"] ?: ""
                        println(date)

                        when (level) {
                            SYSTEM, SCHOOL -> {
                                val collage = fields["collage"]
                                punchViews = if (collage == null) {
                                    PunchRecordData.punchViewAll(date.sqlDate()).punchInfo()
                                } else {
                                    PunchRecordData.punchViewByCollage(collage, date.sqlDate()).punchInfo()
                                }
                            }

                            COLLAGE -> {
                                val target: Collage? = admin.target
                                punchViews = if (target != null) {
                                    PunchRecordData.punchViewByCollage(target.id.toString(), date.sqlDate()).punchInfo()
                                } else {
                                    ArrayList()
                                }
                            }
                            else -> punchViews = ArrayList()
                        }
                        resp.writer.write(gson.toJson(punchViews))
                    }
            )


        }

        request("/action/admin/punchview/export") { req, resp ->
            admin(req, resp, arrayListOf(SYSTEM, COLLAGE, SCHOOL)) { admin, level, _ ->
                val punchViews: List<PunchRecordData.PunchView>
                val fields = req.fields()
                val date = fields["date"] ?: ""

                when (level) {
                    SYSTEM, SCHOOL -> {
                        val collage = fields["collage"]
                        punchViews = if (collage == null) {
                            PunchRecordData.punchViewAll(date.sqlDate())
                        } else {
                            PunchRecordData.punchViewByCollage(collage, date.sqlDate())
                        }
                    }

                    COLLAGE -> {
                        val target: Collage? = admin.target
                        punchViews = if (target != null) {
                            PunchRecordData.punchViewByCollage(target.id.toString(), date.sqlDate())
                        } else {
                            ArrayList()
                        }
                    }
                    else -> punchViews = ArrayList()
                }

                val workbook = punchViews.exportPunchView()

                resp.reset()
                resp.setHeader("Content-Disposition", "attachment;filename=${URLEncoder.encode(date + "健康打卡数据.xlsx", "utf-8")}")
                resp.setHeader("Connection", "close")
                resp.setHeader("Content-Type", "application/octet-stream")
                val stream = resp.outputStream
                workbook.write(stream)
                stream.close()
            }
        }

        request("/action/admin/view/collage") { req, resp ->
            resp.contentType = "application/json;charset=UTF-8"
            admin(req, resp, arrayListOf(SYSTEM, SCHOOL, COLLAGE)) { admin, _, _ ->
                resp.writer.write(gson.toJson(availableCollage(admin)))
            }
        }

        request("/action/admin/view/major") { req, resp ->
            resp.contentType = "application/json;charset=UTF-8"
            admin(req, resp, arrayListOf(SYSTEM, SCHOOL, COLLAGE)) { admin, _, _ ->
                val fields = req.fields()
                val collage = (fields["collage"] ?: "-1").toIntOrDefault()
                val collages = availableCollage(admin)
                if (collage !in collages.map { it.id }) {
                    resp.writer.write(gson.toJson(ArrayList<Major>()))
                } else {
                    val majors = PunchRecordData.majorOfCollage(collage)
                    resp.writer.write(gson.toJson(majors))
                }
            }
        }

        request("/action/admin/view/class") { req, resp ->
            resp.contentType = "application/json;charset=UTF-8"
            admin(req, resp, arrayListOf(SYSTEM, SCHOOL, COLLAGE)) { admin, _, _ ->
                val fields = req.fields()
                val majorId = (fields["major"] ?: "-1").toIntOrDefault()
                val major = SQL().query(Major::class.java, "id" to majorId)
                val collage = major?.collage
                if (collage == null || collage !in availableCollage(admin)) {
                    resp.writer.write(gson.toJson(ArrayList<Clazz>()))
                } else {
                    val classes = PunchRecordData.classOfMajor(major.id)
                    resp.writer.write(gson.toJson(classes))
                }
            }
        }

        request("/action/admin/view/student") { req, resp ->
            resp.contentType = "application/json;charset=UTF-8"
            admin(req, resp, arrayListOf(SYSTEM, SCHOOL, COLLAGE)) { admin, _, _ ->
                val fields = req.fields()
                val clazzId = (fields["class"] ?: "-1").toIntOrDefault()
                val clazz = SQL().query(Clazz::class.java, "id" to clazzId)
                val collage = clazz?.major?.collage
                if (clazz == null || collage !in availableCollage(admin)) {
                    resp.writer.write(gson.toJson(ArrayList<Student>()))
                } else {
                    val students = PunchRecordData.studentOfClass(clazz.id)
                    resp.writer.write(gson.toJson(students))
                }
            }
        }

        request("/action/admin/view/teacher") { req, resp ->
            resp.contentType = "application/json;charset=UTF-8"
            admin(req, resp, arrayListOf(SYSTEM, SCHOOL, COLLAGE)) { admin, _, _ ->
                val fields = req.fields()
                val collageId = (fields["collage"] ?: "-1").toIntOrDefault()
                val collage = availableCollage(admin).firstOrNull { it.id == collageId }
                if (collage == null) {
                    resp.writer.write(gson.toJson(ArrayList<Teacher>()))
                } else {
                    val teachers = PunchRecordData.teacherOfCollage(collage.id)
                    resp.writer.write(gson.toJson(teachers))
                }
            }
        }

        request("/action/punch_record/avail_list") { req, resp ->
            resp.contentType = "application/json;charset=UTF-8"
            val admin = req.session.getAttribute("admin")
            if (admin !is Admin || admin == Admin()) {
                resp.writer.write(gson.toJson(ArrayList<Collage>()))
            } else {
                resp.writer.write(gson.toJson(availableCollage(admin)))
            }
        }
    }

    @Throws(ServletException::class, IOException::class)
    override fun doPost(request: HttpServletRequest, response: HttpServletResponse) {
        request.characterEncoding = "utf-8"
        response.contentType = "text/html;charset=UTF-8"
        val uri = request.requestURI
        post[uri]?.invoke(request, response)
    }

    @Throws(ServletException::class, IOException::class)
    override fun doGet(request: HttpServletRequest, response: HttpServletResponse) {
        request.characterEncoding = "utf-8"
        response.contentType = "text/html;charset=UTF-8"
        val uri = request.requestURI
        get[uri]?.invoke(request, response)

        //region sample
//        val teacher = SQL().query(Teacher::class.java, "id" to "00001")
//        val student = SQL().query(Student::class.java, Pair("id", "201806061108"))
//        val admin = SQL().query(Admin::class.java, Pair("id", "000000"))
//        val major = SQL().query(Major::class.java, Pair("name", "计算机科学与技术"))
//        val collage = SQL().query(Collage::class.java, Pair("id", 580))
//        val clazz = SQL().query(Clazz::class.java, Pair("id", 1055))
//        val healthInfo = SQL().query(HealthInfo::class.java, "uid" to "201806061219")
//        val punchRecord = SQL().queryList(PunchRecord::class.java, "uid" to "201806061219")
//        val collages = SQL().queryList(Collage::class.java)
//        println(MessageFormat.format(
//                "teacher[000001]:{0}\n\nstudent[201806061108]:{1}\n\nadmin[1]:{2}\n\nmajor[1]:{3}\n\ncollage[1]:{4}\n\nclass[5]:{5}\n\nhealth_info[201806061219]:{6}\n\npunch_record[201806061219]:{7}\n\ncollages:{8}\n\n",
//                gson.toJson(teacher),
//                gson.toJson(student),
//                gson.toJson(admin),
//                gson.toJson(major),
//                gson.toJson(collage),
//                gson.toJson(clazz),
//                gson.toJson(healthInfo),
//                gson.toJson(punchRecord),
//                gson.toJson(collages)
//        ))
        //endregion
    }

    companion object {
        val gson: Gson = GsonBuilder().setPrettyPrinting().enableComplexMapKeySerialization().serializeNulls().create()

        fun String.sqlDate() = SqlDate(try {
            SimpleDateFormat("yyyy-MM-dd").parse(this).time
        } catch (e: Exception) {
            Date().time
        })
    }
}