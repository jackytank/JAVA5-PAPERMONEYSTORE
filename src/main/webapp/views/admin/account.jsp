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
                        <title>Admin - Account</title>
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
                        <!-- my js -->
                        <script src="/js/script.js" defer></script>


                    </head>

                    <body>

                        <!-- header -->
                        <jsp:include page="common/header.jsp"></jsp:include>


                        <main class="m-5" style="min-height: 100vh;">
                            <div class="container w-75">
                                <ul class="nav nav-tabs mb-2" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="form-tab" data-bs-toggle="tab" data-bs-target="#edit" type="button" role="tab"
                                            aria-controls="home" aria-selected="true">Edit</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="list-tab" data-bs-toggle="tab" data-bs-target="#list" type="button" role="tab"
                                            aria-controls="profile" aria-selected="false">List</button>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent">
                                    <!-- edit tab -->
                                    <div class="tab-pane fade show active" id="edit" role="tabpanel" aria-labelledby="edit-tab">
                                        <form:form class="needs-validation" novalidate="true" action="" modelAttribute="account" enctype="multipart/form-data"
                                            name="form">
                                            <div class="form-group mb-3">
                                                <form:label path="image">Image: </form:label>
                                                <figure>
                                                    <c:choose>
                                                        <c:when test="${account.image != null}">
                                                            <img src="/upload/user/${account.image}" id="imageResult" alt="" class="img-fluid img-thumbnail"
                                                                width="120" height="120">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="/upload/user/error-404.jpg" id="imageResult" alt="" class="img-fluid img-thumbnail"
                                                                width="120" height="120">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </figure>
                                                <form:input id="upload" path="image" class="form-control" type="file" onchange="readURL(this);"
                                                    accept="image/png, image/jpeg" value="${account.image}" />
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="id">Username: </form:label>
                                                <form:input path="id" class="form-control" type="text" required="true" />
                                                <label class="invalid-feedback">Please enter UserName </label>
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="email">Email</form:label>
                                                <form:input path="email" class="form-control" type="email" required="true" />
                                                <label class="invalid-feedback">Please enter Email </label>
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="password">Password</form:label>
                                                <form:input path="password" class="form-control" type="password" minlength="5" maxlength="30" required="true" />
                                                <label class="invalid-feedback">Please enter Password between 5 and 30 characters
                                                </label>
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="phone">Phone: </form:label>
                                                <form:input path="phone" class="form-control" type="tel" required="true" />
                                                <label class="invalid-feedback">Please enter Phone </label>
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="address">Address: </form:label>
                                                <form:input path="address" class="form-control" type="text" required="true" />
                                                <label class="invalid-feedback">Please enter Address </label>
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="activated">Is Activated: </form:label>
                                                <form:radiobutton id="isActivated1" path="activated" value="1" /> True
                                                <form:radiobutton id="isActivated2" path="activated" value="0" /> False
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="admin">Is Admin: </form:label>
                                                <form:radiobutton id="isAdmin1" path="admin" value="1" /> True
                                                <form:radiobutton id="isAdmin2" path="admin" value="0" /> False
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="verifycode">Verify code:</form:label>
                                                <form:input path="verifycode" class="form-control" type="text" required="true" />
                                                <label class="invalid-feedback">Please enter code </label>
                                            </div>
                                            <button id="createBtn" class="btn btn-success" formaction="/admin/account/create" formmethod="post"
                                                ng-disabled="form.$invalid">CREATE</button>
                                            <button class="btn btn-secondary" formaction="/admin/account/update" formmethod="post"
                                                ng-disabled="form.$invalid">UPDATE</button>
                                            <button class="btn btn-danger" formaction="/admin/account/delete/${account.id}" formmethod="get">DELETE</button>
                                            <button class="btn btn-info" formaction="/admin/account/" formmethod="get">RESET</button>
                                        </form:form>
                                    </div>

                                    <!-- list tab -->
                                    <div class="tab-pane fade" id="list" role="tabpanel" aria-labelledby="list-tab">
                                        <div class="row bg-light p-2">
                                            <div class="text-center">
                                                <h3 class="text-capitalize">SORT ACCOUNT BY <span class="fw-bold">${field}</span></h3>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="text-end">
                                                <a href="/admin/account/export-pdf" class="btn btn-info  text-white fw-bold">Export PDF</a>
                                                <a href="/admin/account/export-excel" class="btn btn-info  text-white fw-bold">Export Excel</a>
                                            </div>
                                        </div>
                                        <hr>
                                        <table class="table table-hover" style="table-layout: fixed; word-wrap: break-word;">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Image</th>
                                                    <th scope="col"><a href="/admin/account/sort?field=id">Username</a></th>
                                                    <th scope="col"><a href="/admin/account/sort?field=email">Email</a></th>
                                                    <th style="width:25%" scope="col"><a href="/admin/account/sort?field=password">Password</a></th>
                                                    <th scope="col"><a href="/admin/account/sort?field=phone">Phone</a></th>
                                                    <th scope="col"><a href="/admin/account/sort?field=address">Address</a></th>
                                                    <th scope="col"><a href="/admin/account/sort?field=activated">Activated?</a></th>
                                                    <th scope="col"><a href="/admin/account/sort?field=admin">Admin?</a></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="item" items="${accounts}" varStatus="loop">
                                                    <tr>
                                                        <th scope="row">
                                                            <img src="/upload/user/${item.image}" alt="" class="img-fluid img-thumbnail" width="80" height="80">
                                                        </th>
                                                        <td>${item.id}</td>
                                                        <td>${item.email}</td>
                                                        <td>${item.password}</td>
                                                        <td>${item.phone}</td>
                                                        <td>${item.address}<tdh>
                                                        <td>${item.activated}</td>
                                                        <td>${item.admin}</td>
                                                        <td class="text-end">
                                                            <div class="btn-group">
                                                                <a href="/admin/account/edit/${item.id}" class="btn btn-primary" role="button">=></a>
                                                                <a href="/admin/account/delete/${item.id}" class="btn btn-danger" role="button">Del</a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <!-- jquery -->
                        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

                        <script>

                            let message = ""
                            if ("${param.message}" != "") {
                                message += "Message: ${param.message}\n"
                                // alert("Message: ${param.message}");
                            }
                            if ("${param.error}" != "") {
                                message += "Error: ${param.error}\n"
                                // alert("${param.error}");
                            }
                            if ("${message}" != "") {
                                message += "Message: ${message}\n"
                                // alert("Message: ${message}");
                            }
                            if (message !== "") {
                                alert(message);
                            }


                        </script>
                        <!-- header -->
                        <jsp:include page="common/footer.jsp"></jsp:include>
                    </body>

                    </html>