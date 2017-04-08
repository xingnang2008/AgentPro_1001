<!doctype html>
<html lang="zh-cn">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
		<%@include file="../headofbootstrap.jspf" %>
		<title>TEST</title>
		<script type="text/javascript">
		$(function(){
			
			$('#goods').bootstrapTable({
				url: 'data.json',
				dataField: 'rows',
				dataType: 'json',
				toolbarAlign: 'left',
				striped: true,  
		        pagination: true,
		        pageSize: 10,  
		        pageNumber:1, 
		        pageList: [10, 15, 20, 25],  
				
		        paginationHAlign: 'right', //right, left
		        paginationVAlign: 'bottom', //bottom, top, both
		        paginationDetailHAlign: 'left', //right, left
		        paginationPreText: '&lsaquo;',
		        paginationNextText: '&rsaquo;',
		        checkboxHeader: true,
		        sortable: true,
		        sortName:'productid',
		        silentSort: true,
		        maintainSelected: false,
		        search:true,
		        searchTimeOut: 500,
		        searchText: '',
		        showColumns: true,  
		        showRefresh: true,  
		        iconSize: undefined,
		        buttonsClass: 'default',
		        iconsPrefix: 'glyphicon', // glyphicon of fa (font awesome)
		        icons: {
		            paginationSwitchDown: 'glyphicon-collapse-down icon-chevron-down',
		            paginationSwitchUp: 'glyphicon-collapse-up icon-chevron-up',
		            refresh: 'glyphicon-refresh icon-refresh',
		            toggle: 'glyphicon-list-alt icon-list-alt',
		            columns: 'glyphicon-th icon-th',
		            detailOpen: 'glyphicon-plus icon-plus',
		            detailClose: 'glyphicon-minus icon-minus'
		        },
			    sidePagination:'server'
			    
			});
		});
		
		
		</script>
		
	</head>
	<body>
	<!--  -->
		<table id="goods">
			<thead>
				<tr>
					<th data-sortable="true"  data-field="productid">ID</th>
					<th data-sortable="true" data-field="productname">ProductName</th>
					<th data-field="unitcost">Cost</th>
					<th data-field="attr1">Attr1</th>
				</tr>
			</thead>
		</table>
		
		
		
		
		
		
	</body>

</html>