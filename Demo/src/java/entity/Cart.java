package entity;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartItem> items;

    public Cart() {
        this.items = new ArrayList<>();
    }

    public void addItem(CartItem item) {
        // Kiểm tra nếu sản phẩm đã tồn tại
        for (CartItem cartItem : items) {
            if (cartItem.getProductId() == item.getProductId()) {
                // Cập nhật số lượng
                int updatedQuantity = cartItem.getQuantity() + item.getQuantity();

                // Nếu số lượng <= 0, xóa sản phẩm khỏi giỏ hàng
                if (updatedQuantity <= 0) {
                    items.remove(cartItem);
                } else {
                    cartItem.setQuantity(updatedQuantity);
                }
                return;
            }
        }

        // Nếu sản phẩm chưa tồn tại và số lượng > 0, thêm sản phẩm vào giỏ hàng
        if (item.getQuantity() > 0) {
            items.add(item);
        }
    }

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }
}
