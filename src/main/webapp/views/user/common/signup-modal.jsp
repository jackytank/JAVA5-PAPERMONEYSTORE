<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
                <%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta charset="ISO-8859-1">
                        <title>Insert title here</title>
                    </head>

                    <body>
                        <!--SIGNUP MODAL-->
                        <div class="modal fade" ng-app="myapp" ng-controller="myctl" id="SignupModal" tabindex="-1" aria-labelledby="SignupModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="md-flex justify-content-center">SIGNUP</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body mb-3">
                                        <form:form action="/account/signup" method="post" class="form" name="frm" enctype="multipart/form-data"
                                            modelAttribute="accForm">
                                            <div class="signup mt-3">
                                                <div class="form-group mb-3">
                                                    <form:label path="image">Image: </form:label>
                                                    <figure>
                                                        <c:choose>
                                                            <c:when test="${accForm.image != null}">
                                                                <img src="/upload/user/${accForm.image}" id="imageResult" alt="" class="img-fluid img-thumbnail"
                                                                    width="120" height="120">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="/upload/user/error-404.jpg" id="imageResult" alt="" class="img-fluid img-thumbnail"
                                                                    width="120" height="120">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </figure>
                                                    <form:input id="upload" path="image" class="form-control" type="file" onchange="readURL(this);"
                                                        accept="image/png, image/jpeg" value="${accForm.image}" />
                                                </div>
                                                <div class="mb-3">
                                                    <form:label path="id" for="id">
                                                        <b>Username</b>
                                                    </form:label>
                                                    <form:input type="text" path="id" class="form-control" placeholder="VD: abc123" required="true"
                                                        minlength="5" maxlength="30" ng-model="id" />
                                                    <em ng-if="frm.id.$invalid" class="text-danger h6">Nhập từ 5
                                                        đến 30 ký tự</em>
                                                </div>
                                                <div class="mb-3">
                                                    <form:label path="email" for="email"><b>Email</b></form:label>
                                                    <form:input required="true" ng-model="email" type="email" path="email" class="form-control"
                                                        placeholder="VD: abc@gmail.com" />
                                                    <em ng-if="frm.email.$invalid" class="text-danger h6">Không
                                                        đúng định dạng email</em>
                                                </div>
                                                <hr>
                                                <div class="mb-3">
                                                    <form:label path="password" for="password"><b>Password</b></form:label>
                                                    <form:input type="password" path="password" class="form-control" placeholder="VD: abc123" required="true"
                                                        minlength="5" maxlength="30" ng-model="password" />
                                                    <em ng-if="frm.password.$invalid" class="text-danger h6">Nhập từ 5 đến 30 ký tự</em>
                                                </div>
                                                <div class="mb-3">
                                                    <form:label path="retypePassword" for="retypePassword"><b>Retype Password</b></form:label>
                                                    <form:input type="password" path="retypePassword" class="form-control"
                                                        placeholder="Nhập lại đúng phần Password !" required="true" minlength="5" maxlength="30"
                                                        ng-model="retypePassword" />
                                                    <em ng-if="frm.retypePassword.$invalid" class="text-danger h6">Nhập
                                                        từ 5 đến 30 ký tự</em>
                                                </div>
                                                <hr>
                                                <div class="mb-3">
                                                    <form:label path="phone" for="phone"><b>Phone</b></form:label>
                                                    <form:input type="text" path="phone" class="form-control" placeholder="VD: 0123456789" required="true"
                                                        minlength="10" maxlength="10" ng-model="phone" />
                                                    <em ng-if="frm.phone.$invalid" class="text-danger h6">Không đúng định dạng</em>
                                                </div>
                                                <div class="mb-3">
                                                    <form:label path="address" for="address"><b>Address</b></form:label>
                                                    <form:input type="text" path="address" class="form-control" placeholder="Địa chỉ đang hiện tại của bạn."
                                                        required="true" minlength="1" maxlength="100" ng-model="address" />
                                                    <em ng-if="frm.address.$invalid" class="text-success h6">Vui Lòng cung cấp địa chỉ
                                                        chính
                                                        xác để việc giao hàng nhanh chóng hơn.</em>
                                                </div>
                                                <hr>
                                            </div>
                                            <div class="d-grid gap-2">
                                                <button ng-disabled="frm.$invalid" type="submit" class="btn btn-primary">SUBMIT</button>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <script>
                            var app = angular.module("myapp", []);
                            app.controller("myctl", function ($scope) {

                            })


                        </script>


                    </body>

                    </html>