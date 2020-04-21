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
			pageLength : 3,
			ajax : {
				url : jsonUrl,
				dataSrc : ''
			},
			columns : [ {
				data:'code',
				mRender:function(data,type,row){
					
					return '<img src="' + window.contextRoot
					+ '/resources/images/' + data
					+ '.jpg" class="dataTableImg"/>';

				}
				
			},
				
				{
				data : 'name'

			}, {
				data : 'brand'

			}, {
				data : 'unitPrice',
				mRender : function(data, type, row) {
					return ' &#2547; ' +data;
				}

			}, {
				data : 'quantity'

			},
			
			{
				data:'id',
				bSortable:false,
				mRender:function(data,type,row)
				{
				  var str = '';
				  str+= '<a href="'+window.contextRoot+'/show/'+data+'/product" class="btn btn-primary"><span class="glyphicon glyphicon-eye-open"></span> </a> &#160;';
				  str+= '<a href="'+window.contextRoot+'/cart/add/'+data+'/product" class="btn btn-success"> <span class="glyphicon glyphicon-shopping-cart"></a>';
				  return str;
				}
			}
			]
		});
	} else {
		console.log('nothing to print');
	}

});
