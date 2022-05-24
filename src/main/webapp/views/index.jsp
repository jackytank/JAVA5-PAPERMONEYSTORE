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
							<!-- first column -->
							<div class="col-md-3">
								<div class="card mb-3">
									<div class="card-header" id="headingOne">
										<h5 class="mb-0">
											<button class="btn btn-link text-decoration-none text-black btn out" data-bs-toggle="collapse"
												data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
												<img src="/resources/img/vietnam.png" width="24" alt="" srcset="" />
												Vietnam Banknotes
											</button>
										</h5>
									</div>
									<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
										<div class="card-body p-0">
											<div class="list-group">
												<button type="button" class="list-group-item list-group-item-action">
													Indochina Money<span class="badge badge-secondary float-right">20</span>
												</button>
												<button type="button" class="list-group-item list-group-item-action">
													After 1975 <span class="badge badge-secondary float-right">7</span>
												</button>
												<button type="button" class="list-group-item list-group-item-action">
													Republic of VN 1955-1975 <span class="badge badge-secondary float-right">12</span>
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="card mb-3">
									<div class="card-header" id="headingTwo">
										<h5 class="mb-0">
											<button class="btn btn-link text-decoration-none text-black btn out" data-bs-toggle="collapse"
												data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
												<img src="/resources/img/globe.png" width="24" alt="" srcset="" />
												Global Banknotes
											</button>
										</h5>
									</div>
									<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
										<div class="card-body p-0">
											<div class="list-group">
												<button type="button" class="list-group-item list-group-item-action">
													US Dollars<span class="badge badge-secondary float-right">20</span>
												</button>
												<button type="button" class="list-group-item list-group-item-action">
													Taiwan Dollars <span class="badge badge-secondary float-right">7</span>
												</button>
												<button type="button" class="list-group-item list-group-item-action">
													Russia Ruble <span class="badge badge-secondary float-right">12</span>
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="card mb-3">
									<div class="card-header" id="headingThree">
										<h5 class="mb-0">
											<button class="btn btn-link text-decoration-none text-black btn out" data-bs-toggle="collapse"
												data-bs-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
												<img src="/resources/img/coin.png" width="24" alt="" srcset="" /> Coins
											</button>
										</h5>
									</div>
									<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
										<div class="card-body p-0">
											<div class="list-group">
												<button type="button" class="list-group-item list-group-item-action">
													Vietnam Coins<span class="badge badge-secondary float-right">20</span>
												</button>
												<button type="button" class="list-group-item list-group-item-action">
													World Coins <span class="badge badge-secondary float-right">7</span>
												</button>
												<button type="button" class="list-group-item list-group-item-action">
													Russia Coins <span class="badge badge-secondary float-right">12</span>
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="card mb-3">
									<div class="card-header" id="headingFour">
										<h5 class="mb-0">
											<button class="btn btn-link text-decoration-none text-black btn out" data-bs-toggle="collapse"
												data-bs-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
												<img src="/resources/img/counter.png" width="24" alt="" srcset="" />
												Nice Series Number
											</button>
										</h5>
									</div>
									<div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
										<div class="card-body p-0">
											<div class="list-group">
												<button type="button" class="list-group-item list-group-item-action">
													Vietnam money<span class="badge badge-secondary float-right">20</span>
												</button>
												<button type="button" class="list-group-item list-group-item-action">
													World money<span class="badge badge-secondary float-right">7</span>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- second column -->
							<div class="col-md-9">
								<div class="row row-cols-3">
									<div class="col">
										<div class="card mb-3" style="width: 18rem">
											<img src="/resources/img/dia-danh-nao-duoc-in-tren-to-tien-cotton-50-000-vnd-1.jpg" class="card-img-top"
												alt="..." />
											<div class="card-body">
												<h5 class="card-title">Vietnamdong 50.000 Notes</h5>
												<p class="card-text">Price: <span class="fw-bold">5$</span></p>
												<a href="#" class="btn btn-secondary">Detail</a> <a href="#" class="btn btn-primary">Buy</a>
											</div>
										</div>
									</div>
									<div class="col">
										<div class="card mb-3" style="width: 18rem">
											<img src="/resources/img/dia-danh-nao-duoc-in-tren-to-tien-cotton-50-000-vnd-1.jpg" class="card-img-top"
												alt="..." />
											<div class="card-body">
												<h5 class="card-title">Vietnamdong 50.000 Notes</h5>
												<p class="card-text">Price: <span class="fw-bold">5$</span></p>
												<a href="#" class="btn btn-secondary">Detail</a> <a href="#" class="btn btn-primary">Buy</a>
											</div>
										</div>
									</div>
									<div class="col">
										<div class="card mb-3" style="width: 18rem">
											<img src="/resources/img/dia-danh-nao-duoc-in-tren-to-tien-cotton-50-000-vnd-1.jpg" class="card-img-top"
												alt="..." />
											<div class="card-body">
												<h5 class="card-title">Vietnamdong 50.000 Notes</h5>
												<p class="card-text">Price: <span class="fw-bold">5$</span></p>
												<a href="#" class="btn btn-secondary">Detail</a> <a href="#" class="btn btn-primary">Buy</a>
											</div>
										</div>
									</div>
									<div class="col">
										<div class="card mb-3" style="width: 18rem">
											<img src="/resources/img/dia-danh-nao-duoc-in-tren-to-tien-cotton-50-000-vnd-1.jpg" class="card-img-top"
												alt="..." />
											<div class="card-body">
												<h5 class="card-title">Vietnamdong 50.000 Notes</h5>
												<p class="card-text">Price: <span class="fw-bold">5$</span></p>
												<a href="#" class="btn btn-secondary">Detail</a> <a href="#" class="btn btn-primary">Buy</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</main>
					<!-- footer -->
					<jsp:include page="common/footer.jsp"></jsp:include>
				</div>
			</body>

			</html>