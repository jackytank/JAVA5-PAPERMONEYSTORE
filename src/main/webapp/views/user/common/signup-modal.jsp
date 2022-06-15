<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    </head>

    <body>
        <!--SIGNUP MODAL-->
        <div class="modal fade" ng-app="myapp" ng-controller="myctl" id="SignupModal" tabindex="-1" aria-labelledby="SignupModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="md-flex justify-content-center">SIGNUP</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body mb-3">
                        <form action="/account/process_register" method="post" class="form" name="frm">
                            <div class="signup mt-3">
                                <div class="mb-3">
                                    <lable for="id">
                                        <b>Username</b>
                                    </lable>
                                    <input type="text" name="id" class="form-control" placeholder="VD: abc123" required minlength="5" maxlength="30"
                                        ng-model="id"> <em ng-if="frm.id.$invalid" class="text-danger h6">Nhập từ 5 đến 30 ký tự</em>
                                </div>
                                <div class="mb-3">
                                    <lable for="email"><b>Email</b></lable>
                                    <input required ng-model="email" type="email" name="email" class="form-control" placeholder="VD: abc@gmail.com"> <em
                                        ng-if="frm.email.$invalid" class="text-danger h6">Không
                                        đúng định dạng email</em>
                                </div>
                                <hr>
                                <div class="mb-3">
                                    <lable for="password"><b>Password</b></lable>
                                    <input type="password" name="password" class="form-control" placeholder="VD: abc123" required minlength="5" maxlength="30"
                                        ng-model="password"> <em ng-if="frm.password.$invalid" class="text-danger h6">Nhập từ 5 đến 30 ký tự</em>
                                </div>
                                <div class="mb-3">
                                    <lable for="retypePassword"><b>Retype Password</b></lable>
                                    <input type="password" name="retypePassword" class="form-control" placeholder="Nhập lại đúng phần Password !" required
                                        minlength="5" maxlength="30" ng-model="retypePassword">
                                    <em ng-if="frm.retypePassword.$invalid" class="text-danger h6">Nhập
                                        từ 5 đến 30 ký tự</em>
                                </div>
                                <hr>
                                <div class="mb-3">
                                    <lable for="phone"><b>Phone</b></lable>
                                    <input type="text" name="phone" class="form-control" placeholder="VD: 0123456789" required minlength="10" maxlength="10"
                                        ng-model="phone"> <em ng-if="frm.phone.$invalid" class="text-danger h6">Không đúng định dạng</em>
                                </div>
                                <div class="mb-3">
                                    <lable for="address"><b>Address</b></lable>
                                    <input type="text" name="address" class="form-control" placeholder="Địa chỉ đang hiện tại của bạn." required minlength="1"
                                        maxlength="100" ng-model="address"> <em ng-if="frm.address.$invalid" class="text-success h6">Vui Lòng cung cấp địa chỉ
                                        chính
                                        xác để việc giao hàng nhanh chóng hơn.</em>
                                </div>
                                <hr>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">SUBMIT</button>
                            </div>
                        </form>
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