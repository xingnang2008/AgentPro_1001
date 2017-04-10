<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<%@include file="../head.jspf"%>

		<title>My JSP 'Rebategoods_saveInput.jsp' starting page</title>
		<link rel="stylesheet"
			href="<%=basePath%>css/PayRecord/PayRecord_saveInput.css"
			type="text/css" />
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript">
		$(function(){
			//窗体弹出时默认禁用验证
			$("#ff").form("disableValidation");

			$("#payId").validatebox({
				  prompt:'订单号重复,请确认输入是否正确',
				  required:true,
				  invalidMessage:'此链接号已经存在！',
				  validType:'remote["PayRecord-findExist.action","payId"]'
				});
			
			$("#btnSave").click(function(){
				//开启验证
				$("#ff").form("enableValidation");
				//如果验证成功，则提交数据
				if($("#ff").form("validate")){
					//提交数据
					$('#ff').form('submit', {    
					    url:'PayRecord-save.action',    
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

	<div class="container">
		<form id="ff" method="post">
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
									<input id="buyDate" type="text" class="easyui-datebox"
										name="buyDate" />
								</div>
							</div>

							<div class="xiang">
								<div class="xianglabel">
									链接号
								</div>
								<div class="xiangshort">
									<input id="payId" name="payId"
										class="easyui-validatebox textbox"
										style="width: 180px; height: 25px;" />
								</div>
							</div>
							<div class="xiang">
								<div class="xianglabel"></div>
								<div class="xiangshort"></div>
							</div>
							</div>
							<div class="hang">
							
							<div class="xiang">
								<div class="xianglabel">
									数量
								</div>
								<div class="xiangshort">
									<input id="pics" class="easyui-numberbox validatebox"
										required="required" value="0" name="pics">
								</div>
							</div>
							<div class="xiang">
								<div class="xianglabel">
									金额
								</div>
								<div class="xiangshort">
									<input id="payFee" class="easyui-numberbox validatebox"
										required="required" precision="2" value="0" name="payFee" />

								</div>
							</div>
							<div class="xiang">
								<div class="xianglabel">邮费</div>
								<div class="xiangshort"><input id="expressFee" class="easyui-numberbox validatebox"
										required="required" precision="1" value="0" name="expressFee" /></div>
							</div>
							<div class="xiang">
								<div class="xianglabel"></div>
								<div class="xiangshort"></div>
							</div>
						</div>
						<div class="hang">
							<div style="width: 800px; float: left;">
								<div class="xianglabel">
									网址
								</div>
								<div style="width: 610px; float: left">
									<input type="text" class="easyui-textbox" multiline="false"
										value="" style="width: 600px; height: 25px" name="wwwadd" />
								</div>
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
									<input id="comId" class="easyui-textbox" readonly="true" name="comId" />
								</div>
							</div>
							<div class="xiang">
								<div class="xianglabel">
									
								</div>
								<div class="xiangshort">
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
									<input id="custId" class="easyui-textbox" readonly="true" name="custId" />
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
					


					<div>
						<input type="hidden" name="infoes" />
						<input type="hidden" value="1" name="status" />
						<!-- 验货信息 -->
						<input type="hidden" name="checkDate" />
						<input type="hidden" value="" name="checkInfo" />
						<!-- 转运信息 -->
						<input type="hidden" value="-" name="sendNo" />
						<input type="hidden" name="sendDate" />
						<input type="hidden" value="0" name="sendFee" />
						<input type="hidden" name="recDate" />
						<input type="hidden" value="-" name="sendCom" />
						<!-- 快递信息 -->
						<input type="hidden" value="-" name="expressNo" />
						<input type="hidden" name="exSendDate" />
						<input type="hidden" value="-" name="expressCom" />
						<input type="hidden" name="exRecDate" />	
					</div>

				</div>


				

		</form>
	</div>
	</body>
</html>
