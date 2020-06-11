<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<div class="row">

		<c:if test="${not empty message}">
			<div class="col-xs-12 mx-auto">
				<div class="alert alert-success alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>

					${message}

				</div>

			</div>
		</c:if>
		<div class="offset-md-2 col-md-8">

			<div class="panel panel-success">

				<div class="panel-title">

					<h4>Product Management</h4>

				</div>
				<hr>
				<div class="panel-body">
					<!-- Form element -->
					<sf:form class="form-horizontal" modelAttribute="product"
						action="${contextRoot}/manage/products" method="POST"
						enctype="multipart/form-data">

						<div class="form-group">

							<label class="control-label col-md-4" for="name">Enter
								Product Name:</label>
							<div class="col-md-8">
								<sf:input type="text" path="name" id="name"
									placeholder="Product Name" class="form-control" />
								<sf:errors path="name" cssClass="help-block" element="em" />

							</div>
						</div>

						<div class="form-group">

							<label class="control-label col-md-4" for="brand">Enter
								Brand Name:</label>
							<div class="col-md-8">
								<sf:input type="text" path="brand" id="brand"
									placeholder="Brand Name" class="form-control" />
								<sf:errors path="brand" cssClass="help-block" element="em" />

							</div>
						</div>


						<div class="form-group">

							<label class="control-label col-md-4" for="desription">Enter
								Product Description:</label>
							<div class="col-md-8">
								<sf:textarea path="description" id="description"
									placeholder=" Write Product description" class="form-control"></sf:textarea>
								<sf:errors path="description" cssClass="help-block" element="em" />

							</div>
						</div>

						<div class="form-group">

							<label class="control-label col-md-4" for="unitPrice">Enter
								Unit Price:</label>
							<div class="col-md-8">
								<sf:input type="number" path="unitPrice" id="unitPrice"
									placeholder=" Write Product description" class="form-control" />
								<sf:errors path="unitPrice" cssClass="help-block" element="em" />

							</div>
						</div>


						<div class="form-group">

							<label class="control-label col-md-4" for="quantity">Quantity
								Available: </label>
							<div class="col-md-8">
								<sf:input type="number" path="quantity" id="quantity"
									placeholder="Quantity Available" class="form-control" />
								<sf:errors path="quantity" cssClass="help-block" element="em" />

							</div>
						</div>
						<!-- File element for image upload -->
						<div class="form-group">

							<label class="control-label col-md-4" for="file">Select
								an Image : </label>
							<div class="col-md-8">
								<sf:input type="file" path="file" id="file"
									placeholder="Quantity Available" class="form-control" />
								<sf:errors path="file" cssClass="help-block" element="em" />

							</div>
						</div>
						<div class="form-group">

							<label class="control-label col-md-4" for="categoryId">
								Select Category:</label>
							<div class="col-md-8">
								<sf:select class="form-control" id="categoryId"
									path="categoryId" items="${categories}" itemLabel="name"
									itemValue="id" />

							</div>
						</div>

						<c:if test="${product.id ==0 }">

							<div class="text-right col-md-8">


								<button type="button" data-toggle="modal"
									data-target="#myCategoryModal" class="btn btn-danger btn-xs">Add
									Category</button>
							</div>

						</c:if>

						<div class="form-group">

							<div class="col-md-8 col-md-offset-2">
								<input type="submit" name="submit" id="name" value="Submit"
									class="btn btn-primary">

								<sf:hidden path="id" />
								<sf:hidden path="code" />
								<sf:hidden path="supplierId" />
								<sf:hidden path="active" />

								<sf:hidden path="views" />
							</div>
						</div>
					</sf:form>

				</div>

			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myCategoryModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">New Category</h4>
				</div>
				<div class="modal-body">

					<sf:form id="categoryForm" class="form-horizontal"
						modelAttribute="category" action="${contextRoot}/manage/category"
						method="POST">

						<div class="form-group">
							<label class="control-label col-md-4">Name</label>
							<div class="col-md-8 validate">
								<sf:input type="text" path="name" name="name"
									class="form-control" placeholder="Category Name" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Description</label>
							<div class="col-md-8 validate">
								<sf:textarea path="description" class="form-control"
									placeholder="Enter category description here!" />
							</div>
						</div>


						<div class="form-group">
							<div class="col-md-offset-4 col-md-4">
								<input type="submit" name="submit" value="Save"
									class="btn btn-primary" />
							</div>
						</div>
					</sf:form>
				</div>
			</div>
		</div>
	</div>
	<!-- Available Product -->


	<div class="row">
		<div class="col-xs-12">
			<h3>Available Product</h3>
			<hr />
			<br />
		</div>
		<div class="col-xs-12">

			<div style="overflow: auto">
				<div class="container-fluid">
					<div class="table-responsive">
						<table id="adminProductsTable"
							class="table table-condensed table-bordered">

							<thead>
								<tr>
									<th>Id</th>

									<th>&#8212;</th>
									<th>Brand</th>
									<th>Name</th>

									<th>Qty. Avail</th>
									<th>Unit Price</th>
									<th>Activate</th>
									<th>Edit</th>
								</tr>
							</thead>

							<tfoot>
								<tr>
									<th>Id</th>
									<th>&#8212;</th>
									<th>Brand</th>
									<th>Name</th>

									<th>Qty. Avail</th>
									<th>Unit Price</th>
									<th>Activate</th>
									<th>Edit</th>
								</tr>
							</tfoot>


						</table>
					</div>
				</div>
			</div>
		</div>
	</div>



</div>

