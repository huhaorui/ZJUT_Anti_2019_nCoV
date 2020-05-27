package util

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

object Router {
    //ktor
    val get = HashMap<String, (req: HttpServletRequest, resp: HttpServletResponse) -> Unit>()
    val post = HashMap<String, (req: HttpServletRequest, resp: HttpServletResponse) -> Unit>()

    fun post(pattern: String, method: (req: HttpServletRequest, resp: HttpServletResponse) -> Unit) {
        post[pattern] = method
    }

    fun get(pattern: String, method: (req: HttpServletRequest, resp: HttpServletResponse) -> Unit) {
        get[pattern] = method
    }

    fun request(pattern: String, method: (req: HttpServletRequest, resp: HttpServletResponse) -> Unit) {
        get[pattern] = method
        post[pattern] = method
    }

    fun HttpServletRequest.fields(): HashMap<String, String> {
        val fields = HashMap<String, String>()
        parameterMap.forEach { (t: String, u: Array<String>) -> if (u.isNotEmpty()) { fields[t] = u[0] } }
        return fields
    }
}