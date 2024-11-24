<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Product</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h3>Edit Product</h3>
                </div>
                <div class="card-body">
                    <form action="editproduct" method="post">
                        <div class="form-group">
                            <label>ID</label>
                            <input value="${detail.id}" name="id" type="text" class="form-control" readonly required>
                        </div>
                        <div class="form-group">
                            <label>Name</label>
                            <input value="${detail.name}" name="name" type="text" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label>Image</label>
                            <input value="${detail.image}" name="image" type="text" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label>Price</label>
                            <input value="${detail.price}" name="price" type="text" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label>Title</label>
                            <textarea value="" name="title" type="text" class="form-control" required>${detail.title}</textarea>
                        </div>

                        <div class="form-group">
                            <label>Description</label>
                            <textarea value="" name="description" type="text" class="form-control" required>${detail.description}</textarea>
                        </div>

                        <div class="form-group">
                            <label>Category</label>
                            <select name="category" class="form-select" aria-label="Default select example">
                                <c:forEach items="${listCC}" var="o">
                                    <!-- Comparing the current category id of the product with the options -->
                                    <option value="${o.cid}" ${o.cid == detail.cid ? 'selected="selected"' : ''}>${o.cname}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-success">Save</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5
