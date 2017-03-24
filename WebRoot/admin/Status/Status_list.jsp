<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<%@include file="../head.jspf" %>
	<link rel="stylesheet" href="<%=basePath%>css/Batch/Batch_list.css" type="text/css" />	
	
	<script type="text/javascript">
	$(function(){
		
		$('#DgCustomer').datagrid({    
				//请求的url地址
			    url:'Status-find.action', 
			   
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
				
				
				toolbar: [{
					iconCls: 'icon-add',
					text:'添加状态',
					handler: function(){
						$("#win").window({
							title:'添加状态',
							width:'650',
							height:'80%',
							content:'<iframe src="Status_saveInput.jsp" frameborder="0" width="100%" height="100%"> </iframe>'
						});
					
						}
					},
					{
						iconCls: 'icon-edit',
						text:'编辑公司',
						handler: function(){
						var rows =$("#DgCustomer").datagrid("getSelections");
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
								width:'1025',
								height:'645',
								content:'<iframe title="" src="Status_updateInput.jsp" frameborder="0" width="100%" height="100%"/>'
							});
					}}},
					{
						iconCls: 'icon-remove',
						text:'删除公司',
						handler: function(){
						var rows =$("#DgCustomer").datagrid("getSelections");
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
									$.post("Status-deleteByIds.action",{ids:ids},function(result){
										if(result =="true"){
											$.messager.show({
												title:'删除成功',
												msg:'删除成功',
												timeout:2000,
												showType:'slide'
											
											});
											//取消选中所有行
											$("#DgCustomer").datagrid("uncheckAll");
											//重新刷新页面
											$("#DgCustomer").datagrid("reload");
											
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
					'-',
					{
						iconCls: 'icon-reload',
						text:'刷新',
						handler: function(){$("#DgCustomer").datagrid("reload");}
					},{	
						text:"<input type='text' id='ss' />"
				}
					

					],
			    columns:[[ 			      
					        {field:'id',title:'编号',width:80},
					        {field:'status',title:'状态',align:'center',width:150},
					        {field:'remarks',title:'备注',align:'right',width:150}
				]]    
			});
		//设置分页控件  
		$('#ss').searchbox({
			searcher:function(value,name){
				$('#DgCustomer').datagrid('load',{stauts:value});
			},
			prompt:'状态'

		});
		
	});
	
	
	</script>

  </head>
  
  
<body>   
<div id="container">
	<div id="cust">
									
		<div>			
			<div id="tableDG">
					<table id="DgCustomer"></table>
			</div>
			
		</div>	
	
	<hr>
	
	</div>
<div id="win" data-options="collapsible:false,minimizable:false,maxmizable:true,modal:true"></div>   
        
  
 </div>
</body>  


</html>
