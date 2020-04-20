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
	default:
		$('#listProducts').addClass('active');
		$('#a_' + menu).addClass('active');
		break;

	}

	// code for jquery dataTable
	// create a database

	var $table = $('#productListTable');
	if ($table.length) {
		var jsonUrl = '';
		if (window.categoryId == '') {
			jsonUrl = window.contextRoot + '/json/data/all/products';
		} else {
			jsonUrl = window.contextRoot + '/json/data/' + window.categoryId
					+ '/products';
		}

		$table.DataTable({
			lengthMenu : [ [ 3, 5, 10, -1 ],
					[ '3 Records', '5 Records', '10 Records', 'All' ] ],
			pageLength : 5,
			ajax : {
				url : jsonUrl,
				dataSrc : ''
			},
			columns:[
				{
					data:'name'
					
				},
				{
					data:'brand'
					
				},
				{
					data:'unitPrice'
					
				},
				{
					data:'nquantityame'
					
				}
			]
		});
	} else {
		console.log('nothing to print');
	}

});
