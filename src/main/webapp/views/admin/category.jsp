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
                        <title>Admin - Category</title>
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


                        <main class="m-5" style="min-height: 100vh;" ng-app="myapp" ng-controller="myctl">
                            <div class="container w-50">
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
                                        <form:form class="needs-validation" novalidate="true" action="" modelAttribute="category" name="form">
                                            <div class="form-group mb-3">
                                                <form:label path="id">Category ID: </form:label>
                                                <form:input path="id" class="form-control" type="text" required="true" />
                                                <label class="invalid-feedback">Please enter id </label>
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="name">Category Name</form:label>
                                                <form:input path="name" class="form-control" type="text" required="true" />
                                                <label class="invalid-feedback">Please enter name </label>
                                            </div>
                                            <button class="btn btn-success" formaction="/admin/category/create" formmethod="post"
                                                ng-disabled="form.$invalid">CREATE</button>
                                            <button class="btn btn-secondary" formaction="/admin/category/update" formmethod="post"
                                                ng-disabled="form.$invalid">UPDATE</button>
                                            <button class="btn btn-danger" formaction="/admin/category/delete/${category.id}" formmethod="get">DELETE</button>
                                            <button class="btn btn-info" formaction="/admin/category/" formmethod="get">RESET</button>
                                        </form:form>
                                    </div>

                                    <!-- list tab -->
                                    <div class="tab-pane fade" id="list" role="tabpanel" aria-labelledby="list-tab">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">NAME</th>
                                                    <th scope="col"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="item" items="${categories}" varStatus="loop">
                                                    <tr>
                                                        <th scope="row">${item.id}</th>
                                                        <th>${item.name}</th>
                                                        <th class="text-end">
                                                            <a href="/admin/category/edit/${item.id}" class="btn btn-primary" role="button">=></a>
                                                            <a href="/admin/category/delete/${item.id}" class="btn btn-danger" role="button">Del</a>
                                                        </th>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </main>


                        <!-- header -->
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