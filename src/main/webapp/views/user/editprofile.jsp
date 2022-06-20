<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
                <%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8" />
                        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                        <title>Edit profile</title>
                        <!-- title icon -->
                        <link rel="icon" href="/img/favicon.ico" type="image/x-icon">
                        <!-- bootstrap css -->
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
                            integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
                        <!-- font awsome -->
                        <script src="https://kit.fontawesome.com/e136359f35.js" crossorigin="anonymous" defer></script>
                        <!-- jquery -->
                        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" defer></script>
                        <!-- my js -->
                        <script src="/js/script.js" defer></script>
                    </head>

                    <body>
                        <div class="container">
                            <!-- header -->
                            <jsp:include page="common/header.jsp"></jsp:include>
                            <div class="row d-flex justify-content-center">
                                <div class="card my-3" style="width: 50rem;">
                                    <div class="bg-white card-header text-center">
                                        <h3>EDIT PROFILE</h3>
                                    </div>
                                    <div class="card-body">
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
                                                <form:input path="id" class="form-control" type="text" required="true" readonly="true" />
                                                <label class="invalid-feedback">Please enter username </label>
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="email">Email</form:label>
                                                <form:input path="email" class="form-control" type="email" required="true" />
                                                <label class="invalid-feedback">Please enter email </label>
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="password">Password</form:label>
                                                <form:input path="password" class="form-control" type="password" minlength="5" maxlength="30" required="true" />
                                                <label class="invalid-feedback">Please enter password between 5 and 30 characters
                                                </label>
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="phone">Phone: </form:label>
                                                <form:input path="phone" class="form-control" type="tel" required="true" />
                                                <label class="invalid-feedback">Please enter phone </label>
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="address">Address: </form:label>
                                                <form:input path="address" class="form-control" type="text" required="true" />
                                                <label class="invalid-feedback">Please enter address </label>
                                            </div>
                                            <button class="btn btn-success" formaction="/account/update" formmethod="post">UPDATE</button>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                            <!-- footer -->
                            <jsp:include page="common/footer.jsp"></jsp:include>
                        </div>

                        <!-- bootstrap js -->
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
                            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
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