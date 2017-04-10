<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<%@include file="../head.jspf" %>
	<link rel="stylesheet" href="<%=basePath%>css/Orders/Orders_list.css" type="text/css" />	
	
	<script type="text/javascript">
	$(function(){
		$('#btnSearch').click(function(){
			$('#dg').datagrid('load',{
				orderId:$('#orderId').val(),
				custId: $('#custId').val(),
				comId: $('#comId').val(),
				stdate: $('#stdate').datebox('getValue'), 
				enddate: $('#enddate').datebox('getValue')	
				
			});
		});
		$('#btnReset').click(function(){
			
			$('#orderId').textbox("clear"),
			$('#custId').textbox("clear"),			
			$('#comId').textbox("clear"),			
			$('#stdate').datebox('setValue',""), 
			$('#enddate').datebox('setValue',"")	
		
	});	
		$('#dg').datagrid({    
				//请求的url地址
			    url:'Orders/Orders-find.action', 
			    queryParams :{
					orderId:'',
					custId:'',
					comId:'',
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
				
				onLoadSuccess:totalFee,
				onClickRow:totalFee,
				onDblClickRow:function(rowIndex,rowData){
						var pid = rowData.orderId;						
						$('#payDg').datagrid('reload',{
							orderId:pid,											
						});
						$("#payDg").datagrid("uncheckAll");		
					},
				onSelectAll:totalFee,
				onCheck:totalFee,
				onUncheck:totalFee,
					
				rowStyler: function(index,row){
						switch(row.status){
						case 0: return '';
						break;
						case 1: return 'background-color:#c5eecb;';
						break;
						case 2: return 'background-color:#79ab89;';
						break;
						case 3: return 'background-color:#51745d;';
						break;
						case 4: return 'background-color:#2b5539;';
						break;
						case 5: return 'background-color:#502266;color:#fff;';
						break;
						case 6: return 'background-color:#165b37;color:#fff;';
						break;
						case 7: return 'background-color:#6293BB;color:#fff;';
						break;
						}
						
						
					},
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
							content:'<iframe src="<%=basePath%>admin/Orders/Orders_saveInput.jsp" frameborder="0" width="100%" height="100%"> </iframe>'
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
								content:'<iframe title="" src="<%=basePath%>admin/Orders/Orders_updateInput.jsp" frameborder="0" width="100%" height="100%"/>'
							});
					}}},
					{
						iconCls: 'icon-remove',
						text:'删除记录',
						handler: function(){
						var rows =$("#dg").datagrid("getSelections");
						if(rows.length ==0){
							$.messager.show({
								title:'选择行',
								msg:'至少要选中一行，进行删除操作。',
								timeout:2000,
								showType:'slide'
							});

						}else{
							//提示是否删除，如果确认，执行删除
							$.messager.confirm("删除确认对话框","是否要删除选中的记录",function(r){
								if(r){
									//获取被选中的记录，后从记录中获取相应的id
									var ids ="";
									for(var i=0;i<rows.length;i++){
										ids += rows[i].id+",";
									}
									//拼接id的值
									ids = ids.substring(0,ids.lastIndexOf(","));
									
									//发送ajax请求
									$.post("<%=basePath%>admin/Orders/Orders-deleteByIds.action",{ids:ids},function(result){
										if(result =="true"){
											$.messager.show({
												title:'删除成功',
												msg:'删除成功',
												timeout:2000,
												showType:'slide'
											
											});
											//取消选中所有行
											$("#dg").datagrid("uncheckAll");
											//重新刷新页面
											$("#dg").datagrid("reload");
											
										}else{
											$.messager.show({
												title:'删除错误',
												msg:'删除失败,必须先删除此单下的货物明细！',
												timeout:2000,
												showType:'slide'
											});
										}
									},"text");
								}
							});
						}
						}
					}
					

					],
			    columns:[[ 	
							{field:'orderDate',title:'订单日期',align:'center',
								 formatter:function(value,row,index){
									   	if(value!=null){
										   	var unixTimestamp = new Date(value);  
										   	return unixTimestamp.toLocaleDateString();
									   	}else{
												return "-";
									   	}
								}  ,width:100},	
							{field:'orderId',title:'订单编号',width:120},
							{field:'fee',title:'订单金额',width:120},				
					        {field:'custId',title:'客户编号',width:80},
					        {field:'custName',title:'收货人名',align:'center',width:200},
					        {field:'telphone',title:'电话',align:'center',width:200},
					        {field:'email',title:'邮箱',align:'center',width:150},
					        {field:'city',title:'城市',align:'center',width:120},
					        {field:'comId',title:'公司编号',width:80},
					        {field:'comName',title:'公司名称',width:100}
					       
				]]    
			});



		$('#payDg').datagrid({    
				//请求的url地址
			    url:'<%=basePath%>admin/PayRecord/PayRecord-find.action', 
				queryParams :{
				 orderId:'orderId'
				<%--					custId:'',--%>
				<%--					payId:'',--%>
				<%--					comId:'',--%>
				<%--					expressNo:'',--%>
				<%--					expressCom:'',--%>
				<%--					status:'',					--%>
				<%--					sendNo:'',--%>
				<%--					stdate: 'stdate', --%>
				<%--					enddate: 'enddate'--%>
				},
			   loadMsg:'请等待...',
				//隔行换色——斑马线
				fit:true,
				striped:true,
				//数据同行显示				
				nowrap:true,
				//显示行号
				rownumbers:true,
				//自动适应列，如设为true则不会出现水平滚动条，在演示冻结列此参数不要设置
				fitColumns:false,
				//单行选择，全选功能失效
				singleSelect:false,
				//显示分页条				
				onLoadSuccess:totalPay,
				onClickRow:totalPay,
				onSelectAll:totalPay,
				onCheck:totalPay,
				onUncheck:totalPay,
				onDblClickRow:function(rowIndex,rowData){
											
						window.open(rowData.wwwadd);									
						
					},
							
				frozenColumns:[[
					{field:'z',checkbox:true}
					
				]],
				toolbar: [{
					iconCls: 'icon-add',
					text:'新建订单',
					handler: function(){
						$("#win").window({
							title:'新建订单',
							width:'100%',
							height:'100%',
							content:'<iframe src="<%=basePath%>admin/PayRecord/PayRecord_saveInput.jsp" frameborder="0" width="100%" height="100%"> </iframe>'
						});
					
						}
					},
					{
						iconCls: 'icon-edit',
						text:'编辑订单',
						handler: function(){
						var rows =$("#payDg").datagrid("getSelections");
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
								content:'<iframe title="" src="<%=basePath%>admin/PayRecord/PayRecord_updateInput.jsp" frameborder="0" width="100%" height="100%"/>'
							});
					}}},
					{
						iconCls: 'icon-remove',
						text:'删除记录',
						handler: function(){
						var rows =$("#payDg").datagrid("getSelections");
						if(rows.length ==0){
							$.messager.show({
								title:'选择行',
								msg:'至少要选中一行，进行删除操作。',
								timeout:2000,
								showType:'slide'
							});

						}else{
							//提示是否删除，如果确认，执行删除
							$.messager.confirm("删除确认对话框","是否要删除选中的记录",function(r){
								if(r){
									//获取被选中的记录，后从记录中获取相应的id
									var ids ="";
									for(var i=0;i<rows.length;i++){
										ids += rows[i].id+",";
									}
									//拼接id的值
									ids = ids.substring(0,ids.lastIndexOf(","));
									
									//发送ajax请求
									$.post("<%=basePath%>admin/PayRecord/PayRecord-deleteByIds.action",{ids:ids},function(result){
										if(result =="true"){
											$.messager.show({
												title:'删除成功',
												msg:'删除成功',
												timeout:2000,
												showType:'slide'
											
											});
											//取消选中所有行
											$("#payDg").datagrid("uncheckAll");
											//重新刷新页面
											$("#payDg").datagrid("reload");
											
										}else{
											$.messager.show({
												title:'删除错误',
												msg:'删除失败,必须先删除此单下的货物明细！',
												timeout:2000,
												showType:'slide'
											});
										}
									},"text");
								}
							});
						}
						}
					},
					{
						iconCls: 'icon-remove',
						text:'缺货记录',
						handler: function(){
							var rows =$("#payDg").datagrid("getSelections");
						
								if(rows.length ==0){
									$.messager.show({
										title:'选择行',
										msg:'至少要选中一行，进行操作。',
										timeout:2000,
										showType:'slide'
									});
		
								}else{
									//提示是否删除，如果确认，执行删除
									$.messager.confirm("确认对话框","是否要标记选中的记录",function(r){
										if(r){
											//获取被选中的记录，后从记录中获取相应的id
											var ids ="";
											for(var i=0;i<rows.length;i++){
												ids += rows[i].id+",";
											}
											//拼接id的值
											ids = ids.substring(0,ids.lastIndexOf(","));
											
											//发送ajax请求
											$.post("<%=basePath%>admin/PayRecord/PayRecord-updateNoStore",{ids:ids},function(result){
												if(result =="true"){
													$.messager.show({
														title:'更新成功',
														msg:'更新成功',
														timeout:2000,
														showType:'slide'
													
													});
													//取消选中所有行
													$("#payDg").datagrid("uncheckAll");
													//重新刷新页面
													$("#payDg").datagrid("reload");
													
												}else{
													$.messager.show({
														title:'更新错误',
														msg:'更新失败！',
														timeout:2000,
														showType:'slide'
													});
												}
											},"text");
										}
									
									
							
								});
						}
						
					}
					}
					
				
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
							{field:'orderId',title:'订单编号',width:120},
							{field:'payId',title:'链接编号',width:100},
							{field:'pics',title:'数量',width:80},
							{field:'payFee',title:'金额',width:100},
							{field:'wwwadd',title:'网址',width:150},
							{field:'info',title:'购买信息',width:120},
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
	function totalPay(){
    	//计算函数
    	 var costTotal=0//统计货值的总和
    	    ,expTotal=0;//统计邮费的总和
    	    
    	    var rows = $('#payDg').datagrid('getSelections')//获取当前的数据行
    	    
    	    for (var i = 0; i < rows.length; i++) {
    	    	if(rows[i]['status'] >=1){
    	    		costTotal += rows[i]['payFee'];
    	    	}
    	    	expTotal+= rows[i]['expressFee'];
    	    }
    	    //新增  显示统计信息
    	   $("#cost").text(costTotal.toFixed(2));
    	   $("#expFee").text(expTotal.toFixed(2));
    	      	   
    	  
      }
	function totalFee(){
    	//计算函数
    	 var feeTotal = 0;//计算货款的总和
    	    var rows = $('#dg').datagrid('getSelections')//获取当前的数据行
    	    for (var i = 0; i < rows.length; i++) {
    	    	feeTotal += rows[i]['fee'];
    	    }
    	    //新增  显示统计信息
    	   $("#fee").text(feeTotal.toFixed(2));
    	  
      }
	
	
	</script>

  </head>
  
  
<body>   
<div id="container">
	<div id="cust">
			<div id="searchDiv">
						<div>
						<div class="label">订单号</div>
						<div class="hang"><input type="text"  id="orderId"  class="easyui-textbox" name="orderId" style="width:100px" /></div>
						
						<div class="label">客户号</div>
						<div class="hang"><input type="text"  id="custId" class="easyui-textbox" name="custId"  style="width:100px"/></div>
						
						<div class="label">公司号</div>
						<div class="hang"><input type="text"  id="comId" class="easyui-textbox" name="comId"  style="width:100px"/></div>
						</div>	
						<div class="label">起始日期</div>
						<div class="hang"><input type="text" id="stdate" class="easyui-datebox" name="stdate" style="width:120px"/></div>
						<div class="label">截止日期</div>
						<div class="hang"><input type="text" id="enddate" class="easyui-datebox" name="enddate" style="width:120px" /></div>
						
				</div>		
				<div>
					<a id="btnSearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
					<a id="btnReset" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'">清空</a>				
				</div>
					</div>
		<div id="dgs">			
			<div id="tableDG">
					<table id="dg"></table>
					
			</div>
			<div id="botOrder">
				<div class="label">订单金额</div><div class="hang"><p id="fee">0.00</p></div>
			</div>	
			<div id="DGT">
				<table id="payDg"></table>
				
			</div>
			<div id="botPay">
				<div class="label">货款：</div><div class="hang"><p id="cost">0.00</p></div>
				<div class="label">邮费：</div><div class="hang"><p id="expFee">0.00</p></div>
				
			</div>			
		</div>	
	</div>
	<hr>
	
	</div>
<div id="win" data-options="collapsible:false,minimizable:false,maxmizable:true,modal:true"></div>   
        
  
 </div>
</body>  


</html>
