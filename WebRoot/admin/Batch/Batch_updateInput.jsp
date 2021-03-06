<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
   
    
	<%@include file="../head.jspf" %>
	 <link rel="stylesheet" href="<%=basePath%>css/Batch/Batch_updateInput.css" type="text/css" />
	 <script language="JavaScript" >
	 $(function(){
			var rows =parent.$("#dg").datagrid("getSelections");
			$("#ff").form('load',{
				id:rows[0].id,				
				sendNo:rows[0].sendNo,
				sendDate:rows[0].sendDate,
				weight:rows[0].weight,
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
					    url:'Batch-update.action',    
					    
					    success:function(){    
							//关闭当前窗体
							parent.$("#win").window("close");
							//重载dg
							parent.$("#dg").datagrid("reload");				           
					    }    
					});  
				}
			});
			//线路选择框
			$("#lineId").combobox({
				url:'<%=basePath%>admin/Line/Line-listAll.action',
				editable:false,
				required:true,
				valueField:'lineId',
				textField:'lineId',
				panelHeight:300,
				panelWidth:100,
				width:100
			}); 	
			
		})
	 </script>	

  </head>
  
  <body>
  <div><H3>请在更改【批次名】前，确认此批次下没有运单</H3></div> <br> <Hr/><br>
  
	<div >
    	<form id="ff" method="post">
    		<div>
    			<label for="sendNo">批&nbsp;&nbsp;次：</label>
    			<input class="easyui-textbox" data-options="required:true"  type="text" name="sendNo" />
    		</div>
    	
    		<hr/>
    		
    		<div>
    			<label for="weight">重&nbsp;&nbsp;量：</label>
    			<input class="easyui-numberbox" type="text" name="weight" />
    			</div>
    		<div>
       			<label for="sdDate">发出日期：</label>
    			<input class="easyui-datebox" type="text" name="sendDate" />
    			</div>
    		
    		<div>
    			<label for="remarks">备&nbsp;&nbsp;注：</label>
    			<input class="easyui-textbox" type="text" name="remarks" />
    			
    		
    		</div>  
    		<br>
    		<hr/>  	
    		<div>
    			<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
    			<input type="hidden" name="id"/>
    		</div>
    	
    	</form>
    </div>
</body>
</html>
