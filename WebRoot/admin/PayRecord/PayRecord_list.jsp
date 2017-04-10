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
				orderId:$('#orderId').val(),
				payId:$('#payId').val(),
				custId: $('#custId').val(),
				comId: $('#comId').val(),
				expressNo:$('#expressNo').val(),								
				sendNo: $('#telphone').val(),
				stdate: $('#stdate').datebox('getValue'), 
				enddate: $('#enddate').datebox('getValue')	
			});
		});
	$('#btnReset').click(function(){
			
			$('#orderId').textbox("clear"),
			$('#payId').textbox("clear"),
			$('#custId').textbox("clear"),			
			$('#comId').textbox("clear"),			
			$('#stdate').datebox('setValue',""), 
			$('#enddate').datebox('setValue',"")	
		
	});	
		$('#dg').datagrid({    
				//请求的url地址
			    url:'PayRecord-findALL.action', 
			    queryParams :{
		    		orderId:'',
					custId:'',
					payId:'',
					comId:'',
					expressNo:'',					
					sendNo:'',
					stdate: '', 
					enddate: ''
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
				singleSelect:false,
				//显示分页条				
				
				frozenColumns:[[
					{field:'z',checkbox:true},
					{field:'id',title:'编号',width:50}
				]],
				toolbar: [{
					iconCls: 'icon-add',
					text:'新建订单',
					handler: function(){
						$("#win").window({
							title:'新建订单',
							width:'100%',
							height:'100%',
							content:'<iframe src="PayRecord_saveInput.jsp" frameborder="0" width="100%" height="100%"> </iframe>'
						});
					
						}
					},
					{
						iconCls: 'icon-edit',
						text:'编辑订单',
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
								title:'更新订单',
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
								{field:'status',title:'状态',formatter:function(value,row,index){
									switch(value){
									case -1: return '退货';																
									break;
									case 0: return '缺货';																
									break;
									case 1: return '已订货';
									break;
									case 2: return '快递-发出';
									break;
									case 3: return '快递-接收';
									break;
									case 4: return '验货-有问题';
									break;
									case 5: return '验货-通过';
									break;
									case 6: return '已转运';
									break;
									case 7: return '已结束';
									break;
									case 8: return '-';
									break;
									}
								   	
								}, styler: function(value,row,index){
									switch(value){
									case -1: return 'background-color:#ffe;color:red;';																
									break;
									case 0: return 'background-color:#ffee00;color:9f9191;';																
									break;
									case 1: return 'color:red;';
									break;
									case 2: return '快递-发出';
									break;
									case 3: return '快递-接收';
									break;
									case 4: return 'background-color:#ffee00;color:red;'
									break;
									case 5: return 'background-color:#6293BB;color:#fff;';
									break;
									case 6: return 'background-color:#396604;color:red;';
									break;
									case 7: return 'background-color:#396604;';
									break;
									case 8: return '-';
									break;
									}
								}
												,width:100},	
							{field:'orderId',title:'订单编号',width:120},
							{field:'payId',title:'链接编号',width:100},
							{field:'pics',title:'数量',width:80},
							{field:'payFee',title:'金额',width:100},
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
							}  ,width:100}, 
							  
					        {field:'custId',title:'客户编号',width:80},
					        {field:'comId',title:'公司编号',width:80},
					        
					        {field:'sendNo',title:'批次',width:120},
							{field:'sendCom',title:'发件公司',width:120},
							{field:'sendFee',title:'发出费用',width:120},
							{field:'sendDate',title:'发出日期', formatter:function(value,row,index){
							   	if(value!=null){
								   	var unixTimestamp = new Date(value);  
								   	return unixTimestamp.toLocaleDateString();
							   	}else{
										return "-";
							   	}
							}  ,width:100},
							{field:'recDate',title:'到达日期', formatter:function(value,row,index){
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
					<div class='line'>
						<div class="label">订单号</div>
						<div class="hang"><input type="text"  id="orderId"  class="easyui-textbox" name="orderId" style="width:100px" /></div>
					
						<div class="label">链接号</div>
						<div class="hang"><input type="text"  id="payId"  class="easyui-textbox" name="payId" style="width:100px" /></div>
						
						<div class="label">客户号</div>
						<div class="hang"><input type="text"  id="custId" class="easyui-textbox" name="custId"  style="width:100px"/></div>
						
						<div class="label">公司名</div>
						<div class="hang"><input type="text"  id="comId" class="easyui-textbox" name="comId"  style="width:100px"/></div>
					</div>	
					<div class='line'>
						<div class="label">批次号</div>
						<div class="hang"><input type="text"  id="sendNo" class="easyui-textbox" name="sendNo"  style="width:100px"/></div>
						<div class="label">快递号</div>
						<div class="hang"><input type="text"  id="expressNo" class="easyui-textbox" name="expressNo"  style="width:100px"/></div>
						<div class="label">起始日期</div>
						<div class="hang"><input type="text" id="stdate" class="easyui-datebox" name="stdate" style="width:120px"/></div>
						<div class="label">截止日期</div>
						<div class="hang"><input type="text" id="enddate" class="easyui-datebox" name="enddate" style="width:120px" /></div>
						
				
					<a id="btnSearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
					<a id="btnReset" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'">清空</a>
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
