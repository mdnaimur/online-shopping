<%@include file="../shared/flows-headers.jsp"%>

<div class="container">

	<div class="row">

		<div class="col-sm-6">

			<div class="panel panel-primary">

				<div class="panel-heading">
					<h4>Personal Details</h4>
				</div>
				<hr>

				<div class="panel-body">
					<div class="text-center">
						<h3>
							Name : <strong>${registerModel.user.firstname}
								${registerModel.user.lastname}</strong>
						</h3>
						<h4>
							Email : <strong>${registerModel.user.email}</strong>
						</h4>
						<h4>
							Contact : <strong>${registerModel.user.contactNumber}</strong>
						</h4>
						<h4>
							Role : <strong>${registerModel.user.role}</strong>
						</h4>
						<p>
							<a href="${flowExecutionUrl}&_eventId_personal"
								class="btn btn-warning">Edit</a>
						</p>
					</div>
				</div>

			</div>


		</div>

		<div class="col-sm-6">

			<div class="panel panel-primary">

				<div class="panel-heading">
					<h4>Billing Address</h4>
				</div>
   <hr>
				<div class="panel-body">
					<div class="text-center display-4">

						<address>
							<strong>${registerModel.billing.addressLineOne},${registerModel.billing.addressLineTwo},</strong><br>
							${registerModel.billing.city}-
							${registerModel.billing.postalCode},<br>
							${registerModel.billing.state}, ${registerModel.billing.country}<br>

						</address>

						<p>
							<a href="${flowExecutionUrl}&_eventId_billing"
								class="btn btn-warning">Edit</a>
						</p>
					</div>
				</div>

			</div>

		</div>

	</div>

	<div class="row float-right">

		<div class="col-sm-4 col-sm-offset-4">

			<div class="text-center ">

				<a href="${flowExecutionUrl}&_eventId_submit"
					class="btn btn-lg btn-success">Confirm</a>

			</div>

		</div>

	</div>

</div>

<%@include file="../shared/flows-footer.jsp"%>