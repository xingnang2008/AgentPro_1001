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
				comId:$('#comId').combobox('getValue')
											
				
			});
		});
		$('#dg').datagrid({    
				//请求的url地址
			    url:'PayRecord-listFee.action', 
			    queryParams :{
					custId:''
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
					{field:'z',checkbox:true}
				]],
				
			    columns:[[ 	
							
							{field:'custId',title:'客户编号',width:80},				
							{field:'payFee',title:'货款',align:'center',width:200},
						    {field:'expressFee',title:'快递费用',width:120},
							{field:'sendFee',title:'运费',align:'center',width:150},
							  
					       
					        {field:'custName',title:'收货人名',align:'center',width:200},
					       					      
					        
					        
				]]    
			});

		
		$("#expcom").combobox({
			
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
		$("#comId").combobox({
			url:'<%=basePath%>admin/Company/Company-listAll.action',
			editable:false,
			valueField: 'comId',
			textField: 'comId',
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
						<div class="label">公司号</div>
						<div class="hang"><input type="text"  id="comId"  name="comId" style="width:100px" /></div>
						
						
						
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
