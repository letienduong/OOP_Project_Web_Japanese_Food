package control;

import dao.DAO;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/ProfileServlet"})
public class ProfileServlet extends HttpServlet {

    // Giả sử đây là DAO của bạn
    private dao.DAO dao = new dao.DAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set content type
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            // Lấy session và tài khoản người dùng từ session
            HttpSession session = request.getSession();
            Account userAccount = (Account) session.getAttribute("acc");

            DAO dao = new DAO();
            Account a = dao.checkAccountExist(userAccount.getUser());
            
                request.setAttribute("name", a.getName());
                request.setAttribute("phoneNumber", a.getPhoneNumber());
                request.setAttribute("address",a.getAddress());
                request.setAttribute("email",a.getEmail());
                // Forward đến profile.jsp
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
        return "ProfileServlet - Hiển thị thông tin tài khoản người dùng";
    }
}
