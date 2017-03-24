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
				comId: $('#comId').val(),
				expressNo:$('#expressNo').val(),								
				sendNo: $('#telphone').val()
			});
		});
		$('#dg').datagrid({    
				//请求的url地址
			    url:'PayRecord-find.action', 
			    queryParams :{
					custId:'',
					payId:'',
					comId:'',
					expressNo:'',					
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
									$.post("PayRecord-deleteByIds.action",{ids:ids},function(result){
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
					        {field:'custName',title:'收货人名',align:'center',width:200},
					        {field:'telphone',title:'电话',align:'center',width:200},
					        {field:'email',title:'邮箱',align:'center',width:150},
					        {field:'city',title:'城市',align:'center',width:120},
					        {field:'address',title:'地址',align:'center',width:120},		        
					        {field:'remarks',title:'备注',align:'right',width:100},
					        
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
						<div>
						<div class="label">订单号</div>
						<div class="hang"><input type="text"  id="payId"  class="easyui-textbox" name="payId" style="width:100px" /></div>
						
						<div class="label">客户号</div>
						<div class="hang"><input type="text"  id="custId" class="easyui-textbox" name="custId"  style="width:100px"/></div>
						
						<div class="label">公司名</div>
						<div class="hang"><input type="text"  id="comId" class="easyui-textbox" name="comId"  style="width:100px"/></div>
						</div>	
						<div class="label">批次号</div>
						<div class="hang"><input type="text"  id="sendNo" class="easyui-textbox" name="sendNo"  style="width:100px"/></div>
						<div class="label">快递号</div>
						<div class="hang"><input type="text"  id="expressNo" class="easyui-textbox" name="expressNo"  style="width:100px"/></div>
						
						
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
