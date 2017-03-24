<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>运输管理系统0.1</title>
	<%@include file="head.jspf" %>

	<script type="text/javascript">
	$(function(){
		$("a[title]").click(function(){
			var text = $(this).text();
			var href = $(this).attr("title");			
			if($("#tt").tabs("exists",text)){    <!--判断是否存在tabs-->				
				$("#tt").tabs('select',text);
			}else{
				//3:如果没有创建一个
				$("#tt").tabs("add",{
					title:text,
					closable:true,
					//href:'send_category_query.action'            //默认通过url加载远程页面仅仅是body部分
					content:'<iframe src='+href+' frameborder="0" width="100%" height="100%"> </iframe>'
					
				});
			}
		})
	});
	
	</script>
	<style type="text/css">
		body{
			text-align:center;
		}
		#menu {
			margin:auto; 
			width:200;
		}
		#menu ul{
			padding:0;   
			margin:auto; 
			list-style-position:inside;
		}
		#menu ul li{
			margin:auto;
			border-bottom:1px solid #fff;
			text-aglin:center;  
		}
		#menu ul li a{
			display:block;		
			background-color:#008792;
			color:#fff;
			padding:5px;   
			text-decoration:none;  
		}
		#menu ul li a:hover{
			background-color:#00a6ac;
		}
	</style>

  </head>
  
  
   <body class="easyui-layout">   
   <!-- 
    <div data-options="region:'north',title:'North Title',split:true" style="height:50px;">
    	<a href="<%=basePath%>j_spring_security_logout">退出</a>
    </div>    
    -->
    <div data-options="region:'west',title:'菜单',split:true" style="width:200px;">
    <div id="menu" class="easyui-accordion" data-options="fit:true">   <!--适应最外层-->
    		<sec:authorize access="hasRole('ROLE_USER')"> 
    			<div title="验货管理">
				<ul>
					<li><a href="#" title="../user/Waybill_list.jsp">运单查询</a></li>
					<li><a href="#" title="../user/Waybill_track.jsp">货物跟踪</a></li>
					<li><a href="#" title="../user/Track_list.jsp">到货明细</a></li>
				</ul>
				</div>
    		</sec:authorize>
    
    			<sec:authorize access="hasAnyRole('ROLE_SUPER','ROLE_ADMIN','ROLE_CAIWU')"> 
    			
    			<div title="订单管理">
				<ul>
					<li><a href="#" title="PayRecord/PayRecord_list.jsp">订单明细</a></li>	
					<li><a href="#" title="PayRecord/PayRecord_express.jsp">快递单号</a></li>							
					<li><a href="#" title="Waybill/Waybill_downloadBitchReport.jsp">验货管理</a></li>
					
				</ul>
				</div>
				<div title="快件操作">
				<ul>
					<li><a href="#" title="PayRecord/PayRecord_receive.jsp">快递接收</a></li>					
					<li><a href="#" title="PayRecord/PayRecord_check.jsp">验货管理</a></li>
					<li><a href="#" title="Waybill/Waybill_channels.jsp#">绿色通道</a></li>	
				</ul>
				</div> 
    
				
				<div title="运输管理">
				<ul>
					<li><a href="#" title="Batch/Batch_list.jsp">批次管理</a></li>				
					
				</ul>
				</div>
				<div title="信息管理">
				<ul>
					<li><a href="#" title="Customer/Customer_list.jsp">客户管理</a></li>
					<li><a href="#" title="ExpressCom/ExpressCom_list.jsp">快递公司</a></li>
					<li><a href="#" title="Company/Company_list.jsp">公司管理</a></li>
					<li><a href="#" title="Status/Status_list.jsp">状态管理</a></li>
				</ul>
				</div>
				
				
				<div title="财务管理">
				<ul>
					
					<li><a href="#" title="Waybill/Waybill_fee.jsp">收支</a></li>
					<li><a href="#" title="Receipt/Receipt_list.jsp">收款管理</a></li>
					
				
				</ul>
				</div>
				<div title="财务报表">
				<ul>
					<li><a href="#" title="Waybill/Waybill_raterReport.jsp">财务报表</a></li>
					<li><a href="#" title="Bitch/Bitch_totalList.jsp">批次毛利</a></li>	
					<li><a href="#" title="Waybill/Waybill_advancedReport.jsp">垫付款报表</a></li>
					<li><a href="#" title="Waybill/Waybill_allBitchReport.jsp">批次统计报表</a></li>
				
				</ul>
				</div>
    			</sec:authorize>
				
				<sec:authorize access="hasRole('ROLE_SUPER')">
				<div title="用户管理">
				<ul>
					<li><a href="#" title="../security/User/User_list.jsp">用户管理</a></li>
				</ul>
				
				</div>
				</sec:authorize>
				<div title="退出">
				<ul>
					<li><a href="<%=basePath%>j_spring_security_logout">退出</a></li>
				</ul>
				</div>
		</div></div>   
    <div data-options="region:'center',title:'工作区'" style="padding:5px;background:#eee;">
	    <div id="tt" class="easyui-tabs" data-options="fit:true">
	    	 
	    </div>
    </div>   
</body>  


</html>
