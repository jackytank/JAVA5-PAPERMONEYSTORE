<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<!DOCTYPE html>
			<html lang="en">

			<head>
				<meta charset="UTF-8">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<title>Document</title>
			</head>

			<body>
				<!-- first navbar header -->
				<header>
					<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between  border-bottom">
						<div class="d-flex align-items-center col-md-3 mb-2 mb-md-0 ">
							<form class="col-12 col-lg-auto mb-3 mb-lg-0">
								<div class="input-group">
									<span class="input-group-text"> <i class="fa-solid fa-magnifying-glass"></i>
									</span> <input type="search" class="form-control shadow-none" placeholder="Search..." aria-label="Search">
								</div>
							</form>
						</div>
						<ul class="justify-content-center">
							<a href="/" class="text-dark text-decoration-none fw-bold"> <img class="bi d-block mx-auto mb-1" width="70"
									src="/resources/img/logo1.png" alt=""> <span>PaperMoneyStore</span>
							</a>
						</ul>
						<div class="col-md-3 text-end mb-2">
							<div class="btn-group">
								<!--CART BUTTON TO ACTIVE CART MODAL-->
								<button type="button" class="btn btn-outline-secondary px-3 mx-2" data-bs-toggle="modal" data-bs-target="#CartModal">
									<i class="fa-solid fa-cart-shopping"></i>
								</button>
							</div>
							<div class="btn-group">
								<div class="dropdown">
									<button class="btn btn-outline-secondary dropdown-toggle" type="button" id="userDropdown" data-bs-toggle="dropdown"
										aria-expanded="false">
										<i class="fa-solid fa-user"></i>
									</button>
									<ul class="dropdown-menu" aria-labelledby="userDropdown">
										<!--LOGIN BUTTON TO ACTIVE LOGIN MODAL-->
										<li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#LoginModal">Login</a></li>
										<!--SIGNUP BUTTON TO ACTIVE SIGNUP MODAL-->
										<li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#SignupModal">Signup</a></li>
										<!--FORGOT PASSWORD BUTTON TO ACTIVE FORGOT PASSWORD MODAL-->
										<li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#ForgotPasswordModal">Forgot password</a>
										</li>
										<li>
											<hr class="dropdown-divider">
										</li>
										<li><a class="dropdown-item" href="#">Logout</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<!-- second navbar header -->
					<div class="py-3 mb-2 border-bottom">
						<div class="container d-flex justify-content-center">
							<ul class="nav">
								<li class="nav-item"><a href="/" class="nav-link text-dark">SHOP</a></li>
								<li class="nav-item"><a href="contactus" class="nav-link text-dark">CONTACT US</a></li>
								<li class="nav-item"><a href="aboutus" class="nav-link text-dark">ABOUT US</a></li>
							</ul>
						</div>
					</div>

					<!--                                         MODAL SECTION                                     -->
					<!--LOGIN MODAL-->
					<div class="modal fade" id="LoginModal" tabindex="-1" aria-labelledby="LoginModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="md-flex justify-content-center">LOGIN</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="mb-3 mt-3">
										<label for="email" class="form-label">Email:</label>
										<input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
									</div>
									<div class="mb-3">
										<label for="pwd" class="form-label">Password:</label>
										<input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password">
									</div>
									<div class="form-check mb-3">
										<label class="form-check-label">
											<input class="form-check-input" type="checkbox" name="remember"> Remember me
										</label>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary">Login</button>
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
								</div>
							</div>
						</div>
					</div>

					<!--FORGOT PASSWORD MODAL-->
					<div class="modal fade" id="ForgotPasswordModal" tabindex="-1" aria-labelledby="ForgotPasswordModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="md-flex justify-content-center">FORGOT PASSWORD</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="mb-3 mt-3">
										<label for="forgot_email" class="form-label">Email:</label>
										<input type="email" class="form-control" id="email" placeholder="Enter email" name="forgot_email">
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary">Send</button>
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" data-bs-toggle="modal"
										data-bs-target="#ForgotPasswordModal">Cancel</button>
								</div>
							</div>
						</div>
					</div>

					<!--SIGNUP MODAL-->
					<div class="modal fade" id="SignupModal" tabindex="-1" aria-labelledby="SignupModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="md-flex justify-content-center">SIGNUP</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body mb-3">
									<form action="" method="post">
										<div class="signup mt-3">
											<div class="mb-3">
												<input type="text" name="" class="form-control" placeholder="Username">
											</div>
											<div class="mb-3">
												<input type="text" name="" class="form-control" placeholder="Email">
											</div>
											<div class="mb-3">
												<input type="text" name="" class="form-control" placeholder="Password">
											</div>
											<div class="mb-3">
												<input type="text" name="" class="form-control" placeholder="Confirm Password">
											</div>
											<div class="mb-3">
												<input type="text" name="" class="form-control" placeholder="Mobile">
											</div>
											<div class="mb-3">
												<input type="text" name="" class="form-control" placeholder="Adress">
											</div>

										</div>
										<div class="form-check form-switch my-3">
											<input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked>
											<label class="form-check-label" for="flexSwitchCheckChecked">Remember password?</label>
										</div>
										<div class="d-grid gap-2">
											<button type="submit" class="btn btn-primary">SUBMIT</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>

					<!-- CART MODAL -->
					<div class="modal fade" id="CartModal" tabindex="-1" aria-labelledby="CartModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title text-capitalize" id="CartModalLabel">
										MY CART
									</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<table class="table table-responsive cartTable">
										<thead>
											<tr>
												<th scope="col"></th>
												<th scope="col">Product</th>
												<th scope="col">Price</th>
												<th scope="col">Qty</th>
												<th scope="col">Total</th>
												<th scope="col">Actions</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="w-25">
													<img src="/resources/img/dia-danh-nao-duoc-in-tren-to-tien-cotton-50-000-vnd-1.jpg" alt=""
														class="img-fluid img-thumbnail">
												</td>
												<td>Vietnamdong 50.000 Note</td>
												<td>5$</td>
												<td class="qty"><input type="text" class="form-control" name="qty" id="qty" value="3"></td>
												<td>15$</td>
												<td>
													<a href="#" class="btn btn-danger btn-sm">
														<i class="fa fa-times"></i>
													</a>
												</td>
											</tr>
											<tr>
												<td class="w-25">
													<img src="/resources/img/dia-danh-nao-duoc-in-tren-to-tien-cotton-50-000-vnd-1.jpg" alt=""
														class="img-fluid img-thumbnail">
												</td>
												<td>Vietnamdong 50.000 Note</td>
												<td>5$</td>
												<td class="qty"><input type="text" class="form-control" name="qty" id="qty" value="3"></td>
												<td>15$</td>
												<td>
													<a href="#" class="btn btn-danger btn-sm">
														<i class="fa fa-times"></i>
													</a>
												</td>
											</tr>
										</tbody>
									</table>
									<div class="d-flex justify-content-end">
										<h5>Total: <span class="text-success ms-3">15$</span></h5>
									</div>
								</div>
								<div class="modal-footer border-top-0 d-flex justify-content-between">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" data-bs-toggle="modal"
										data-bs-target="#CartModal">Cancel</button>
									<button type="button" class="btn btn-success">Checkout</button>
								</div>
							</div>
						</div>
					</div>
				</header>
				<!-- marquee - running text -->
				<font>
					<marquee class="my-1" direction="left" style="background:rgb(14, 158, 248)">
						<div class="text-light mt-1">
							<h5>Contact to buy products early to receive immediately preferential policies for pre-order customers!</h5>
						</div>
					</marquee>
				</font>
			</body>

			</html>