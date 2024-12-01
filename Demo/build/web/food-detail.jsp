<%-- 
    Document   : food-detail
    Created on : Nov 15, 2024, 5:00:18 PM
    Author     : Nguye
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap JavaScript (nếu cần) -->
<script src="js/bootstrap.bundle.min.js"></script>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi Tiết Món Ăn</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="food-detail.css">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>

        <jsp:include page="Menu.jsp"></jsp:include>

            <!-- Trang chi tiết món ăn -->
            <div class="food-detail-container">
                <!-- Hình ảnh món ăn -->
                <div class="food-image">
                    <img src="${detail.image}" alt="${detail.name}">
            </div>

            <!-- Chi tiết món ăn -->
            <div class="food-details">
                <h2>${detail.name}</h2>
                <p class="description"><strong>Mô Tả:</strong> ${detail.description}</p>
                <p class="price"><strong>Giá:</strong> ${detail.price}đ</p>

                <!-- Nút Đặt hàng và Thêm vào giỏ hàng -->
                <button type="button" class="order-btn add-to-cart" 
                        data-product-id="${detail.id}" 
                        data-product-name="${detail.name}" 
                        data-product-price="${detail.price}" 
                        data-quantity="1">
                    <i class="fas fa-cart-plus"></i> Thêm vào giỏ hàng
                </button>
            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>

            <script>
                // Gắn sự kiện cho các nút "Thêm vào giỏ hàng"
                document.querySelectorAll('.add-to-cart').forEach(button => {
                    button.addEventListener('click', function () {
                        // Lấy thông tin sản phẩm từ các thuộc tính `data-*`
                        const productId = this.dataset.productId;
                        const productName = this.dataset.productName;
                        const productPrice = this.dataset.productPrice;
                        const quantity = this.dataset.quantity;

                        // Gửi yêu cầu AJAX
                        fetch('${pageContext.request.contextPath}/add-to-cart', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded',
                            },
                            body: new URLSearchParams({
                                productId: productId,
                                productName: productName,
                                productPrice: productPrice,
                                quantity: quantity,
                            })
                        })
                                .then(response => response.json())
                    });
                });
        </script>
    </body>
</html>
