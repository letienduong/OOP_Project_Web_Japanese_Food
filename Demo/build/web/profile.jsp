<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap JavaScript (nếu cần) -->
<script src="js/bootstrap.bundle.min.js"></script>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thông Tin Tài Khoản</title>
        <link rel="stylesheet" href="profile1.css">
        <link rel="stylesheet" href="style.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    </head>
    <body>

        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container" id="account-user">
                <div class="main-account">
                    <div class="main-account-header">
                        <h3>Thông tin tài khoản của bạn</h3>
                        <p>Quản lý thông tin để bảo mật tài khoản</p>
                    </div>
                    <div class="main-account-body">
                        <!-- Cập nhật thông tin cá nhân -->
                        <div class="account-left">
                            <form action="UpdateProfileServlet" method="POST" class="info-user">
                                <div class="form-group">
                                    <label for="infoname" class="form-label">Họ và tên</label>
                                    <input class="form-control" type="text" name="infoname" id="infoname" 
                                           value="${name}" required>
                            </div>
                            <div class="form-group">
                                <label for="infophone" class="form-label">Số điện thoại</label>
                                <input class="form-control" type="text" name="infophone" id="infophone" 
                                       value="${phoneNumber}" required>
                            </div>
                            <div class="form-group">
                                <label for="infoemail" class="form-label">Email</label>
                                <input class="form-control" type="email" name="infoemail" id="infoemail" 
                                       value="${email}" required>
                            </div>
                            <div class="form-group">
                                <label for="infoaddress" class="form-label">Địa chỉ</label>
                                <input class="form-control" type="text" name="infoaddress" id="infoaddress" 
                                       value="${address}" required>
                            </div>
                            <button type="submit" id="save-info-user" class="btn btn-primary">
                                <i class="fa-regular fa-floppy-disk"></i> Lưu thay đổi
                            </button>
                        </form>

                    </div>

                    <!-- Cập nhật mật khẩu -->
                    <div class="account-right">
                        <!-- Thông báo thành công -->
                        <c:if test="${not empty successMessage}">
                            <div class="alert alert-success">
                                ${successMessage}
                            </div>
                        </c:if>

                        <!-- Thông báo lỗi nếu mật khẩu cũ không đúng -->
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger">
                                ${errorMessage}
                            </div>
                        </c:if>
                        <form action="UpdatePasswordServlet" method="POST" class="change-password">
                            <div class="form-group">
                                <label for="password-cur-info" class="form-label">Mật khẩu hiện tại</label>
                                <input class="form-control" type="password" name="password-cur-info" id="password-cur-info" 
                                       placeholder="Nhập mật khẩu hiện tại" required>
                            </div>
                            <div class="form-group">
                                <label for="password-after-info" class="form-label">Mật khẩu mới</label>
                                <input class="form-control" type="password" name="password-after-info" id="password-after-info" 
                                       placeholder="Nhập mật khẩu mới" required>
                            </div>
                            <div class="form-group">
                                <label for="password-comfirm-info" class="form-label">Xác nhận mật khẩu mới</label>
                                <input class="form-control" type="password" name="password-comfirm-info" id="password-comfirm-info" 
                                       placeholder="Nhập lại mật khẩu mới" required>
                            </div>
                            <div>
                                <button type="submit" id="save-password" class="btn btn-primary">
                                    <i class="fa-solid fa-key"></i> Đổi mật khẩu
                                </button>
                            </div>
                        </form>
                    </div>


                    <!-- Nút lưu thông tin -->
                    <div class="main-account-body-row">
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
