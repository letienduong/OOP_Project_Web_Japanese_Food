<%-- 
    Document   : home
    Created on : Nov 13, 2024, 3:38:05 PM
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="style.css">
        <title>Website bán đồ ăn</title>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <main class="main-wrapper">
            <c:if test="${(empty param.cid || param.cid == 0)&& (param.page == '1'|| empty param.page)}">
                <div class="center-image-container">
                    <img src="images/Bannerchinh.png" alt="Banner chính" width="1000" height="auto">
                </div>
            </c:if>
            <div class="home-title-block" id="home-title">
                <h2 class="home-title">Khám phá thực đơn của chúng tôi</h2>
            </div>
            <!-- Danh sách menu món ăn -->
            <div class="menu-container">
                <div class="menu-grid">
                    <!-- Sử dụng vòng lặp để hiển thị các món ăn -->
                    <c:forEach var="o" items="${listPP}">
                        <div class="menu-item">
                            <a href="food-detail?idid=${o.id}">
                                <img src="${o.image}" alt="${o.name}">
                                <h3>${o.name}</h3>
                                <p class="description">${o.title}</p>
                                <p class="price">${o.price}</p>
                            </a>
                            <a href="food-detail?idid=${o.id}">
                                <button class="order-btn"><i class="fas fa-shopping-cart"></i> ĐẶT MÓN</button>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </main>
        <!-- Phân trang -->
        <jsp:include page="pagination.jsp">
            <jsp:param name="baseUrl" value="HomeServlet" />
        </jsp:include>
        <jsp:include page="Footer.jsp"></jsp:include>

    </body>
</html>
