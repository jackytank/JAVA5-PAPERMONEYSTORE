<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Contact us</title>
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
          <div class="row my-5">
            <div class="col-sm-6">
              <form action="/contactus/send" method="post">
                <div class="mb-3 mt-3">
                  <h4>CONTACT INFORMATION</h4>
                </div>
                <div class="mb-3 mt-3">
                  <label for="name" class="form-label">Fullname:</label>
                  <input type="text" class="form-control" placeholder="Fullname" name="name" /><br>
                  <label class="text-danger">${invalidName}</label>
                </div>
                <div class="mb-3">
                  <label for="phone" class="form-label">Phone number:</label>
                  <input type="tel" class="form-control" placeholder="Phone number" name="phone" /><br>
                  <label class="text-danger">${invalidPhone}</label>
                </div>
                <div class="mb-3 mt-3">
                  <label for="email" class="form-label">Email:</label>
                  <input type="email" class="form-control" placeholder="Email" name="email" /> <br>
                  <label class="text-danger">${invalidEmail}</label>
                </div>
                <div class="mb-3 mt-3">
                  <label for="note" class="form-label">Note:</label> <br />
                  <textarea class="form-control" name="note" id="" cols="83" rows="2"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Send</button> <br>
                <label class="text-success my-2 fs-3">${message}</label>
              </form>
            </div>
            <div class="col-sm-6">
              <p>For more details please contact:</p>
              <p>
                Address: Quang Trung Software Park, Innovation Building, Lot 24, Quang Trung, District 12, Ho Chi Minh City, Vietnam
              </p>
              <p>Hotline/Zalo/Viber: 0123 456 789 - 0987 654 321</p>
              <p>Web:</p>

              <p>Map:</p>
              <div>
                <iframe
                  src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1425.978320934793!2d106.62874618174683!3d10.85289131638231!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529b6a2b351a5%3A0x11690ada8c36f9bc!2zVHLGsOG7nW5nIENhbyDEkeG6s25nIFRo4buxYyBow6BuaCBGUFQgUG9seXRlY2huaWMgVFAuSENNIChDUzMp!5e0!3m2!1svi!2s!4v1653315496703!5m2!1svi!2s"
                  width="600" height="450" style="border: 0" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
              </div>
            </div>
          </div>
          <!-- footer -->
          <jsp:include page="common/footer.jsp"></jsp:include>
        </div>
      </body>

      </html>