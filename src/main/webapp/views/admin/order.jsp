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
                        <title>Admin - Order</title>

                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous" defer></script>
                        <script src="https://kit.fontawesome.com/e136359f35.js" crossorigin="anonymous" defer></script>
                    </head>

                    <body>
                        <!-- header -->
                        <jsp:include page="common/header.jsp"></jsp:include>


                        <main class="m-5" style="min-height: 100vh;">
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
                                        <form:form action="" modelAttribute="ord">
                                            <div class="form-group mb-3">
                                                <form:label path="id"> ID: </form:label>
                                                <form:input path="id" class="form-control" type="text" />
                                            </div>
                                            <div class="form-group mb-3">
                                                <form:label path="address">ADDRESS</form:label>
                                                <form:input path="address" class="form-control" type="text" />
                                            </div>
                                             <div class="form-group mb-3">
                                                <form:label path="createdate">CREATEDATE</form:label>
                                                <form:input path="createdate" class="form-control" type="text" />
                                            </div>
                                               <button class="btn btn-danger" formaction="/admin/order/delete/${ord.id}" formmethod="get">DELETE</button>
                                            <button class="btn btn-info" formaction="/admin/order/" formmethod="get">RESET</button>
                                        </form:form>
                                    </div>

                                    <!-- list tab -->
                                    <div class="tab-pane fade" id="list" role="tabpanel" aria-labelledby="list-tab">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">ADDRESS</th>
                                                     <th scope="col">DATE</th>
                                                  
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="item" items="${ords}" varStatus="loop">
                                                    <tr>
                                                        <th scope="row">${item.id}</th>
                                                        <th>${item.address}</th>
                                                         <th>${item.createdate}</th>
                                                        <th class="text-end">
                                                            <a href="/admin/order/edit/${item.id}" class="btn btn-primary" role="button">=></a>
                                                            <a href="/admin/order/delete/${item.id}" class="btn btn-danger" role="button">Del</a>
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



                    </body>

                    </html>