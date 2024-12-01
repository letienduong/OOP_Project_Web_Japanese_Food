<%-- 
    Document   : success
    Created on : Nov 28, 2024, 9:07:43 AM
    Author     : Nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt Hàng Thành Công</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="style.css">    
    <link rel="stylesheet" href="success.css">
</head>

<body>
    <jsp:include page="Menu.jsp"></jsp:include>
    <div class="container text-center">
        <div class="success-message">
            <h1 class="text-success">Đặt Hàng Thành Công!</h1>
            <p>Cảm ơn bạn đã đặt hàng tại cửa hàng của chúng tôi.</p>
            <p>Mã đơn hàng của bạn là: <strong><%= request.getAttribute("orderId") %></strong></p>
            <p>Chúng tôi sẽ liên hệ với bạn để xác nhận đơn hàng và giao hàng sớm nhất có thể.</p>
        </div>

        <!-- Nút hành động -->
        <div class="action-buttons mt-4">
            <a href="HomeServlet" class="btn btn-primary">Quay Lại Trang Chủ</a>
          
        </div>
    </div>
    <jsp:include page="Footer.jsp"></jsp:include>
</body>

</html>
