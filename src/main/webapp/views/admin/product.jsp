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
                        <title>Admin - Product</title>
                        <!-- title icon -->
                        <link rel="icon" href="/img/favicon.ico" type="image/x-icon">
                        <!-- bootstrap css -->
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
                        <!-- bootstrap js -->
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous" defer></script>
                        <!-- font awsome -->
                        <script src="https://kit.fontawesome.com/e136359f35.js" crossorigin="anonymous" defer></script>
                        <!-- jquery -->
                        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" defer></script>
                        <!-- my js -->
                        <script src="/js/script.js" defer></script>
                    </head>

                    <body>
                        <!-- header -->
                        <jsp:include page="common/header.jsp"></jsp:include>


                        <main class="m-5" style="min-height: 100vh;" ng-app="myapp">
                            <div class="container w-75" ng-controller="myctl">
                                <ul class="nav nav-tabs mb-2" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#edit" type="button" role="tab"
                                            aria-controls="home" aria-selected="true">Edit</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#list" type="button" role="tab"
                                            aria-controls="profile" aria-selected="false">List</button>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent">
                                    <!-- edit tab -->
                                    <div class="tab-pane fade show active" id="edit" role="tabpanel" aria-labelledby="edit-tab">
                                        <form:form class="needs-validation" novalidate="true" action="" modelAttribute="product" enctype="multipart/form-data"
                                            name="frmValidate">
                                            <div class="form-group mb-3">
                                                <form:label path="image">Image: </form:label>
                                                <figure>
                                                    <c:choose>
                                                        <c:when test="${product.image != null}">
                                                            <img src="/upload/product/${product.image}" id="imageResult" alt="" class="img-fluid img-thumbnail"
                                                                width="120" height="120">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="/upload/product/error-404.jpg" id="imageResult" alt="" class="img-fluid img-thumbnail"
                                                                width="120" height="120">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </figure>
                                                <form:input id="upload" path="image" class="form-control" type="file" onchange="readURL(this);"
                                                    accept="image/png, image/jpeg" value="${product.image}" />
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="id">Id: </form:label>
                                                <form:input path="id" class="form-control" type="text" readonly="true" />
                                            </div>

                                            <div class="form-group mb-3">
                                                <form:label path="name">Name</form:label>
                                                <form:input path="name" class="form-control" type="text" required="true" minlength="5" />
                                                <label class="invalid-feedback">Please enter Name and must be greater than 5
                                                    characters !!</label>
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="price">Price: </form:label>
                                                <form:input path="price" min="1" ng-model="price" class="form-control" type="number" required="true" />
                                                <label class="invalid-feedback">Please enter price and must not be a negative
                                                    number !!</label>
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="available">Available: </form:label>
                                                <form:radiobutton id="isAvailable" path="available" value="1" /> True
                                                <form:radiobutton id="isAvailable" path="available" value="0" /> False
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="createdate">Create date:</form:label>
                                                <form:input path="createdate" class="form-control" type="date" readonly="true" />
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="categoryid.id">Category:</form:label>
                                                <form:input path="categoryid.id" required="true" class="form-control" type="text" />
                                                <label class="invalid-feedback">Please enter category</label>
                                            </div>
                                            <button class="btn btn-success" formaction="/admin/product/create" formmethod="post"
                                                ng-disabled="frmValidate.$invalid">CREATE</button>
                                            <button class="btn btn-secondary" formaction="/admin/product/update" formmethod="post"
                                                ng-disabled="frmValidate.$invalid">UPDATE</button>
                                            <button class="btn btn-danger" formaction="/admin/product/delete/${product.id}" formmethod="get">DELETE</button>
                                            <button class="btn btn-info" formaction="/admin/product/" formmethod="get">RESET</button>
                                        </form:form>
                                    </div>

                                    <!-- list tab -->
                                    <div class="tab-pane fade" id="list" role="tabpanel" aria-labelledby="list-tab">
                                        <div class="row bg-light p-2">
                                            <div class="text-center">
                                                <h3 class="text-capitalize">SORT PRODUCT BY <span class="fw-bold">a</span></h3>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="text-end">
                                                <a href="/admin/product/export-excel" class="btn btn-info  text-white fw-bold">Export Excel</a>
                                            </div>
                                        </div>
                                        <hr>
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Image</th>
                                                    <th scope="col">Id</th>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Price</th>
                                                    <th scope="col">Available</th>
                                                    <th scope="col">Create Date</th>
                                                    <th scope="col">Category ID</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="item" items="${products}" varStatus="loop">
                                                    <tr>
                                                        <th scope="row">
                                                            <img src="/upload/product/${item.image}" alt="" class="img-fluid img-thumbnail" width="80"
                                                                height="80">
                                                        </th>
                                                        <th>${item.id}</th>
                                                        <th>${item.name}</th>
                                                        <th>${item.price}</th>
                                                        <th>${item.available}</th>
                                                        <th>${item.createdate}</th>
                                                        <th>${item.categoryid.name}</th>
                                                        <th class="text-end">
                                                            <a href="/admin/product/edit/${item.id}" class="btn btn-primary" role="button">=></a>
                                                            <a href="/admin/product/delete/${item.id}" class="btn btn-danger" role="button">Del</a>
                                                        </th>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </main>


                        <!-- footer -->
                        <jsp:include page="common/footer.jsp"></jsp:include>


                        <script>

                            let message = ""
                            if ("${param.message}" != "") {
                                message += "Message: ${param.message}\n"
                            }
                            if ("${param.error}" != "") {
                                message += "Error: ${param.error}\n"
                            }
                            if ("${message}" != "") {
                                message += "Message: ${message}\n"
                            }
                            if (message !== "") {
                                alert(message);
                            }
                        </script>
                    </body>

                    </html>