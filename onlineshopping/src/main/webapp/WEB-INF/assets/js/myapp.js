$(function() {
	switch (menu) {
	case 'About Us':
		$('#about').addClass('active');
		break;

	case 'Contact':
		$('#contact').addClass('active');
		break;
	case 'All Products':
		$('#listProducts').addClass('active');
		break;
	case 'Manage Products':
		$('#manageProducts').addClass('active');
		break;
	default:
		$('#listProducts').addClass('active');
		$('#a_' + menu).addClass('active');
		break;

	}
	
	//to tackle the csrf token
	
	var token = $('meta[name="_csrf"]').attr('content');
	var header = $('meta[name="_csrf_header"]').attr('content');
	
	
	if(token.length>0 && header.length>0){
		
		$(documnet).ajaxSend(function(e,xhr,option){
			
			xhr.setRequestHeader(header,token);
		});
		
		
	}
	// code for jquery dataTable
	// create a database

	var $table = $('#productListTable');
	if ($table.length) {
		var jsonUrl = '';
		if (window.categoryId == '') {
			jsonUrl = window.contextRoot + '/json/data/all/products';
		} else {
			console.log('does not working' + window.categoryId);
			jsonUrl = window.contextRoot + '/json/data/category/'
					+ window.categoryId + '/products';
		}

		$table
				.DataTable({
					lengthMenu : [ [ 3, 5, 10, -1 ],
							[ '3 Records', '5 Records', '10 Records', 'All' ] ],
					pageLength : 3,
					ajax : {
						url : jsonUrl,
						dataSrc : ''
					},
					columns : [
							{
								data : 'code',
								mRender : function(data, type, row) {

									return '<img src="' + window.contextRoot
											+ '/resources/images/' + data
											+ '.jpg" class="dataTableImg"/>';

								}

							},

							{
								data : 'name'

							},
							{
								data : 'brand'

							},
							{
								data : 'unitPrice',
								mRender : function(data, type, row) {
									return ' &#2547; ' + data;
								}

							},
							{
								data : 'quantity',
								mRender : function(data, type, row) {
									if (data < 1) {
										return '<span style="color:red">out of stock!</span>';
									}

									return data;
								}

							},

							{
								data : 'id',
								bSortable : false,
								mRender : function(data, type, row) {
									var str = '';
									str += '<a href="'
											+ window.contextRoot
											+ '/show/'
											+ data
											+ '/product" class="btn btn-primary"><span class="glyphicon glyphicon-eye-open"></span> </a> &#160;';

									if (row.quantity < 1) {
										str += '<a href="javascript:void(0)" class="btn btn-success disabled"> <span class="glyphicon glyphicon-shopping-cart"></a>';

									} else {
										str += '<a href="'
												+ window.contextRoot
												+ '/cart/add/'
												+ data
												+ '/product" class="btn btn-success"> <span class="glyphicon glyphicon-shopping-cart"></a>';
									}

									return str;
								}
							} ]
				});
	} else {
		console.log('nothing to print');
	}

	$alert = $('.alert');
	if ($alert.lenght) {
		setTimeout(function() {
			$alert.fadeOut('slow');
		}, 3000);
	}

	// -----------------
	$('.switch input[type="checkbox"]')
			.on(
					'change',
					function() {

						var checkbox = $(this);
						var checked = checkbox.prop('checked');
						var dmg = (checked) ? 'You want to active the product?'
								: 'You want to deactive the product?';
						var value = checkbox.prop('value');

						bootbox
								.confirm({
									size : 'medium',
									title : 'Product Activation & Deactivetaion',
									message : dmg,
									callback : function(confirmed) {
										if (confirmed) {

											console.log(value);
											bootbox
													.alert({
														size : 'medium',
														title : 'Information',
														message : 'You are going to perform operation on product '
																+ value
													});
										} else {

											checkbox.prop('checked', !checked);
										}
									}
								});
					});

	// -----------------
	// Data table for admin
	// ----------------------

	var $adminProductTable = $('#adminProductsTable');
	if ($adminProductTable.length) {
		var jsonUrl = window.contextRoot + '/json/data/admin/all/products';

		$adminProductTable
				.DataTable({
					lengthMenu : [ [ 10, 30, 50, -1 ],
							[ '10 Records', '30 Records', '50 Records', 'All' ] ],
					pageLength : 30,
					ajax : {
						url : jsonUrl,
						dataSrc : ''
					},
					columns : [
							{
								data : 'id'
							},
							{
								data : 'code',
								mRender : function(data, type, row) {

									return '<img src="'
											+ window.contextRoot
											+ '/resources/images/'
											+ data
											+ '.jpg" class="adminDataTableImg"/>';

								}

							},

							{
								data : 'name'

							},
							{
								data : 'brand'

							},

							{
								data : 'quantity',
								mRender : function(data, type, row) {
									if (data < 1) {
										return '<span style="color:red">out of stock!</span>';
									}

									return data;
								}

							},
							{
								data : 'unitPrice',
								mRender : function(data, type, row) {
									return ' &#2547; ' + data;
								}

							},

							{
								data : 'active',
								bSortable : false,
								mRender : function(data, type, row) {

									var str = '';

									str += '<label class="switch">';
									if (data) {
										str += '<input type="checkbox" checked="checked" value="'
												+ row.id + '"/>';
									} else {
										str += '<input type="checkbox" value="'
												+ row.id + '"/>';
									}
									str += '<div class="slider"></div></label>';

									return str;
								}
							},
							{
								data : 'id',
								bSortable : false,
								mRender : function(data, type, row) {
									var str = '';
									str += '<a href="'
											+ window.contextRoot
											+ '/manage/'
											+ data
											+ '/product" class="btn btn-warning">';
									str += '<span class="glyphicon glyphicon-pencil"></span></a>';

									return str;
								}
							} ],
					initComplete : function() {
						var api = this.api();
						api
								.$('.switch input[type="checkbox"]')
								.on(
										'change',
										function() {

											var checkbox = $(this);
											var checked = checkbox
													.prop('checked');
											var dmg = (checked) ? 'You want to active the product?'
													: 'You want to deactive the product?';
											var value = checkbox.prop('value');

											bootbox
													.confirm({
														size : 'medium',
														title : 'Product Activation & Deactivetaion',
														message : dmg,
														callback : function(
																confirmed) {
															if (confirmed) {

																console
																		.log(value);

																var activationUrl = window.contextRoot
																		+ '/manage/product/'
																		+ value
																		+ '/activation';
																$
																		.post(
																				activationUrl,
																				function(
																						data) {
																					bootbox
																							.alert({
																								size : 'medium',
																								title : 'Information',
																								message : data
																							});

																				});

															} else {

																checkbox
																		.prop(
																				'checked',
																				!checked);
															}
														}
													});
										});
					}
				});
	}
	// --------------------------

	// ------
	// ---- validation category from
	// ------
	$categoryForm = $('#categoryForm');

	if ($categoryForm.length) {

		$categoryForm.validate({
			rules : {
				name : {
					required : true,
					minlength : 3
				},
				description : {
					required : true,
					minlength : 3
				}
			},
			messages : {
				name : {
					required : 'Please enter product name!',
					minlength : 'Please enter atleast five characters'
				},
				description : {
					required : 'Please enter product name!',
					minlength : 'Please enter atleast five characters'
				}
			},
			errorElement : "em",
			errorPlacement : function(error, element) {
				errorPlacement(error, element);
			}
		}

		);

	}

	/* validating the loginform */

	// validating the product form element
	// fetch the form element
	$loginForm = $('#loginForm');

	if ($loginForm.length) {

		$loginForm.validate({
			rules : {
				username : {
					required : true,
					email : true

				},
				password : {
					required : true
				}
			},
			messages : {
				username : {
					required : 'Please enter your email!',
					email : 'Please enter a valid email address!'
				},
				password : {
					required : 'Please enter your password!'
				}
			},
			errorElement : "em",
			errorPlacement : function(error, element) {
				// Add the 'help-block' class to the error element
				error.addClass("help-block");

				// add the error label after the input element
				error.insertAfter(element);
			}
		}

		);

	}

	// ------------------------------------

});
