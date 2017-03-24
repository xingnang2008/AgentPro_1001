<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<%@include file="../head.jspf" %>
	<link rel="stylesheet" href="<%=basePath%>css/PayRecord/PayRecord_list.css" type="text/css" />	
	
	<script type="text/javascript">
	$(function(){
		$('#btnSearch').click(function(){
			$('#dg').datagrid('load',{
				payId:$('#payId').val(),
				custId: $('#custId').val(),
				comId: $('#custName').val(),
				sendNo: $('#telphone').val()
			});
		});
		$('#dg').datagrid({    
				//请求的url地址
			    url:'PayRecord/PayRecord-find.action', 
			    queryParams :{
					custId:'',
					payId:'',
					comId:'',
					sendNo:''
					},
			   loadMsg:'请等待...',
				//隔行换色——斑马线
				fit:true,
				striped:true,
				//数据同行显示
				nowrap:true,
				//自动适应列，如设为true则不会出现水平滚动条，在演示冻结列此参数不要设置
				fitColumns:false,
				//单行选择，全选功能失效
				singleSelect:true,
				//显示分页条				
				onSelect: function(rowIndex,rowData){
						var pid = rowData.payId;
						$('#item').datagrid('reload',{
							payId:pid,					
							senderId:null,
							procuratorId:null,
							raterId:null							
						});
						
					},
				frozenColumns:[[
					{field:'z',checkbox:true},
					{field:'id',title:'编号',width:50}
				]],
				toolbar: [{
					iconCls: 'icon-add',
					text:'新建收货人',
					handler: function(){
						$("#win").window({
							title:'新建记录',
							width:'100%',
							height:'100%',
							content:'<iframe src="PayRecord_saveInput.jsp" frameborder="0" width="100%" height="100%"> </iframe>'
						});
					
						}
					},
					{
						iconCls: 'icon-edit',
						text:'签收',
						handler: function(){
						var rows =$("#dg").datagrid("getSelections");
						if(rows.length !=1){
							$.messager.show({
								title:'错误提示',
								msg:'一次只能更新一条记录',
								timeout:2000,
								showType:'slide'
							});
						}else{
							//1.完成弹出更新页面
							$("#win").window({
								title:'更新记录',
								width:'100%',
								height:'100%',
								content:'<iframe title="" src="PayRecord_updateInput.jsp" frameborder="0" width="100%" height="100%"/>'
							});
					}}}
					

					],
			    columns:[[ 	
							{field:'buyDate',title:'订单日期',align:'center',
								 formatter:function(value,row,index){
									   	if(value!=null){
										   	var unixTimestamp = new Date(value);  
										   	return unixTimestamp.toLocaleDateString();
									   	}else{
												return "-";
									   	}
								}  ,width:100},	
							{field:'payId',title:'订单编号',width:100},
							 {field:'custId',title:'客户编号',width:80},
							{field:'pics',title:'数量',width:80},
							
							{field:'wwwadd',title:'网址',width:150},
							{field:'info',title:'定单信息',width:120},

							{field:'expressCom',title:'快递公司',width:120},
							{field:'expressNo',title:'快递单号',width:120},
							{field:'expressFee',title:'快递费用',width:120},
							{field:'exSendDate',title:'发出日期', formatter:function(value,row,index){
							   	if(value!=null){
								   	var unixTimestamp = new Date(value);  
								   	return unixTimestamp.toLocaleDateString();
							   	}else{
										return "-";
							   	}
							}  ,width:100},

							{field:'exRecDate',title:'收到日期', formatter:function(value,row,index){
							   	if(value!=null){
								   	var unixTimestamp = new Date(value);  
								   	return unixTimestamp.toLocaleDateString();
							   	}else{
										return "-";
							   	}
							}  ,width:100} 
							  
					       
					       
				]]    
			});




		

		
	});
	
	
	</script>

  </head>
  
  
<body>   
<div id="container">
	<div id="cust">
			<div id="searchDiv">
						<div>
						<div class="label">订单号</div>
						<div class="hang"><input type="text"  id="payId"  class="easyui-textbox" name="custId" style="width:100px" /></div>
						
						<div class="label">客户号</div>
						<div class="hang"><input type="text"  id="custId" class="easyui-textbox" name="name"  style="width:100px"/></div>
						
						<div class="label">公司名</div>
						<div class="hang"><input type="text"  id="comId" class="easyui-textbox" name="telphone"  style="width:100px"/></div>
						</div>	
						<div class="label">批次号</div>
						<div class="hang"><input type="text"  id="sendNo" class="easyui-textbox" name="telphone"  style="width:100px"/></div>
						</div>		
						<div>
						<a id="btnSearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
						</div>
					</div>
		<div>			
			<div id="tableDG">
					<table id="dg"></table>
			</div>			
		</div>	
	</div>
	<hr>
	
	</div>
<div id="win" data-options="collapsible:false,minimizable:false,maxmizable:true,modal:true"></div>   
        
  
 </div>
</body>  


</html>
