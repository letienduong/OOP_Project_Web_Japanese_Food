<%@page import="entity.CartItem"%>
<%@page import="entity.Cart"%>
<%@ page import="java.util.List" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ Hàng</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="cart.css">
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <jsp:include page="Menu.jsp"></jsp:include>
    <div class="container">
        <h2>Chi tiết giỏ hàng</h2>
        <%
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null || cart.getItems().isEmpty()) {
        %>
        <div class="alert alert-warning" role="alert">
            Giỏ hàng của bạn đang trống.
        </div>
        <%
            } else {
                List<CartItem> items = cart.getItems();
                double total = 0; // Tổng tiền hàng
                double shippingFee = 30000; // Phí ship cố định
        %>
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Tổng cộng</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (CartItem item : items) {
                        double itemTotal = item.getProductPrice() * item.getQuantity();
                        total += itemTotal; // Cộng tổng tiền hàng
                %>
                <tr>
                    <td><%= item.getProductId()%></td>
                    <td><%= item.getProductName()%></td>
                    <td><%= String.format("%,.0f", item.getProductPrice())%>đ</td>

                    <td>
                        <div class="d-flex align-items-center">
                            <!-- Nút giảm -->
                            <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                                <input type="hidden" name="productId" value="<%= item.getProductId()%>">
                                <input type="hidden" name="productName" value="<%= item.getProductName()%>">
                                <input type="hidden" name="productPrice" value="<%= item.getProductPrice()%>">
                                <input type="hidden" name="quantity" value="-1">
                                <button class="btn btn-decrease">-</button>
                            </form>
                            <!-- Hiển thị số lượng -->
                            <span class="mx-2 quantity"><%= item.getQuantity()%></span>
                            <!-- Nút tăng -->
                            <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                                <input type="hidden" name="productId" value="<%= item.getProductId()%>">
                                <input type="hidden" name="productName" value="<%= item.getProductName()%>">
                                <input type="hidden" name="productPrice" value="<%= item.getProductPrice()%>">
                                <input type="hidden" name="quantity" value="1">
                                <button class="btn btn-increase">+</button>
                            </form>
                        </div>
                    </td>

                    <td><%= String.format("%,.0f", itemTotal)%>đ</td>
                </tr>
                <%
                    }
                %>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="4" class="text-right font-weight-bold">Tổng tiền hàng:</td>
                    <td class="font-weight-bold"><%= String.format("%,.0f", total)%>đ</td>
                </tr>
                <tr>
                    <td colspan="4" class="text-right font-weight-bold">Phí vận chuyển:</td>
                    <td class="font-weight-bold"><%= String.format("%,.0f", shippingFee)%>đ</td>
                </tr>
                <tr>
                    <td colspan="4" class="text-right font-weight-bold">Tổng cộng:</td>
                    <td class="font-weight-bold"><%= String.format("%,.0f", total + shippingFee)%>đ</td>
                </tr>
            </tfoot>
        </table>
        <div class="text-right mt-4">
             <a href="checkout.jsp" class="btn btn-primary">Thanh Toán</a>
        </div>
        <%
            }
        %>
    </div>

    <jsp:include page="Footer.jsp"></jsp:include>
</body>

</html>
