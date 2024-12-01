package entity;

public class OrderItem {
    private int orderItemId;    // Mã mục đơn hàng (tự động tăng)
    private int orderId;        // Mã đơn hàng mà mục này thuộc về
    private int productId;      // Mã sản phẩm
    private String productName; // Tên sản phẩm
    private double price;       // Giá sản phẩm
    private int quantity;       // Số lượng sản phẩm
    private double total;       // Tổng tiền (price * quantity)

    // Getters và Setters
    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
