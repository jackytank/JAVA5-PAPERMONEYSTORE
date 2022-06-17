<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Login</title>
                <!-- title icon -->
                <link rel="icon" href="/img/favicon.ico" type="image/x-icon">
                <!-- Google Fonts -->
                <link href="https://fonts.gstatic.com" rel="preconnect">

                <!-- Vendor CSS Files -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous" defer></script>
                <script src="https://kit.fontawesome.com/e136359f35.js" crossorigin="anonymous" defer></script>


            </head>

            <body>

                <main>
                    <div class="container">

                        <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                                        <div class="card mb-3">

                                            <div class="card-body">

                                                <div class="pt-4 pb-2">
                                                    <h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
                                                    <p class="text-center small">Enter your username & password to login</p>
                                                </div>

                                                <form action="/account/login" method="post" class="row g-3 needs-validation" novalidate>

                                                    <div class="col-12">
                                                        <label for="yourUsername" class="form-label">Username</label>
                                                        <div class="input-group has-validation">
                                                            <span class="input-group-text" id="inputGroupPrepend"><i class="fa-solid fa-user"></i></span>
                                                            <input type="text" name="username" class="form-control shadow-none" id="yourUsername" required
                                                                value="${cookie.username.value}">
                                                            <div class="invalid-feedback">Please enter your username.</div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12">
                                                        <label for="yourPassword" class="form-label">Password</label>
                                                        <div class="input-group has-validation">
                                                            <span class="input-group-text" id=""><i class="fa-solid fa-lock"></i></span>
                                                            <input type="password" name="password" class="form-control shadow-none" id="yourPassword" required
                                                                value="${cookie.password.value}">
                                                            <div class="invalid-feedback">Please enter your password!</div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" name="remember" value="true" id="rememberMe">
                                                            <label class="form-check-label" for="rememberMe">Remember me</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <button class="btn btn-primary w-100" type="submit">Login</button>
                                                    </div>
                                                    <div class="col-12">
                                                        <h3 class="text-danger">${message} ${param.error}</h3>
                                                    </div>
                                                </form>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </section>

                    </div>
                </main><!-- End #main -->

                <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

                <script>
                    // if ("${message}" != "") alert("${message}");
                </script>
            </body>

            </html>