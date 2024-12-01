<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi mật khẩu</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            background-color: #f7f8fa;
        }
        .change-password-container {
            max-width: 450px;
            margin: 100px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        h3.text-center {
            color: #333333;
            font-weight: bold;
        }
        p.text-center {
            color: #666666;
            margin-bottom: 20px;
        }
        .btn-primary {
            margin: 20px auto;
            background-color: #007bff;
            border-color: #007bff;
            font-size: 16px;
            font-weight: bold;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .form-group label {
            font-weight: 600;
            color: #555555;
        }
        .form-control {
            padding: 10px;
            font-size: 14px;
        }
        .text-center a {
            color: #007bff;
            font-size: 14px;
            text-decoration: none;
        }
        .text-center a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <jsp:include page="Menu.jsp"></jsp:include>
    <%
        String email = (String) session.getAttribute("email");
        String message = (String) request.getAttribute("msg");
        request.removeAttribute("msg");

        if (email == null) {
            response.sendRedirect("forgotpassword.jsp");
            return;
        }
    %>

    <div class="change-password-container">
        <h3 class="text-center">Đổi mật khẩu</h3>
        <p class="text-center">Vui lòng nhập mật khẩu mới của bạn.</p>

        <% if (message != null) { %>
            <div class="alert alert-info text-center"><%= message %></div>
        <% } %>

        <form action="changepassword" method="POST" class="change-password-form">
            <div>
                <input name="email1" value="<%= email %>" readonly hidden/>
            </div>
            <div class="form-group">
                <label for="newPassword">Mật khẩu mới</label>
                <input name="newpassword" type="password" required class="form-control" id="newPassword" placeholder="Nhập mật khẩu mới">
            </div>

            <div class="form-group">
                <label for="confirmPassword">Xác nhận mật khẩu mới</label>
                <input name="confirmpassword" type="password" required class="form-control" id="confirmPassword" placeholder="Xác nhận mật khẩu mới">
            </div>

            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
            </div>
        </form>

        <p class="text-center mt-3">
            <a href="signin.jsp">Quay lại trang đăng nhập</a>
        </p>
    </div>

    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
