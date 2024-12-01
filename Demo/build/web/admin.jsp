<%-- 
    Document   : admin
    Created on : Nov 25, 2024, 8:45:09 AM
    Author     : Nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap JavaScript (nếu cần) -->
<script src="js/bootstrap.bundle.min.js"></script>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang quản lý admin</title>
        <link rel="stylesheet" href="admin.css">
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <div class="container">
            <!-- Logo và tiện ích -->
            <jsp:include page="Menu.jsp"></jsp:include>
            <!-- Sidebar -->
            <aside class="sidebar">
                <button id="manage-orders-btn">Quản lý đơn hàng</button>
                <button id="manage-products-btn">Quản lý món ăn</button>
            </aside>

            <!-- Nội dung chính -->
            <main class="main-content">
                <!-- Quản lý đơn hàng -->
                <div id="manage-orders" class="content-section active">
                    <table>
                        <thead>
                            <tr>
                                <th>Mã đơn</th>
                                <th>Tên KH</th>
                                <th>Số điện thoại</th>
                                <th>Địa chỉ</th>
                                <th>Tổng tiền</th>
                                <th>Thời gian giao hàng</th>
                                <th>Trạng thái</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Dữ liệu đơn hàng sẽ được thêm vào bằng JS -->
                        </tbody>
                    </table>
                </div>

                <!-- Quản lý món ăn -->
                <div id="manage-products" class="content-section">
                    <table>
                        <thead>
                            <tr>
                                <th>Tên món</th>
                                <th>Giá</th>
                                <th>Mô tả</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                    <button id="add-product-btn">Thêm món ăn</button>
                </div>
            </main>
        </div>
        <!-- Popup Chi tiết đơn hàng -->
        <div id="order-details-popup" class="popup hidden">
            <div class="popup-content">
                <h3>Chi tiết đơn hàng</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Tên món</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                        </tr>
                    </thead>
                    <tbody id="order-details-list">
                        <!-- Dữ liệu chi tiết sẽ được thêm ở đây -->
                    </tbody>
                </table>
                <button id="close-popup">Đóng</button>
            </div>
        </div>
        
        <!-- Popup Edit Product -->
        <div id="edit-product-popup" class="popup" style="display:none;">
            <div class="popup-content">
                <h2>Chỉnh sửa món ăn</h2>
                <form id="edit-product-form">
                    <div>
                        <label for="edit-product-id">ID món ăn:</label>
                        <input type="text" id="edit-product-id" readonly>
                    </div>
                    <div>
                        <label for="edit-product-name">Tên món ăn:</label>
                        <input type="text" id="edit-product-name" required>
                    </div>
                    <div>
                        <label for="edit-product-image">Hình ảnh món ăn:</label>
                        <input type="text" id="edit-product-image" required>
                    </div>
                    <div> 
                        <label for="edit-product-price">Giá món ăn:</label>
                        <input type="text" id="edit-product-price" required>
                    </div>
                    <div>
                        <label for="edit-product-title">Tiêu đề món ăn:</label>
                        <input type="text" id="edit-product-title" required>
                    </div>
                    <div>
                        <label for="edit-product-category">Phân loại món ăn:</label>
                        <select id="edit-product-category" required>

                        </select>
                    </div>
                    <div>
                        <label for="edit-product-description">Mô tả món:</label>
                        <textarea id="edit-product-description" required></textarea>
                    </div>
                    <button type="submit">Lưu</button>
                    <button type="button" id="close-edit-popup">Hủy</button>
                </form>
            </div>
        </div>
        <!-- Popup thêm món ăn -->
        <div id="add-product-popup" class="popup hidden">
            <div class="popup-content">
                <h3>Thêm món ăn mới</h3>
                <form id="add-product-form">
                    <div>
                        <label for="product-name">Tên món:</label>
                        <input type="text" id="product-name" placeholder="Nhập tên món ăn" required>
                    </div>
                    <div>
                        <label for="product-image">Ảnh:</label>
                        <input type="text" id="product-image" placeholder="Nhập ảnh món ăn" required>
                    </div>
                    <div>
                        <label for="product-price">Giá:</label>
                        <input type="text" id="product-price" placeholder="Nhập giá món ăn (VNĐ)" required>
                    </div>
                    <div>
                        <label for="product-title">Tiêu đề món ăn:</label>
                        <input type="text" id="product-title" placeholder="Nhập tiêu đề món ăn" required>
                    </div>
                    <div>
                        <label for="product-category">Nhập CID của món ăn:</label>
                        <input type="number" id="product-category" name="category" placeholder="Nhập CID" required>
                    </div>
                    <div>
                        <label for="product-description">Mô tả:</label>
                        <textarea id="product-description" placeholder="Nhập mô tả món ăn" required></textarea>
                    </div>

                    <button type="submit">Thêm món</button>
                    <button type="button" id="close-popup-btn">Hủy</button>
                </form>
            </div>
        </div>
        <script src="admin.js"></script>

    </body>

</html>