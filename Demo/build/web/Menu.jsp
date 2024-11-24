<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link CSS chính -->
    <link rel="stylesheet" href="notmenu.css"> <!-- CSS của menu -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
   
</head>
<body>
<header>
    <!-- Logo -->
    <div class="logo" href="/">
        <a href="/demo/HomeServlet"><img src="images/logo.png" alt="logo"></a>
    </div>

    <!-- Menu -->
    <div class="menu">
        <c:forEach var="o" items="${listCC}">
            <li>
                <a href="category?cid=${o.cid}" class="${param.cid == o.cid ? 'active' : ''}">${o.cname}</a>
            </li>
        </c:forEach>
    </div>

    <!-- Other icons -->
    <div class="others">
         <!-- Quản lý -->
     <c:if test="${sessionScope.acc.isAdmin == 1}">
    <li class="manager">
        <a href="managecontrol"><i class="fas fa-cog"></i></a> <!-- Liên kết đến trang quản lý -->
    </li>
     </c:if>
        <!-- Dropdown -->
        <li class="dropdown">
            <c:if test="${sessionScope.acc == null}">
            <a class="user" href="signin.jsp"><i class="fas fa-user"></i></a> <!-- Chuyển đến signup.jsp khi click -->
            </c:if>
            <c:if test="${sessionScope.acc != null}">
            <a class="user" href="profile.jsp"><i class="fas fa-user"></i></a> <!-- Chuyển đến signup.jsp khi click -->
            </c:if>
            <div class="dropdown-menu">
                <c:if test="${sessionScope.acc == null}">
                <a href="signin.jsp">Sign In</a>
                <a href="signup.jsp">Sign Up</a>
                </c:if>
                 <c:if test="${sessionScope.acc != null}">
                <a href="profile.jsp">Profile</a>
                <a href="logout">Sign Out</a>
                </c:if>
            </div>
        </li>
        <!-- Shopping cart -->
        <li><a class="giohang" href="#"><i class="fas fa-shopping-cart"></i></a></li>
    </div>
</header>

<!-- JavaScript xử lý dropdown -->
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const dropdown = document.querySelector('.dropdown');
        const dropdownMenu = document.querySelector('.dropdown-menu');
        let timeout; // Biến kiểm soát thời gian ẩn menu

        // Hiển thị menu khi hover vào dropdown
        dropdown.addEventListener('mouseenter', () => {
            clearTimeout(timeout); // Hủy bỏ ẩn menu nếu có
            dropdownMenu.style.opacity = '1';
            dropdownMenu.style.visibility = 'visible';
        });

        // Ẩn menu khi rời chuột khỏi dropdown (thêm độ trễ)
        dropdown.addEventListener('mouseleave', () => {
            timeout = setTimeout(() => {
                dropdownMenu.style.opacity = '0';
                dropdownMenu.style.visibility = 'hidden';
            }, 300); // Thời gian ẩn menu (300ms)
        });
    });
</script>
</body>
</html>
