<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
   
    
	<%@include file="../head.jspf" %>
	 <link rel="stylesheet" href="<%=basePath%>css/PayRecord/PayRecord_updateInput.css" type="text/css" />
	 <script language="JavaScript" >
	 $(function(){
			var rows =parent.$("#dg").datagrid("getSelections");
			$("#ff").form('load',{
				id:rows[0].id,
				orderId:rows[0].orderId,
				fee:rows[0].fee,
				info:rows[0].info,
				orderDate:rows[0].orderDate,
				comId:rows[0].comId,
				comName:rows[0].comName,
				custId:rows[0].custId,
				custName:rows[0].custName,
				telphone:rows[0].telphone,
				city:rows[0].city,
				address:rows[0].address,
				email:rows[0].email,
				remarks:rows[0].remarks,
				status:rows[0].status
								
				//更新form中的数据
			});	
			
			//窗体弹出时默认禁用验证
			$("#ff").form("disableValidation");
			
			$("#btnSave").click(function(){
				//开启验证
				$("#ff").form("enableValidation");
				//如果验证成功，则提交数据
				if($("#ff").form("validate")){
					//提交数据
					//提交数据
					$('#ff').form('submit', {    
					    url:'<%=basePath%>admin/Orders/Orders-update.action',    
					    
					    success:function(){    
							//关闭当前窗体
							parent.$("#win").window("close");
							//重载dg
							parent.$("#dg").datagrid("reload");				           
					    }    
					});  
				}
			});
			//订单号选取
			$("#orderId").combobox({
				url:'<%=basePath%>admin/Orders/Orders-listAll.action',
				editable:false,
				valueField:'orderId',
				textField:'orderId',
				panelHeight:200,
				panelWidth:120,
				width:120,
				onSelect: function(rec){    				
	             $('#comId').textbox('setValue', rec.comId); 
	             $('#custId').textbox('setValue', rec.custId); 
        	}  
			});
			
		})
	 </script>	

  </head>
  
  <body>
	
    	<form id="ff" method="post">
   	<div class="container">
				<div id="top">
					<a id="btnSave" href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-save'">保存</a>
				</div>

				<div class="main">

					<div class="kuai">
						<div class="hang">
							<div class="xiang">
								<div class="xianglabel">
									订单号
								</div>
								<div class="xiangshort">
									<input id="orderId" name="orderId"
										class="easyui-validatebox textbox"
										style="width: 180px; height: 25px;" />
								</div>
							</div>
							<div class="xiang">
								<div class="xianglabel">
									订货日期
								</div>
								<div class="xiangshort">
									<input id="orderDate" type="text" class="easyui-datebox"
										name="orderDate" />
								</div>
							</div>

							<div class="xiang">
								<div class="xianglabel"></div>
								<div class="xiangshort"></div>
							</div>
							<div class="xiang">
								<div class="xianglabel"></div>
								<div class="xiangshort"></div>
							</div>
							</div>
						<div class="hang">	
								<div class="xiang">
									<div class="xianglabel">订单金额</div>
									<div class="xiangshort"><input id="fee" class="easyui-numberbox validatebox"
											required="required"  precision="2" value="0" name="fee" /></div>
								</div>
								<div class="xiang">
									<div class="xianglabel"></div>
									<div class="xiangshort"></div>
								</div>
						</div>
						<div class="hang">	
							<div style="width: 500px; float: left;">
								<div class="xianglabel">
									说明
								</div>
								<div style="width: 400px; float: left">
									<input type="text" class="easyui-textbox" multiline="true"
										value="" style="width: 390px; height: 40px" name="info" />
								</div>
							</div>
						</div>
					</div>
					<div class="kuai">
						<div class="hang">
							<div class="xiang">
								<div class="xianglabel">
									公司号
								</div>
								<div class="xiangshort">
									<input id="selectComId" name="comId" />
								</div>
							</div>
							<div class="xiang">
								<div class="xianglabel">
									公司名
								</div>
								<div class="xiangshort">
									<input id="comName" class="easyui-textbox" name="comName" />
								</div>
							</div>
							<div class="xiang">
								<div class="xianglabel"></div>
								<div class="xiangshort">
								</div>
							</div>
							<div class="xiang">
								<div class="xianglabel"></div>
								<div class="xiangshort"></div>
							</div>
						</div>

					</div>
					<div class="kuai">
						<div class="hang">
							<div class="xiang">
								<div class="xianglabel">
									客户号
								</div>
								<div class="xiangshort">
									<input id="selectCustId" name="custId" />
								</div>
							</div>
							<div class="xiang">
								<div class="xianglabel">						
								</div>
								<div class="xiangshort">									
								</div>
							</div>
							<div class="xiang">
								<div class="xianglabel">						
								</div>
								<div class="xiangshort">									
								</div>
							</div>
							<div class="xiang">
								<div class="xianglabel">						
								</div>
								<div class="xiangshort">									
								</div>
							</div>
							</div>
					<div class="hang">
							<div class="xiang">
								<div class="xianglabel">
									客户名
								</div>
								<div class="xiangshort">
									<input id="custName" class="easyui-textbox" name="custName" />
								</div>
							</div>
							<div class="xiang">
								<div class="xianglabel">
									联系电话
								</div>
								<div class="xiangshort">
									<input id="telphone" class="easyui-textbox" name="telphone" />
								</div>
							</div>
							<div class="xiang">
								<div class="xianglabel">
									邮箱
								</div>
								<div class="xiangshort">
									<input id="email" class="easyui-textbox" name="email" />
								</div>
							</div>
							<div class="xiang">
								<div class="xianglabel">						
								</div>
								<div class="xiangshort">									
								</div>
							</div>
						</div>
						<div class="hang">

							<div class="xiang">
								<div class="xianglabel">
									城市
								</div>
								<div class="xiangshort">
									<input id="city" class="easyui-textbox" name="city" />
								</div>
							</div>

							<div class="xiang">
								<div class="xianglabel">
									地址
								</div>
								<div class="xiangshort">
									<input id="address" class="easyui-textbox" name="address" />
								</div>
							</div>
							<div class="xiang">
								<div class="xianglabel">
									备注
								</div>
								<div class="xiangshort">
									<input id="remarks" class="easyui-textbox" name="remarks" />
								</div>
							</div>
							<div class="xiang">
								<div class="xianglabel"></div>
								<div class="xiangshort"></div>
							</div>

						</div>
					</div>


					<div>


					<div>						
						<input type="hidden" name="status" />
						<input type="hidden" name="id" />
					</div>

				</div>
	    
  		
    	<div id="win" data-options="collapsible:false,minimizable:false,maxmizable:true,modal:true" ></div> 
      </div>   
    	
   	</div>
    </form>
    
</body>
</html>
