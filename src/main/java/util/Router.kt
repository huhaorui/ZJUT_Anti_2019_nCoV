package util

import model.Admin
import model.FullTarget
import model.FullTarget.Level
import org.apache.poi.ss.formula.functions.Function0Arg
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

interface Router {
    var context: String

    val get: HashMap<String, (req: HttpServletRequest, resp: HttpServletResponse) -> Unit>
    val post: HashMap<String, (req: HttpServletRequest, resp: HttpServletResponse) -> Unit>

    fun post(pattern: String, method: (req: HttpServletRequest, resp: HttpServletResponse) -> Unit) {
        post[context + pattern] = method
    }

    fun get(pattern: String, method: (req: HttpServletRequest, resp: HttpServletResponse) -> Unit) {
        get[context + pattern] = method
    }

    fun request(pattern: String, method: (req: HttpServletRequest, resp: HttpServletResponse) -> Unit) {
        get[context + pattern] = method
        post[context + pattern] = method
    }

    fun HttpServletRequest.fields(): HashMap<String, String> {
        val fields = HashMap<String, String>()
        parameterMap.forEach { (t: String, u: Array<String>) ->
            if (u.isNotEmpty()) {
                fields[t] = u[0]
            }
        }
        return fields
    }

    fun admin(req: HttpServletRequest, resp: HttpServletResponse, require: ArrayList<Level>, fail: () -> Unit, success: (Admin, Level, Boolean) -> Unit) {
        val admin = req.session.getAttribute("admin")
        if (admin !is Admin || admin == Admin() || admin.fullTarget.level !in require) {
            fail.invoke()
        } else {
            success.invoke(admin, admin.fullTarget.level, admin.fullTarget.healthCode)
        }
    }

    fun admin(req: HttpServletRequest, resp: HttpServletResponse, require: ArrayList<Level>, success: (Admin, Level, Boolean) -> Unit) {
        val admin = req.session.getAttribute("admin")
        if (admin is Admin && admin != Admin() && admin.fullTarget.level in require) {
            success.invoke(admin, admin.fullTarget.level, admin.fullTarget.healthCode)
        }
    }

    fun admin(admin: Admin, require: ArrayList<Level>, fail: () -> Unit, success: (Admin, Level, Boolean) -> Unit) {
        if (admin.fullTarget.level !in require) {
            fail.invoke()
        } else {
            success.invoke(admin, admin.fullTarget.level, admin.fullTarget.healthCode)
        }
    }

    companion object {
        fun HttpServletRequest.multiFields(): MultipleForm {
            return MultipleForm(this)
        }
    }
}