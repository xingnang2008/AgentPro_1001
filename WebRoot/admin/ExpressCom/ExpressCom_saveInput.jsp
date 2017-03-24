<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <%@include file="../head.jspf" %>
    
    <title>My JSP 'Rebategoods_saveInput.jsp' starting page</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
		$(function(){
			//窗体弹出时默认禁用验证
			$("#ff").form("disableValidation");
			$("#lineId").textbox({
				required:true
				});
			$("#btn").click(function(){
				//开启验证
				$("#ff").form("enableValidation");
				//如果验证成功，则提交数据
				if($("#ff").form("validate")){
					//提交数据
					$('#ff').form('submit', {    
					    url:'<%=basePath%>admin/ExpressCom/ExpressCom-save.action',    
					    success:function(){    
							//关闭当前窗体
							parent.$("#win").window("close");
							//重载dg
							parent.$("#dg").datagrid("reload");				           
					    }    
					});  
					
				}
			});

			
		})
	
	
	</script>

  </head>
  
  <body>
  <form id="ff" method="post">
   	 <div >
    	
    		
    		
    		<div>
    			<label for="expressCom">快递公司：</label>
    			<input class="easyui-textbox" type="text" name="expressCom" style="width:300px"/>
    		</div>
    		<div>     			
    			<label for="tel">电&nbsp;&nbsp;话：</label>
    			<input class="easyui-textbox" type="text" name="tel" style="width:300px" />
    		</div> 
    		
    		<div>     			
    			<label for="remarks">备&nbsp;&nbsp;注：</label>
    			<input class="easyui-textbox" type="text" name="remarks" />
    		</div>  
    		
    		<hr/>  	
    		<div>
    			<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
    			
    		</div>
    	
    	</div>	
    	
    	
   	
    </form>
  </body>
</html>
