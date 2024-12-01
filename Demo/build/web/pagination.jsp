<%-- 
    Document   : pagination
    Created on : Nov 16, 2024, 4:10:53 PM
    Author     : Nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<div class="pagination-container">
    <c:forEach var="i" begin="1" end="${totalPages}">
        <a href="${baseUrl}?cid=${cid}&page=${i}" 
           class="page-button ${i == currentPage ? 'active' : ''}">
            ${i}
        </a>
    </c:forEach>
</div>
