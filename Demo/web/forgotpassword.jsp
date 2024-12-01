<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quên mật khẩu</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
        <style>
            body {
                background-color: #f7f8fa;
            }
            .forgot-password-container {
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
            String message = (String) request.getAttribute("msg");
            String email = request.getParameter("email");  // Giữ giá trị email đã nhập
            request.removeAttribute("msg");
            boolean readonly = (message != null && !message.equals("Email chưa được sử dụng!"));  // Kiểm tra nếu có thông báo OTP
        %>

        <div class="forgot-password-container">
            <h3 class="text-center">Quên mật khẩu</h3>
            <p class="text-center">Vui lòng nhập email của bạn để đặt lại mật khẩu. Chúng tôi sẽ gửi mã Otp đến email của bạn.</p>
            
            <%-- Hiển thị thông báo nếu có --%>
            <%
                if (message != null) {
                    out.println("<div class='alert alert-info text-center'>" + message + "</div>");
                }
            %>

            <%-- Nếu đã gửi OTP thành công, hiển thị form nhập OTP --%>
            <%
                if (message != null && message.equals("Đã gửi OTP đến email của bạn!")) {
            %>
                <form action="verifyotp" method="POST" class="forgot-password-form">
                    <div class="form-group">
                        <label for="otp">Mã OTP</label>
                        <input name="inpotp" type="text" required class="form-control" id="otp" placeholder="Nhập mã OTP">
                    </div>
                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-primary">Xác nhận OTP</button>
                    </div>
                </form>
            <%-- Nếu chưa gửi OTP, hiển thị form nhập email --%>
            <% 
                } else {
            %>
                <form action="sendmail" method="POST" class="forgot-password-form">
                    <div class="form-group">
                        <label for="email">Địa chỉ email</label>
                        <input name="email" type="email" value="<%= email != null ? email : ""%>" required class="form-control" id="email" placeholder="Email" <%= readonly ? "readonly" : ""%>>
                    </div>
                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-primary">Gửi yêu cầu</button>
                    </div>
                </form>
            <%
                }
            %>

            <p class="text-center mt-3">
                <a href="signin.jsp">Quay lại trang đăng nhập</a>
            </p>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
