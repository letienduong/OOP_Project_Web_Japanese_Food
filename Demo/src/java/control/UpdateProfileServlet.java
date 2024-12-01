package control;

import dao.DAO;
import entity.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/UpdateProfileServlet"})
public class UpdateProfileServlet extends HttpServlet {

    private dao.DAO dao = new dao.DAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy session và tài khoản người dùng từ session
        HttpSession session = request.getSession();
        Account userAccount = (Account) session.getAttribute("acc");

        // Lấy thông tin từ form
        String name = request.getParameter("infoname");
        String phone = request.getParameter("infophone");
        String email = request.getParameter("infoemail");
        String address = request.getParameter("infoaddress");

        // Kiểm tra thông tin hợp lệ (có thể thêm các điều kiện kiểm tra tùy nhu cầu)
        if (name != null && !name.trim().isEmpty() &&
            phone != null && !phone.trim().isEmpty() &&
            email != null && !email.trim().isEmpty() &&
            address != null && !address.trim().isEmpty()) {

            // Cập nhật thông tin vào cơ sở dữ liệu thông qua DAO
             dao.updateAccountInfo(userAccount.getUser(), name, phone, email, address);

            
                // Sau khi cập nhật thành công, set lại thông tin mới cho session
                userAccount.setName(name);
                userAccount.setPhoneNumber(phone);
                userAccount.setEmail(email);
                userAccount.setAddress(address);

                // Lưu lại thông tin cập nhật trong session
                session.setAttribute("acc", userAccount);

                // Chuyển hướng người dùng về trang profile với thông tin mới
                response.sendRedirect("ProfileServlet");
            
        } else {
            // Nếu có thông tin thiếu hoặc không hợp lệ
            request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin!");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
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
        return "Servlet để cập nhật thông tin tài khoản người dùng";
    }
}
