<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" crossorigin="anonymous">
        <link href="signin.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="style.css">
        <title>Log In</title>   
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

            <div id="signin-form">
                <form class="form" action="login" method="post">
                    <h1 class="h3 mb-3 font-weight-normal text-center">Sign in</h1>
                    <p class="text-danger">${mess}</p>
                <div class="form-group">
                    <input name="user" id="username" type="text" class="form-control mb-3" placeholder="Enter your username" required autofocus>
                </div>
                <div class="form-group">
                    <input name="pass" id="password" type="password" class="form-control mb-3" placeholder="Enter your password" required autocomplete="off">
                </div>
                <div class="form-group form-check">
                    <input name="remember" value="1" type="checkbox" class="form-check-input" id="rememberMe">
                    <label class="form-check-label" for="rememberMe">Remember me</label>
                </div>
                <button class="btn btn-success btn-block" type="submit">Sign in</button>
                <!-- Thêm ???ng d?n "Quên m?t kh?u?" -->
                <a href="forgotpassword.jsp" class="btn btn-link">Forgot your password?</a>
                <hr>
                <a href="signup.jsp" class="btn btn-primary btn-block">Sign up New Account</a>
            </form>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
