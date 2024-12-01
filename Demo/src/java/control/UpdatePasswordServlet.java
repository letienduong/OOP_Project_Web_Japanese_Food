package control;

import dao.DAO;
import entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(urlPatterns = {"/UpdatePasswordServlet"})
public class UpdatePasswordServlet extends HttpServlet {

    private dao.DAO dao = new dao.DAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy session và thông tin người dùng
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        
        // Lấy dữ liệu từ form
        String currentPassword = request.getParameter("password-cur-info");
        String newPassword = request.getParameter("password-after-info");
        String confirmPassword = request.getParameter("password-comfirm-info");
        
        // Kiểm tra mật khẩu hiện tại
        if (!account.getPass().equals(currentPassword)) {
            // Nếu mật khẩu hiện tại không đúng
            request.setAttribute("errorMessage", "Mật khẩu hiện tại không chính xác!");
            request.getRequestDispatcher("ProfileServlet").forward(request, response);
            return; // Dừng lại ở đây
        }

        // Kiểm tra mật khẩu mới và mật khẩu xác nhận có trùng khớp không
        if (!newPassword.equals(confirmPassword)) {
            // Nếu mật khẩu mới không khớp với xác nhận mật khẩu
            request.setAttribute("errorMessage", "Mật khẩu mới và xác nhận mật khẩu không khớp!");
            request.getRequestDispatcher("ProfileServlet").forward(request, response);
            return; // Dừng lại ở đây
        }

        // Nếu mật khẩu cũ đúng và mật khẩu mới khớp
        dao.updatePassword(account.getUser(), newPassword);

        // Cập nhật mật khẩu trong session
        account.setPass(newPassword);
        session.setAttribute("acc", account);

        // Gửi thông báo thành công
        request.setAttribute("successMessage", "Mật khẩu đã được thay đổi thành công!");
        request.getRequestDispatcher("ProfileServlet").forward(request, response);
    }
}

