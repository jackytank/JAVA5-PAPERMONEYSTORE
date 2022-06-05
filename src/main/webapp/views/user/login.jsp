<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Document</title>
                <link rel="stylesheet" href="/css/index.css">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous" defer></script>
                <script src="https://kit.fontawesome.com/e136359f35.js" crossorigin="anonymous" defer></script>
                <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js" defer></script>
            </head>

            <body>
                <div class="container">
                    <!-- header -->
                    <jsp:include page="common/header.jsp"></jsp:include>

                    <main class="min-vh-100">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="md-flex justify-content-center">LOGIN</h5>
                                </div>
                                <form action="/account/login" method="post">
                                    <div class="modal-body">
                                        <div class="mb-3 mt-3">
                                            <label for="username" class="form-label">Username:</label>
                                            <input type="text" class="form-control" id="username" placeholder="Enter username" name="username"
                                                value="${cookie.username.value}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="pwd" class="form-label">Password:</label>
                                            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password"
                                                value="${cookie.password.value}">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label" for="remember"></label>
                                            <input class="form-check-input" type="checkbox" id="remember" name="remember"> Remember me
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary">Login</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </main>
                    <!-- footer -->
                    <jsp:include page="common/footer.jsp"></jsp:include>
                </div>


                <script>
                    if ("${message}" != "") alert("${message}");
                </script>
            </body>

            </html>