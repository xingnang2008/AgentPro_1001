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
				expressCom: $('#expressCom').val(),
				expressNo:$('#expressNo').val(),								
				status:'1'
			});
		});
		$('#dg').datagrid({    
				//请求的url地址
			    url:'PayRecord-find.action', 
			    queryParams :{
					custId:'',
					payId:'',
					expressNo:'',
					status:'1',					
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
					text:'清除记录',
					handler: function(){
					var rows =$("#dg").datagrid("getSelections");
					
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
								$.post("PayRecord-clearExpress.action",{ids:ids},function(result){
									if(result =="true"){

										//取消选中所有行
										$("#dg").datagrid("uncheckAll");
										//重新刷新页面
										$("#dg").datagrid("reload");
									}						
								
								},"text");

					}

					
	 			}
				},'-',
					{	
						text:"快递公司：<input type='text' id='expcom' />"   
					},{	
						text:"快递单号：<input type='text' id='expno' />"   
					},{	
						text:"发出日期：<input type='text' id='exsddate' />"   
					},{
						iconCls: 'icon-redo',
						text:'更新记录',
						handler: function(){
						var rows =$("#dg").datagrid("getSelections");
						
						var exno = $('#expno').val();
						var expfee =$('#expfee').val();
						var excom = $('#expcom').combobox('getValue');
						var sddate = $("#exsddate").combobox('getValue');
						
						if(exno =="" ||excom==""||sddate==""||expfee ==""){
							$.messager.show({
								title:'信息不全',
								msg:'请填全快递公司、单号和发出日期信息',
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
									$.post("PayRecord-updateExpress.action",{ids:ids,expCom:excom,expNo:exno,expsd:sddate},function(result){
										if(result =="true"){

											//取消选中所有行
											$("#dg").datagrid("uncheckAll");
											//重新刷新页面
											$("#dg").datagrid("reload");
										}						
									
									},"text");

						}

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
								{field:'orderId',title:'订单编号',width:100},
							{field:'payId',title:'链接编号',width:100},
							 {field:'custId',title:'客户编号',width:80},
							{field:'pics',title:'数量',width:80},
							{field:'payFee',title:'金额',width:100},
							{field:'wwwadd',title:'网址',width:250},
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
							{field:'comId',title:'公司编号',width:100}
					       
					        					        
					        
				]]    
			});

		$("#expno").textbox({
			width:120
		});
		
		$('#exsddate').datebox();
		
		$("#expcom").combobox({
			url:'<%=basePath%>admin/ExpressCom/ExpressCom-listAll.action',
			editable:false,
			valueField: 'expressCom',
			textField: 'expressCom',
			panelHeight:'auto',
			panelWidth:100,
			width:100
			

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
						
						<div class="label">快递公司</div>
						<div class="hang"><input type="text"  id="expressCom" class="easyui-textbox" name="expressCom"  style="width:100px"/></div>
						</div>	
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
