package dao;

import entity.Order;
import entity.OrderItem;
import context.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    // Lưu đơn hàng vào cơ sở dữ liệu
    public int saveOrder(Order order) throws SQLException, Exception {
        int orderId = -1;
        String sql = "INSERT INTO Orders (customer_name, customer_address, customer_phone, delivery_time, note, total_amount, status) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, order.getReceiverName());
            stmt.setString(2, order.getReceiverAddress());
            stmt.setString(3, order.getReceiverPhone());
            stmt.setString(4, order.getTimeSlot());
            stmt.setString(5, order.getNote());
            stmt.setDouble(6, order.getTotalAmount());
            stmt.setString(7, "Pending");

            stmt.executeUpdate();

            // Lấy ID của đơn hàng vừa tạo
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1);
            }
        }
        return orderId;
    }

    // Lưu từng sản phẩm vào bảng OrderItems
    public void saveOrderItem(OrderItem orderItem) throws SQLException, Exception {
        String sql = "INSERT INTO OrderItems (order_id, product_id, product_name, product_price, quantity, total_price) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, orderItem.getOrderId());
            stmt.setInt(2, orderItem.getProductId());
            stmt.setString(3, orderItem.getProductName());
            stmt.setDouble(4, orderItem.getPrice());
            stmt.setInt(5, orderItem.getQuantity());
            stmt.setDouble(6, orderItem.getTotal());
            stmt.executeUpdate();
        }
    }
    

    public List<Order> getAllOrders() throws Exception {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement stmt = conn.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setReceiverName(rs.getString("customer_name"));
                order.setReceiverAddress(rs.getString("customer_address"));
                order.setReceiverPhone(rs.getString("customer_phone"));
                order.setTimeSlot(rs.getString("delivery_time"));
                order.setNote(rs.getString("note"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setStatus(rs.getString("status"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();  // In lỗi chi tiết
            throw new Exception("Error getting orders from database", e);
        }
        return orders;
    }

    // Lấy các sản phẩm trong đơn hàng
    public List<OrderItem> getOrderItemsByOrderId(int orderId) throws Exception {
    List<OrderItem> items = new ArrayList<>();
    String query = "SELECT * FROM OrderItems WHERE order_id = ?";

    try (Connection conn = new DBContext().getConnection(); 
         PreparedStatement stmt = conn.prepareStatement(query)) {

        stmt.setInt(1, orderId);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            OrderItem item = new OrderItem();
            item.setOrderItemId(rs.getInt("order_item_id"));
            item.setProductId(rs.getInt("product_id"));
            item.setProductName(rs.getString("product_name"));
            item.setPrice(rs.getDouble("product_price"));
            item.setQuantity(rs.getInt("quantity"));
            item.setTotal(rs.getDouble("total_price"));
            items.add(item);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return items;
}

    public static boolean updateOrderStatus(int orderId, String newStatus) throws Exception {
        String query = "UPDATE orders SET status = ? WHERE order_id = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, newStatus);
            stmt.setInt(2, orderId);
            return stmt.executeUpdate() > 0; // Trả về true nếu cập nhật thành công
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    private Connection getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
      
}
