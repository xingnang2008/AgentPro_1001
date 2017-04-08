<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
   
    
	<%@include file="../head.jspf" %>
	 <link rel="stylesheet" href="<%=basePath%>css/PayRecord/PayRecord_updateInput.css" type="text/css" />
	 <script language="JavaScript" >
	 $(function(){
			var rows =parent.$("#payDg").datagrid("getSelections");
			$("#ff").form('load',{
				id:rows[0].id,
				orderId:rows[0].orderId,
				payId:rows[0].payId,				
				pics:rows[0].pics,
				payFee:rows[0].payFee,
				wwwadd:rows[0].wwwadd,
				info:rows[0].info,
				buyDate:rows[0].buyDate,
				expressFee:rows[0].expressFee,
				expressNo:rows[0].expressNo,
				expressCom:rows[0].expressCom,
				exSendDate:rows[0].exSendDate,
				exRecDate:rows[0].exRecDate,
				sendFee:rows[0].sendFee,
				sendNo:rows[0].sendNo,
				sendCom:rows[0].sendCom,
				sendDate:rows[0].sendDate,
				recDate:rows[0].recDate,
				comId:rows[0].comId,
				
				status:rows[0].status,
				infoes:rows[0].infoes,
				checkDate:rows[0].checkDate,
				checkInfo:rows[0].checkInfo,
								
				custId:rows[0].custId,
				
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
					    url:'<%=basePath%>admin/PayRecord/PayRecord-update.action',    
					    
					    success:function(){    
							//关闭当前窗体
							parent.$("#win").window("close");
							//重载dg
							parent.$("#payDg").datagrid("reload");				           
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
	<div >
    	<form id="ff" method="post">
   	<div class="container">
		<div id="top">
			<a id="btnSave" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
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
							<div class="xianglabel">邮费</div>
								<div class="xiangshort"><input id="expressFee" class="easyui-numberbox validatebox"
										required="required" precision="1" value="0" name="expressFee" /></div>
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
									<input id="selectComId" class="easyui-textbox" readonly="true" name="comId" />
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
									<input id="selectCustId" class="easyui-textbox" readonly="true" name="custId" />
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
						<input type="hidden" name="status" />
						<input type="hidden" name="exRecDate" />
						<!-- 验货信息 -->
						<input type="hidden" name="checkDate" />
						<input type="hidden" name="checkInfo" />
						<!-- 转运信息 -->
						<input type="hidden" name="sendNo" />
						<input type="hidden" name="sendDate" />
						<input type="hidden" name="sendFee" />
						<input type="hidden" name="recDate" />
						<input type="hidden" name="sendCom" />
						
						<!-- 快递信息 -->
						<input type="hidden"  name="expressNo" />
						<input type="hidden" name="sendDate" />
						<input type="hidden" name="exSendDate" />
						<input type="hidden"  name="expressCom" />
						<input type="hidden" name="exRecDate" />

						<input type="hidden"    name="id" />
					</div>

				</div>
	    
  		
    	<div id="win" data-options="collapsible:false,minimizable:false,maxmizable:true,modal:true" ></div> 
      </div>   
    	
   	
    </form>
    </div>
</body>
</html>
