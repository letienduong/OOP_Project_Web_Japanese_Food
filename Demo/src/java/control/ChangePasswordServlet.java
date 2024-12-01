package control;

import entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.DAO;

import java.io.IOException;

public class ChangePasswordServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Lấy email từ session
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        // Kiểm tra nếu email không tồn tại trong session
        if (email == null || email.isEmpty()) {
            request.setAttribute("msg", "Không tìm thấy email trong session! Vui lòng đăng nhập lại.");
            request.getRequestDispatcher("signin.jsp").forward(request, response);  // Chuyển hướng đến trang đăng nhập
            return;
        }

        // Lấy mật khẩu mới và mật khẩu xác nhận từ form
        String newPassword = request.getParameter("newpassword");
        String confirmPassword = request.getParameter("confirmpassword");

        // Kiểm tra nếu mật khẩu không hợp lệ
        if (newPassword == null || newPassword.isEmpty() || confirmPassword == null || confirmPassword.isEmpty()) {
            request.setAttribute("msg", "Mật khẩu không được để trống!");
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            return;
        }

        // Kiểm tra nếu mật khẩu mới và mật khẩu xác nhận không khớp
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("msg", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            return;
        }

//        try {
        // Lấy tài khoản từ email
        DAO dao = new DAO();
        Account a = dao.findAccountByEmail(email);
        // Nếu không tìm thấy tài khoản
        if (a == null) {
            request.setAttribute("msg", "Không tìm thấy tài khoản với email này!");
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            return;
        }

//             Cập nhật mật khẩu trong cơ sở dữ liệu
        dao.updatePassword(a.getUser(), newPassword);  // Sử dụng phương thức updatePassword

        // Thông báo thành công
        
            response.sendRedirect("signin.jsp");

//        } catch (Exception e) {
//            // In lỗi ra console và gửi thông báo về phía người dùng
//            e.printStackTrace();
//            request.setAttribute("msg", "Đã xảy ra lỗi khi đổi mật khẩu! Vui lòng thử lại.");
//            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
//        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "ChangePasswordServlet";
    }
}
