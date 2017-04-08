<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<%@include file="../head.jspf"%>
		<link rel="stylesheet"
			href="<%=basePath%>css/Track/Track_updateInput.css" type="text/css" />
		<title>My JSP 'Rebategoods_saveInput.jsp' starting page</title>

		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript">
		$(function(){
			//窗体弹出时默认禁用验证
			$("#ff").form("disableValidation");
			
			$("#btnSave").click(function(){
				//开启验证
				$("#ff").form("enableValidation");
				//如果验证成功，则提交数据
				if($("#ff").form("validate")){
					//提交数据
					$('#ff').form('submit', {    
					    url:'<%=basePath%>admin/Receipt/Receipt-save.action',    
					    success:function(){    
							//关闭当前窗体
							parent.$("#win").window("close");
							//重载dg
							parent.$("#dg").datagrid("reload");				           
					    }    
					});  
					
				}
			});
			//公司选择框
			$("#comId").combobox({
				url:'<%=basePath%>admin/Company/Company-listAll.action',
				editable:false,
				valueField:'comId',
				textField:'comId',
				panelHeight:'200',
				panelWidth:100,
				width:100,
				onSelect: function(rec){    
				$('#comName').textbox('setValue',rec.company);
		 			
        	}  
				
			});
			
		});
	
	
	</script>

	</head>

	<body>
		<form id="ff" method="post">

			<div id="container">
				<font color="green"><h2>
						收款记录
					</h2>
				</font>
				<hr/>
				<div>
	    			<label for="comId">公司编号：</label>
	    			<input id="comId" type="text" class="easyui-textbox"  name="comId" />
    			</div>
				<div>
    				<label for="comName">公司名称：</label>
    				<input class="easyui-textbox" type="text" id="comName" name="comName" style="width:300px"/>
    			</div>

				<div>
    				<label for="fee">金&nbsp;&nbsp;额：</label>
    				<input type="text" class="easyui-numberbox validatebox"	required="true"  precision="2" value="0.00"id="fee" name="fee" />
    			</div>
				<div>
    				<label for="receiptDate">收款日期：</label>
    				<input type="text" class="easyui-datebox validatebox"
							required="true" name="receiptDate" />
    			</div>
							
				<div>
    				<label for="payMethod">结 付 款：</label>
    				<select name="payMethod" class="easyui-combobox"
							style="width: 100px; panelHeight: 80px;">
							<option value="0">收款</option>
							<option value="1">返款</option>

						</select>
    			</div>
				

				<div>     			
    			<label for="remarks">备&nbsp;&nbsp;注：</label>
    			<input class="easyui-textbox" type="text" name="remarks" />
    		</div>   

			<div>
    			<a id="btnSave" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
	    	</div>
    	




			</div>
		</form>

	</body>
</html>