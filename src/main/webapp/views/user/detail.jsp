<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Detail</title>
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
                        <div class="row mb-5">
                            <!-- first column : aside-->
                            <jsp:include page="common/aside.jsp"></jsp:include>

                            <!-- second column : main content-->
                            <div class="col-md-9">
                                <div class="">
                                    <div class="row d-flex justify-content-center mb-5">
                                        <div class="col-sm-5 text-center">
                                            <img class="img-thumbnail " width="350" src="/upload/product/${product.image}" alt="">
                                        </div>
                                        <div class="col-sm-7 d-flex align-items-center">
                                            <ul class="list-unstyled">
                                                <h2 class="">${product.name}</h2>
                                                <hr>
                                                <li>Price: <span class="fw-bold">${product.price} $</span></li><br>
                                                <li>Products available: <span class="fw-bold">${product.available?"In stock":"Out of stock"}</span> </li><br>
                                                <li>Tình Trạng: <span class="fw-bold">99%</span></li><br>
                                                <li>Sale: <span class="fw-bold">5%</span></li>
                                                <hr>
                                                <a href="/cart/add/${product.id}" class="btn btn-primary ">Add To Cart</a>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="row d-flex justify-content-center">
                                        <div class="text-center ">
                                            <h4>SẢN PHẨM LIÊN QUAN</h4>
                                            <hr class="my-4">
                                        </div>
                                    </div>
                                    <div class="col text-center d-flex justify-content-evenly">
                                        <c:forEach var="item" items="${relevantProducts.content}" varStatus="loop">
                                            <a href="/product/detail/${item.id}"><img class="img-thumbnail" width="125" height="125"
                                                    src="/upload/product/${item.image}" alt=""></a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>


                    <!-- footer -->
                    <jsp:include page="common/footer.jsp"></jsp:include>
                </div>
            </body>

            </html>