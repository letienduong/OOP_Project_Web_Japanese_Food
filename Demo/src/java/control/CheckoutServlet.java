package control;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import entity.Cart;
import entity.CartItem;
import entity.Order;
import entity.OrderItem;
import dao.OrderDAO;

@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        try {
            // Lấy giỏ hàng từ session
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null || cart.getItems().isEmpty()) {
                response.sendRedirect("cart.jsp");  // Nếu giỏ hàng trống, quay lại trang giỏ hàng
                return;
            }

            // Lấy thông tin từ form
            String receiverName = request.getParameter("receiverName");
            String receiverAddress = request.getParameter("receiverAddress");
            String receiverPhone = request.getParameter("receiverPhone");
            String timeSlot = request.getParameter("timeSlot");
            String note = request.getParameter("note");

            // Kiểm tra thông tin cơ bản
            if (receiverName == null || receiverAddress == null || receiverPhone == null || receiverName.trim().isEmpty() || receiverAddress.trim().isEmpty() || receiverPhone.trim().isEmpty()) {
                response.sendRedirect("checkout.jsp?error=missingInfo"); // Nếu thiếu thông tin, quay lại trang thanh toán
                return;
            }

            // Tạo đối tượng Order từ thông tin thanh toán
            Order order = new Order();
            order.setReceiverName(receiverName.trim());
            order.setReceiverAddress(receiverAddress.trim());
            order.setReceiverPhone(receiverPhone.trim());
            order.setTimeSlot(timeSlot != null ? timeSlot.trim() : "Ngay khi xong"); // Lấy thời gian giao hàng
            order.setNote(note != null ? note.trim() : ""); // Ghi chú, mặc định là rỗng

            // Tính toán tổng tiền đơn hàng
            double totalAmount = 0;
            for (CartItem item : cart.getItems()) {
                double itemTotal = item.getProductPrice() * item.getQuantity();
                totalAmount += itemTotal;
            }
            double shippingFee = 30000; // Phí vận chuyển cố định
            totalAmount += shippingFee; // Tổng tiền đơn hàng bao gồm phí vận chuyển

            order.setTotalAmount(totalAmount);  // Gán tổng tiền cho đơn hàng

            // Tạo danh sách các OrderItem từ CartItem
            for (CartItem item : cart.getItems()) {
                OrderItem orderItem = new OrderItem();
                orderItem.setProductId(item.getProductId());
                orderItem.setProductName(item.getProductName());
                orderItem.setQuantity(item.getQuantity());
                orderItem.setPrice(item.getProductPrice());
                orderItem.setTotal(item.getProductPrice() * item.getQuantity());
                order.addOrderItem(orderItem);  // Thêm OrderItem vào Order
            }

            // Lưu thông tin đơn hàng vào cơ sở dữ liệu
            OrderDAO orderDAO = new OrderDAO();
            int orderId = orderDAO.saveOrder(order);  // Lưu đơn hàng và lấy ID đơn hàng đã tạo

            // Lưu các OrderItems vào cơ sở dữ liệu
            for (OrderItem orderItem : order.getOrderItems()) {
                orderItem.setOrderId(orderId);  // Gán orderId cho OrderItem
                orderDAO.saveOrderItem(orderItem);  // Lưu từng OrderItem
            }

            // Xóa giỏ hàng khỏi session sau khi thanh toán
            session.removeAttribute("cart");

            // Chuyển hướng đến trang xác nhận đơn hàng
            request.setAttribute("orderId", orderId); // orderId là mã đơn hàng từ cơ sở dữ liệu
            request.getRequestDispatcher("success.jsp").forward(request, response);

        } catch (Exception e) {
            // Hiển thị thông báo lỗi nếu có lỗi xảy ra
            out.println("<html><body>");
            out.println("<h2>Lỗi xử lý thanh toán</h2>");
            out.println("<p>" + e.getMessage() + "</p>");
            e.printStackTrace(out);
            out.println("<a href='checkout.jsp'>Quay lại</a>");
            out.println("</body></html>");
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
        return "Servlet xử lý thanh toán và lưu thông tin vào cơ sở dữ liệu";
    }
}
