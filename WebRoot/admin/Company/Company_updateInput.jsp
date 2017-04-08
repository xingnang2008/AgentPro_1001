<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
   
    
	<%@include file="../head.jspf" %>
	 <script language="JavaScript" >
	 $(function(){
			var rows =parent.$("#dg").datagrid("getSelections");
			$("#ff").form('load',{
				id:rows[0].id,				
				comId:rows[0].comId,
				company:rows[0].company,
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
					    url:'<%=basePath%>admin/Company/Company-update.action',    
					    
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
	<div >
    	<form id="ff" method="post">
    		<div>
    			<label for="comId">公司编号：</label>
    			<input id="lineId" type="text" class="easyui-textbox"  name="comId" />
    		</div>
    		<div>
    			<label for="company">公司名称：</label>
    			<input class="easyui-textbox" type="text" name="company" style="width:300px"/>
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
