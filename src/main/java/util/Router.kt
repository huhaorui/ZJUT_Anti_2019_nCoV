package util

import org.apache.commons.fileupload.disk.DiskFileItemFactory
import org.apache.commons.fileupload.servlet.ServletFileUpload
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

    companion object {
        fun HttpServletRequest.multiFields(): MultipleForm {
            return MultipleForm(this)
        }
    }
}