<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
                <%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Document</title>
                    </head>

                    <body>
                        <header>
                            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                                <div class="container-fluid">
                                    <a class="navbar-brand fw-bolder fs-4 text-primary me-5" href="#">Adminstrator</a>
                                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                        <span class="navbar-toggler-icon"></span>
                                    </button>
                                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                            <li class="nav-item">
                                                <a href="/admin/index" class="nav-link ">
                                                    <i class="fa-solid fa-house bi d-block mx-auto mb-1"></i>
                                                    Home
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="/admin/account" class="nav-link ">
                                                    <i class="fa-solid fa-users bi d-block mx-auto mb-1"></i>
                                                    Accounts
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="/admin/category" class="nav-link ">
                                                    <i class="fa-solid fa-tags bi d-block mx-auto mb-1"></i>
                                                    Category
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="/admin/product" class="nav-link ">
                                                    <i class="fa-solid fa-certificate bi d-block mx-auto mb-1"></i>
                                                    Product
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="/admin/order" class="nav-link ">
                                                    <i class="fa-solid fa-cart-shopping bi d-block mx-auto mb-1"></i>
                                                    Order
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="/admin/report" class="nav-link ">
                                                    <i class="fa-solid fa-chart-bar bi d-block mx-auto mb-1"></i>
                                                    Report
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="/admin/revenue" class="nav-link ">
                                                    <i class="fa-solid fa-dollar-sign bi d-block mx-auto mb-1"></i>
                                                    Revenue
                                                </a>
                                            </li>
                                        </ul>
                                        <form class="d-flex">
                                            <span class="align-self-center text-nowrap me-2">Hi <span class="fw-bold">Jackytank</span></span>
                                            <a class="btn btn-danger">Logout</a>
                                        </form>
                                    </div>
                                </div>
                            </nav>
                        </header>
                    </body>

                    </html>