<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<%@include file="../headofbootstrap.jspf" %>
	<link rel="stylesheet" href="<%=basePath%>css/PayRecord/PayRecord_list.css" type="text/css" />	
	
	<script type="text/javascript">
	$(function(){
		
		$('#dg').bootstrapTable({
		    url: 'PayRecord-find.action',
		    method: 'get',
		    dataType: "json",
		    columns: [
		  	{
		        field: 'payId',
		        title: '订单编号'
		    }, {
		        field: 'custId',
		        title: '客户编号'
		    } , {
		        field: 'custName',
		        title: '客户名'
		    }, {
		        field: 'telphone',
		        title: '客户编号'
		    },]
		});
		
		
		


		

		
	});
	
	
	</script>

  </head>
  
  
<body>   
<div id="container">
	
			<div id="searchDiv">
						<div>
						<div class="label">订单号</div>
						<div class="hang"><input type="text"  id="payId"  class="easyui-textbox" name="payId" style="width:100px" /></div>
						
						<div class="label">客户号</div>
						<div class="hang"><input type="text"  id="custId" class="easyui-textbox" name="custId"  style="width:100px"/></div>
						
						<div class="label">快递公司</div>
						<div class="hang"><input type="text"  id="expressCom" class="easyui-textbox" name="expressCom"  style="width:100px"/></div>
						</div>	
						<div class="label">快递号</div>
						<div class="hang"><input type="text"  id="expressNo" class="easyui-textbox" name="expressNo"  style="width:100px"/></div>
						
						
				<div>
					<a id="btnSearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
				</div>
			</div>
		<div>			
			<div id="tableDG">
					<table id="dg" class="table"></table>
			</div>			
		</div>	
	
	<hr>
	
	
<div id="win" data-options="collapsible:false,minimizable:false,maxmizable:true,modal:true"></div>   
        
  
 </div>
</body>  


</html>
