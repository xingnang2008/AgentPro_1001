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
				  invalidMessage:'此订单号已经存在！',
				  validType:'remote["PayRecord-findExist.action","payId"]'
				});
			
			$("#btnSave").click(function(){
				//开启验证
				$("#ff").form("enableValidation");
				//如果验证成功，则提交数据
				if($("#ff").form("validate")){
					//提交数据
					$('#ff').form('submit', {    
					    url:'<%=basePath%>admin/PayRecord/PayRecord-save.action',    
					    success:function(){    
							//关闭当前窗体
							parent.$("#win").window("close");
							//重载dg
							parent.$("#dg").datagrid("reload");				           
					    }    
					});  
					
				}
			});
			//客户选取
			$("#selectCustId").combobox({
				url:'<%=basePath%>admin/Customer/Customer-listAll.action',
				editable:false,
				valueField:'custId',
				textField:'custId',
				panelHeight:200,
				panelWidth:120,
				width:120,
				onSelect: function(rec){    				
	             $('#custNm').textbox('setValue', rec.custName); 
	             $('#telphone').textbox('setValue', rec.telphone);
	             $('#address').textbox('setValue', rec.address);
	             $('#email').textbox('setValue', rec.email);
	             $('#city').textbox('setValue', rec.city);
	             $('#remarks').textbox('setValue', rec.remarks);
	            
        	}  
			});
			//公司选取
			$("#selectComId").combobox({
				url:'<%=basePath%>admin/Company/Company-listAll.action',
				editable:true,
				valueField:'comId',
				textField:'comId',
				panelHeight:200,
				panelWidth:120,
				width:120,
				onSelect: function(rec){    				
	             $('#comName').textbox('setValue', rec.company); 
	            
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
									<input id="payId" name="payId"
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
								<div class="xianglabel"></div>
								<div class="xiangshort"></div>
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
									<input id="custNm" class="easyui-textbox" name="custName" />
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
						<input type="hidden" name="infoes" />
						<input type="hidden" value="0" name="status" />
						<input type="hidden" name="exRecDate" />
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
						<input type="hidden" name="sendDate" />
						<input type="hidden" value="0.00" name="expressFee" />
						<input type="hidden" name="exSendDate" />
						<input type="hidden" value="-" name="expressCom" />
						<input type="hidden" name="exRecDate" />	
					</div>

				</div>


				<div id="win"
					data-options="collapsible:false,minimizable:false,maxmizable:true,modal:true"></div>
			</div>


		</form>
	</body>
</html>
