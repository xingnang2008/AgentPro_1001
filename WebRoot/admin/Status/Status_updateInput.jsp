<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
   
    
	<%@include file="../head.jspf" %>
	 <link rel="stylesheet" href="<%=basePath%>css/Rebate/Rebate_updateInput.css" type="text/css" />
	 <script language="JavaScript" >
	 $(function(){
			var rows =parent.$("#DgCustomer").datagrid("getSelections");
			$("#ff").form('load',{
				id:rows[0].id,				
				status:rows[0].status,
				remarks:rows[0].remarks
				//更新form中的数据
			});	
			
			//窗体弹出时默认禁用验证
			$("#ff").form("disableValidation");
			
			$("#btn").click(function(){
				//开启验证
				$("#ff").form("enableValidation");
				//如果验证成功，则提交数据
				if($("#ff").form("validate")){
					//提交数据
					//提交数据
					$('#ff').form('submit', {    
					    url:'<%=basePath%>admin/Status/Status-update.action',    
					    
					    success:function(){    
							//关闭当前窗体
							parent.$("#win").window("close");
							//重载dg
							parent.$("#DgCustomer").datagrid("reload");				           
					    }    
					});  
				}
			});
			
			
		})
	 </script>	

  </head>
  
  <body>
	<div >
    	<form id="ff" method="post">
    		<div>
    			<label for="custId">状&nbsp;&nbsp;态：</label>
    			<input id="status" type="text" class="easyui-textbox"  name="status" />
    		</div>
    			
    		<div>     			
    			<label for="remarks">备&nbsp;&nbsp;注：</label>
    			<input class="easyui-textbox" type="text" name="remarks" />
    		</div>  
    		
    		<hr/>  	
    		<div>
    			<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
    			<input type="hidden" name="id"/>
    		</div>
    	
    	</form>
    </div>
</body>
</html>
