package servlet;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Hashtable;

/**
 * @author HHR
 */
@WebServlet(name = "GetQrCode", urlPatterns = "/GetQrCode")
public class GetQrCode extends HttpServlet {
    static class MatrixToImageWriter {
        private MatrixToImageWriter() {
        }

        public static BufferedImage toBufferedImage(BitMatrix matrix, int black, int white) {
            int width = matrix.getWidth();
            int height = matrix.getHeight();
            int margin = 20;
            BufferedImage image = new BufferedImage(width - margin * 2, height - margin * 2, BufferedImage.TYPE_INT_RGB);
            for (int x = margin; x < width - margin; x++) {
                for (int y = margin; y < height - margin; y++) {
                    image.setRGB(x - margin, y - margin, matrix.get(x, y) ? black : white);
                }
            }
            return image;
        }


        public static void writeToStream(BitMatrix matrix, String format, OutputStream stream, int black, int white) throws IOException {
            BufferedImage image = toBufferedImage(matrix, black, white);
            if (!ImageIO.write(image, format, stream)) {
                throw new IOException("Could not write an image of format "
                        + format);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/png");
        int black = 0xFF02c39a;
        int white = 0xFFFFFFFF;
        int width = 400;
        int height = 400;
        String text, token = null;
        text = request.getParameter("text");
        token = request.getParameter("token");
        String format = "png";
        if (request.getParameter("black") != null) {
            black = Integer.parseInt(request.getParameter("black"), 16);
        }
        if (request.getParameter("white") != null) {
            white = Integer.parseInt(request.getParameter("white"), 16);
        }
        Hashtable<EncodeHintType, String> hints = new Hashtable<>();
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
        BitMatrix bitMatrix;
        try {
            bitMatrix = new MultiFormatWriter().encode(text + "&token=" + token, BarcodeFormat.QR_CODE, width, height, hints);
            MatrixToImageWriter.writeToStream(bitMatrix, format, response.getOutputStream(), black, white);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
