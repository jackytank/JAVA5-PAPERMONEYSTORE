<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reset password</title>
        <!-- title icon -->
        <link rel="icon" href="/img/favicon.ico" type="image/x-icon">
        <!-- bootstrap css -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    </head>

    <body>
        <div class="row d-flex justify-content-center text-center">

            <div>
                <h2>Reset Your Password</h2>
            </div>

            <form action="/reset_password" method="post" style="max-width: 350px;">
                <input type="hidden" name="token" value="${token}" />
                <div class="border border-secondary rounded p-3">
                    <div>
                        <p>
                            <input type="password" name="password" id="password" class="form-control" placeholder="Enter your new password" required
                                autofocus />
                        </p>
                        <p>
                            <input type="password" class="form-control" placeholder="Confirm your new password" required oninput="checkPasswordMatch(this);" />
                        </p>
                        <p class="text-center">
                            <input id="submit" type="submit" value="Change Password" class="btn btn-primary" />
                        </p>
                    </div>
                </div>
            </form>
        </div>


        <!-- bootstrap js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

        <script>
            function checkPasswordMatch(confirmPass) {
                var password = document.getElementById("password");
                var submit = document.getElementById("submit");
                if (confirmPass.value != password.value) {
                    confirmPass.setCustomValidity("Passwords do not match.");
                    submit.disabled = true;
                } else {
                    confirmPass.setCustomValidity('');
                    submit.disabled = false;
                }
            }
        </script>
    </body>

    </html>