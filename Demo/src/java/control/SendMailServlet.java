/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;


import dao.DAO;
import entity.Account;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author DELL
 */
public class SendMailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SendMailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendMailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            DAO dao = new DAO();
            Account u = dao.findAccountByEmail(email);
            if (u == null) {
                String message = "Email chưa sử dụng!";
                request.setAttribute("msg", message);
            } else {
                String otp = generateOtp();  // Sinh OTP
                String subject = "Mã OTP của bạn";
                String body = "Mã OTP của bạn là: " + otp;
                String fromEmail = "oopbtl@gmail.com";
                String password = "chlj hjjc xrzd pgte";  // Thông tin đăng nhập của Gmail (hoặc mật khẩu ứng dụng)
                
                try {
                    // Cấu hình kết nối với Gmail SMTP server
                    Properties properties = new Properties();
                    properties.put("mail.smtp.host", "smtp.gmail.com");
                    properties.put("mail.smtp.port", "587");
                    properties.put("mail.smtp.auth", "true");
                    properties.put("mail.smtp.starttls.enable", "true");
                    
                    // Tạo session và đăng nhập vào Gmail
                    Session session = Session.getInstance(properties, new Authenticator() {
                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(fromEmail, password);
                        }
                    });
                    
                    // Tạo đối tượng MimeMessage để gửi email
                    MimeMessage message1 = new MimeMessage(session);
                    message1.setFrom(new InternetAddress(fromEmail));
                    message1.setRecipient(Message.RecipientType.TO, new InternetAddress(email));  // Sử dụng biến email đã nhận
                    message1.setSubject(subject);
                    message1.setText(body);
                    
                    // Gửi email
                    Transport.send(message1);
                    String successMessage = "Đã gửi OTP đến email của bạn!";
                    request.setAttribute("msg", successMessage);
                    
                    // Lưu OTP vào session
                    request.getSession().setAttribute("otp", otp);
                    request.getSession().setAttribute("email",email);
                } catch (MessagingException e) {
                    // Xử lý lỗi nếu có
                    e.printStackTrace();
                    String errorMessage = "Có lỗi xảy ra khi gửi OTP: " + e.getMessage();
                    request.setAttribute("msg", errorMessage);
                }
            }
            request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SendMailServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private String generateOtp() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
