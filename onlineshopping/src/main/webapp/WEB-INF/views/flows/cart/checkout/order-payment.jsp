<%@include file="../../shared/flows-headers.jsp"%>

<div class="container">
<div class="row">

		<!--  To display all the goods -->
		<div class="col-md-6">

			
				<div class="text-center">
					<h1>Receipt</h1>
				</div>
				


				<table class="table table-hover">
					<thead>
						<tr>
							<th>Product</th>
							<th>#</th>
							<th class="text-center">Price</th>
							<th class="text-center">Total</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${checkoutModel.cartLines}" var="cartLine">
							<tr>
								<td class="col-md-9"><em>${cartLine.product.name}</em>
								</h4></td>
								<td class="col-md-1" style="text-align: center">
									${cartLine.productCount}</td>
								<td class="col-md-1 text-center">${cartLine.buyingPrice}/-</td>
								<td class="col-md-1 text-center text-danger"><strong>
										${cartLine.total}/-</strong></td>
                                   <hr>
                       
							</tr>
                         

						</c:forEach>
					</tbody>

				</table>


			</div>
		
		<!-- -------- -->
		



<div class="col-md-6">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Payment Details</h3>
		</div>
		<div class="panel-body">
			<form role="form">
				<div class="form-group">
					<label for="cardNumber"> CARD NUMBER</label>
					<div class="input-group">
						<input type="text" class="form-control" id="cardNumber"
							placeholder="Valid Card Number" required autofocus /> <span
							class="input-group-addon"><span
							class="glyphicon glyphicon-lock"></span></span>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-7 col-md-7">
						<div class="form-group">
							<label for="expityMonth">EXPIRY DATE</label> <br />
							<div class="col-xs-6 col-lg-6 pl-ziro">
								<input type="text" class="form-control" id="expityMonth"
									placeholder="MM" required />
							</div>
							<div class="col-xs-6 col-lg-6 pl-ziro">
								<input type="text" class="form-control" id="expityYear"
									placeholder="YY" required />
							</div>
						</div>
					</div>
					<div class="col-xs-5 col-md-5 pull-right">
						<div class="form-group">
							<label for="cvCode"> CV CODE</label> <input type="password"
								class="form-control" id="cvCode" placeholder="CV" required />
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<ul class="nav nav-pills nav-stacked">
		<li class="active"><a href="#"><span class="badge pull-right text-danger">
					${checkoutModel.checkoutTotal}/-</span> Final Payment</a></li>
	</ul>
	<br /> <a href="${flowExecutionUrl}&_eventId_pay"
		class="btn btn-success btn-lg btn-block" role="button">Pay</a>

</div>
</div>
</div>



<%@include file="../../shared/flows-footer.jsp"%>