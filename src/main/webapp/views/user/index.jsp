<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<!DOCTYPE html>
			<html lang="en">

			<head>
				<meta charset="UTF-8" />
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<meta name="viewport" content="width=device-width, initial-scale=1.0" />
				<title>Document</title>
				<link rel="stylesheet" href="/css/index.css">
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

					<main class="h-100">
						<div class="row">
							<!-- first column : aside-->
							<jsp:include page="common/aside.jsp"></jsp:include>

							<!-- second column : main content-->
							<div class="col-md-9">
								<div class="row row-cols-3">
									<c:forEach var="item" items="${page.content}" varStatus="loop">
										<div class="col">
											<div class="card mb-3" style="width: 18rem">
												<img src="/img/${item.image}" class="card-img-top" width="250" height="250" alt="..." />
												<div class="card-body">
													<h5 class="card-title">${item.name}</h5>
													<p class="card-text">Price: <span class="fw-bold text-success">${item.price} $</span></p>
													<a href="/product/detail/${item.id}" class="btn btn-secondary">Detail</a> <a href="/cart/add/${item.id}"
														class="btn btn-primary">Add to cart</a>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
								<!-- Pagination -->
								<nav>
									<ul class="pagination d-flex justify-content-center">
										<li class="page-item"><a class="page-link" href="/product/page?page=0">First</a></li>
										<li class="page-item"><a class="page-link" href="/product/page?page=${page.number - 1}">Prev</a></li>
										<li class="page-item"><a class="page-link" href="/product/page?page=${page.number + 1}">Next</a></li>
										<li class="page-item"><a class="page-link" href="/product/page?page=${page.totalPages - 1}">Last</a></li>
									</ul>
								</nav>
							</div>
						</div>

					</main>
					<!-- footer -->
					<jsp:include page="common/footer.jsp"></jsp:include>
					
					<script type="text/javascript">
						if(("${param.message}" != "")||"${message}" != ""){
							alert("Message: ${param.message} ${message}")
						}
					</script>
				</div>
			</body>

			</html>