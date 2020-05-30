package util

import org.apache.commons.fileupload.FileUploadException
import org.apache.commons.fileupload.disk.DiskFileItemFactory
import org.apache.commons.fileupload.servlet.ServletFileUpload
import org.apache.commons.fileupload.servlet.ServletRequestContext
import java.io.*
import javax.servlet.http.HttpServletRequest

class MultipleForm(private val req: HttpServletRequest) : Closeable {
    val streams = ArrayList<Stream>()
    val fields: HashMap<String, String> = HashMap()

    private val factory = DiskFileItemFactory()
    private val fileUpload = ServletFileUpload(factory)


    fun build(): MultipleForm = apply {
        try {
            fileUpload.parseRequest(ServletRequestContext(req))?.forEach { item ->
                if (item.isFormField) {
                    fields[item.fieldName] = item.string
                } else {
                    streams.add(Stream(item.fieldName, item.name, item.inputStream))
                }
            }
        } catch (e: FileUploadException) {
            e.printStackTrace()
        }
    }

    override fun close() {
        try {
            streams.forEach { item -> item.inputStream.close() }
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }

    class Stream(val field: String, val filename: String, val inputStream: InputStream)
}