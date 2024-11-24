<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="signup.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="style.css">
        <title>Sign Up</title>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
     
                <div id="signup-form">
                    <form class="form" action="signup" method="post">
                        <h1 class="h3 mb-3 font-weight-normal text-center">Sign up</h1>
                         <p class="text-danger">${error}</p>
                        <input name="user" type="text" class="form-control mb-3" placeholder="Username" required autofocus>
                        <input name="pass" type="password" class="form-control mb-3" placeholder="Password" required>
                        <input name="repass" type="password" class="form-control mb-3" placeholder="Repeat Password" required>
                        <button class="btn btn-primary btn-block" type="submit">Sign up</button>
                         <hr class="custom-hr">
                        <a href="signin.jsp" class="btn btn-secondary btn-block back-to-signin    ">Back to Sign In</a>
                    </form>
                </div>
          
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
