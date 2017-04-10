<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<%@include file="../head.jspf" %>
	<link rel="stylesheet" href="<%=basePath%>css/PayRecord/PayRecord_express.css" type="text/css" />	
	
	<script type="text/javascript">
	$(function(){
		$('#btnSearch').click(function(){
			$('#dg').datagrid('load',{
				orderId:$('#orderId').val(),
				payId:$('#payId').val(),
				custId: $('#custId').val(),
				expressCom: $('#expressCom').val(),
				expressNo:$('#expressNo').val(),								
				status:'3'
			});
		});
		$('#dg').datagrid({    
				//请求的url地址
			    url:'PayRecord-findALL.action', 
			    queryParams :{
					orderId:'',
					custId:'',
					payId:'',
					expressNo:'',
					status:'3',					
					expressCom:''
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
				toolbar: [
					{	
						text:"验货：<input type='text' id='check' />"   
					},{	
						text:"备注：<input type='text' id='checkInfo' />"   
					},{	
						text:"验货日期：<input type='text' id='checkdate' />"   
					},{
						iconCls: 'icon-redo',
						text:'确定',
						handler: function(){
						var rows =$("#dg").datagrid("getSelections");
												
						var checks = $('#check').combobox('getValue');
						var cDate = $('#checkdate').combobox('getValue');
						
						var checkin = $('#checkInfo').val();
						if(checks==""||cDate==""){
							$.messager.show({
								title:'信息不全',
								msg:'请选择检验结果和日期！',
								timeout:2000,
								showType:'slide'
							});
						}else{
						if(rows.length ==0){
							$.messager.show({
								title:'选择行',
								msg:'至少要选中一行，进行操作。',
								timeout:2000,
								showType:'slide'
							});

						}else{
									//获取被选中的记录，后从记录中获取相应的id
									var ids ="";
									for(var i=0;i<rows.length;i++){
										ids += rows[i].id+",";
									}
									//拼接id的值
									ids = ids.substring(0,ids.lastIndexOf(","));
									
									//发送ajax请求
									$.post("PayRecord-checkExpress.action",{ids:ids,checkStatus:checks,checkdate:cDate,checkinfo:checkin},function(result){
										if(result =="true"){

											//取消选中所有行
											$("#dg").datagrid("uncheckAll");
											//重新刷新页面
											$("#dg").datagrid("reload");
											$("#dg2").datagrid("reload");
											$("#dg3").datagrid("reload");
										}						
									
									},"text");

						}

						}
		 			}
					}
					

					],
			    columns:[[ 	
							{field:'exRecDate',title:'收到日期', formatter:function(value,row,index){
							   	if(value!=null){
								   	var unixTimestamp = new Date(value);  
								   	return unixTimestamp.toLocaleDateString();
							   	}else{
										return "-";
							   	}
							}  ,width:100}, 
							{field:'expressCom',title:'快递公司',width:120},
							{field:'expressNo',title:'快递单号',width:120},
							
							
							{field:'pics',title:'数量',width:80},
							{field:'payFee',title:'金额',width:100},
							{field:'wwwadd',title:'网址',width:250},
							{field:'info',title:'定单信息',width:120},
							{field:'orderId',title:'订单编号',width:120},
							{field:'payId',title:'订单编号',width:100},
							 {field:'custId',title:'客户编号',width:80},
							
							{field:'expressFee',title:'快递费用',width:120},
							{field:'exSendDate',title:'发出日期', formatter:function(value,row,index){
							   	if(value!=null){
								   	var unixTimestamp = new Date(value);  
								   	return unixTimestamp.toLocaleDateString();
							   	}else{
										return "-";
							   	}
							}  ,width:100},

							
							  
							{field:'buyDate',title:'订单日期',align:'center',
								 formatter:function(value,row,index){
									   	if(value!=null){
										   	var unixTimestamp = new Date(value);  
										   	return unixTimestamp.toLocaleDateString();
									   	}else{
												return "-";
									   	}
								}  ,width:100},	
					        {field:'custName',title:'收货人名',align:'center',width:200},
					        {field:'telphone',title:'电话',align:'center',width:200},
					        {field:'email',title:'邮箱',align:'center',width:150},
					        {field:'city',title:'城市',align:'center',width:120},
					        {field:'address',title:'地址',align:'center',width:120},		        
					        {field:'remarks',title:'备注',align:'right',width:100}
					        
					        
				]]    
			});

		$("#checkInfo").textbox({
			width:200
		});
		$('#checkdate').datebox();
		$("#check").combobox({
			
			editable:false,
			valueField: 'value',
			textField: 'label',
			panelHeight:'100',
			panelWidth:100,
			width:100,
			data: [{
				label: '验货通过',
				value: '0'
			},{
				label: '未通过',
				value: '1'
			}] 
			

		});

		$('#btnSearch2').click(function(){
			$('#dg2').datagrid('load',{
				orderId:$('#orderId').val(),
				payId:$('#payId').val(),
				custId: $('#custId').val(),
				expressCom: $('#expressCom').val(),
				expressNo:$('#expressNo').val(),								
				status:'5'
			});
		});
		$('#dg2').datagrid({    
				//请求的url地址
			    url:'PayRecord-findALL.action', 
			    queryParams :{
					orderId:'',
					custId:'',
					payId:'',
					expressNo:'',
					status:'5',					
					expressCom:''
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
					iconCls: 'icon-undo',
					text:'退回到未验收',
					handler: function(){
					var rows =$("#dg2").datagrid("getSelections");
					
					if(rows.length ==0){
						$.messager.show({
							title:'选择行',
							msg:'至少要选中一行，进行操作。',
							timeout:2000,
							showType:'slide'
						});

					}else{
								//获取被选中的记录，后从记录中获取相应的id
								var ids ="";
								for(var i=0;i<rows.length;i++){
									ids += rows[i].id+",";
								}
								//拼接id的值
								ids = ids.substring(0,ids.lastIndexOf(","));
								
								//发送ajax请求
								$.post("PayRecord-backExpress.action",{ids:ids,expStatus:3},function(result){
									if(result =="true"){

										//取消选中所有行
										$("#dg2").datagrid("uncheckAll");
										//重新刷新页面
										$("#dg2").datagrid("reload");
										$("#dg").datagrid("reload");
									}						
								
								},"text");

					}

					
	 			}
				}
					

					],
			    columns:[[ 	
							{field:'expressNo',title:'快递单号',width:120},
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
									case 2: return '';
									break;
									case 3: return '';
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
							{field:'checkInfo',title:'验货信息',width:150},		
							{field:'orderId',title:'订单编号',width:100},
							{field:'payId',title:'链接编号',width:100},
							{field:'pics',title:'数量',width:80},
							{field:'payFee',title:'金额',width:100},
							{field:'wwwadd',title:'网址',width:250},
							{field:'info',title:'定单信息',width:120},
							{field:'buyDate',title:'订单日期',align:'center',
								 formatter:function(value,row,index){
									   	if(value!=null){
										   	var unixTimestamp = new Date(value);  
										   	return unixTimestamp.toLocaleDateString();
									   	}else{
												return "-";
									   	}
								}  ,width:100},
							{field:'expressCom',title:'快递公司',width:120},
							
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
							  
					       
					        {field:'custName',title:'收货人名',align:'center',width:200},
					        {field:'telphone',title:'电话',align:'center',width:200},
					        {field:'email',title:'邮箱',align:'center',width:150},
					        {field:'city',title:'城市',align:'center',width:120},
					        {field:'address',title:'地址',align:'center',width:120},		        
					        {field:'remarks',title:'备注',align:'right',width:100}
					        
					        
				]]    
			});
		//有问题的件列表
		$('#dg3').datagrid({    
			//请求的url地址
		    url:'PayRecord-findALL.action', 
		    queryParams :{
				orderId:'',
				custId:'',
				payId:'',
				expressNo:'',
				status:'4',					
				expressCom:''
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
				iconCls: 'icon-undo',
				text:'退回到未验收',
				handler: function(){
				var rows =$("#dg3").datagrid("getSelections");
				
				if(rows.length ==0){
					$.messager.show({
						title:'选择行',
						msg:'至少要选中一行，进行操作。',
						timeout:2000,
						showType:'slide'
					});

				}else{
							//获取被选中的记录，后从记录中获取相应的id
							var ids ="";
							for(var i=0;i<rows.length;i++){
								ids += rows[i].id+",";
							}
							//拼接id的值
							ids = ids.substring(0,ids.lastIndexOf(","));
							
							//发送ajax请求
							$.post("PayRecord-backExpress",{ids:ids,expStatus:3},function(result){
								if(result =="true"){

									//取消选中所有行
									$("#dg").datagrid("uncheckAll");
									//重新刷新页面
									$("#dg3").datagrid("reload");
									$("#dg").datagrid("reload");
									
								}						
							
							},"text");

				}

				
 			}
			}
				

				],
		    columns:[[ 	
						{field:'expressNo',title:'快递单号',width:120},
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
								case 2: return '';
								break;
								case 3: return '';
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
						{field:'checkInfo',title:'验货信息',width:150},		
						{field:'orderId',title:'订单编号',width:100},
						{field:'payId',title:'链接编号',width:100},
						{field:'pics',title:'数量',width:80},
						{field:'payFee',title:'金额',width:100},
						{field:'wwwadd',title:'网址',width:250},
						{field:'info',title:'定单信息',width:120},
						{field:'buyDate',title:'订单日期',align:'center',
							 formatter:function(value,row,index){
								   	if(value!=null){
									   	var unixTimestamp = new Date(value);  
									   	return unixTimestamp.toLocaleDateString();
								   	}else{
											return "-";
								   	}
							}  ,width:100},
						{field:'expressCom',title:'快递公司',width:120},
						
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
						  
				       
				        {field:'custName',title:'收货人名',align:'center',width:200},
				        {field:'telphone',title:'电话',align:'center',width:200},
				        {field:'email',title:'邮箱',align:'center',width:150},
				        {field:'city',title:'城市',align:'center',width:120},
				        {field:'address',title:'地址',align:'center',width:120},		        
				        {field:'remarks',title:'备注',align:'right',width:100}
				        
				        
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
						<div class="hang"><input type="text"  id="orderId"  class="easyui-textbox" name="orderId" style="width:100px" /></div>
						
						<div class="label">订单号</div>
						<div class="hang"><input type="text"  id="payId"  class="easyui-textbox" name="payId" style="width:100px" /></div>
						
						<div class="label">客户号</div>
						<div class="hang"><input type="text"  id="custId" class="easyui-textbox" name="custId"  style="width:100px"/></div>
						
						<div class="label">快递公司</div>
						<div class="hang"><input type="text"  id="expressCom" class="easyui-textbox" name="expressCom"  style="width:100px"/></div>
						</div>	
						<div class="label">快递号</div>
						<div class="hang"><input type="text"  id="expressNo" class="easyui-textbox" name="expressNo"  style="width:100px"/></div>
						
						
				</div>		
				<div>
					<a id="btnSearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
					<a id="btnSearch2" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询已验货</a>
				</div>
					</div>
		<div>			
			<div id="tableDG">
					<table id="dg"></table>
			</div>	
			<div id="tableDG3">
					<table id="dg2"></table>
			</div>	
			<div id="tableDG4">
					<table id="dg3"></table>
			</div>		
		</div>	
	</div>
	<hr>
	
	</div>
<div id="win" data-options="collapsible:false,minimizable:false,maxmizable:true,modal:true"></div>   
        
  
 </div>
</body>  


</html>
