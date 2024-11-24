<%-- 
    Document   : food-detail
    Created on : Nov 15, 2024, 5:00:18 PM
    Author     : Nguye
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
            <p class="description">${detail.description}</p>
            <p class="price">${detail.price}</p>

            <label for="note" class="note-label">Ghi chú:</label>
            <textarea id="note" class="note-input" placeholder="Nhập ghi chú cho quán tại đây..."></textarea>
            <!-- Nút Đặt hàng và Thêm vào giỏ hàng -->
            <div class="button-container">
                <button class="button-order"><i class="fas fa-shopping-cart"></i> Đặt hàng</button>
                <button class="button-cart"><i class="fas fa-cart-plus"></i> Thêm vào giỏ hàng</button>
            </div>
        </div>
    </div>

   <jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>
