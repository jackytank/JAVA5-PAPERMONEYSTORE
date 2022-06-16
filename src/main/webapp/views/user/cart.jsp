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
                <!-- title icon -->
                <link rel="icon" href="/img/favicon.ico" type="image/x-icon">
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

                    <main class="h-100">
                        <div class="row d-flex justify-content-center min-vh-100">
                            <!-- CART -->
                            <div class="col-sm-8">
                                <div class="card p-4">
                                    <div class="card-title">
                                        <h5 class="text-capitalize" id="CartLabel">
                                            MY CART
                                        </h5>
                                    </div>
                                    <div class="cart-body">
                                        <table class="table table-responsive cartTable">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Image</th>
                                                    <th scope="col">Product</th>
                                                    <th scope="col">Price</th>
                                                    <th scope="col">Qty</th>
                                                    <th scope="col">Total</th>
                                                    <th scope="col">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="item" items="${cartItems}" varStatus="loop">
                                                    <form action="/cart/update" method="post">
                                                        <tr>
                                                            <input type="hidden" name="id" value="${item.id}">
                                                            <td>${item.id}</td>
                                                            <td>
                                                                <img src="/upload/product/${item.image}" alt="" class="img-fluid img-thumbnail" width="80" height="80">
                                                            </td>
                                                            <td>${item.name}</td>
                                                            <td>${item.price} $</td>
                                                            <td class="col-md-2"><input type="number" class="form-control input-sm" onblur="this.form.submit()"
                                                                    onchange="this.form.submit()" name="qty" id="qty" value="${item.qty}">
                                                            </td>
                                                            <td>${item.price * item.qty} $</td>
                                                            <td>
                                                                <!-- Remove button -->
                                                                <a href="/cart/remove/${item.id}" class="btn btn-danger btn-sm">
                                                                    <i class="fa fa-times"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </form>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class="d-flex justify-content-end">
                                            <h5>Total: <span class="text-success ms-3">${totalAmount} $</span></h5>
                                        </div>
                                        <hr>
                                        <div class="border-top-0 d-flex justify-content-between">
                                            <a href="/" class="btn btn-secondary">&larr; Go back</a>
                                            <a href="/cart/clear" class="btn btn-danger">Clear cart</a>
                                            <a href="/cart/checkout/<% out.print((String)session.getAttribute(" username")); %></a>" class="btn btn-success"
                                            onclick="confirmCheckout()">Checkout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </main>
                    <!-- footer -->
                    <jsp:include page="common/footer.jsp"></jsp:include>
                </div>


                <script>
                    function confirmCheckout() {
                        if ("${totalAmount}" != 0) {
                            confirm("Do you want to checkout?")
                        }
                    }
                </script>
            </body>

            </html>