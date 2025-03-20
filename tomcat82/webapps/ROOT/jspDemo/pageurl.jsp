<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@include file="md5.jsp"%>
<%  
	String appId = request.getParameter("appId");//商户号
	String orderId = request.getParameter("orderId");//商户流水号
	String payType = request.getParameter("payType");
	double price = Double.parseDouble(request.getParameter("price"));//实际成功金额
	String status = request.getParameter("status");//支付结果
	String msg = request.getParameter("ResultDesc");//支付结果描述
	
	String sign = request.getParameter("sign");//MD5签名
	
	String appKey = "9d85e686031b1c1ae4f13ae22b3cb36f";///////////商户密钥（KEY）(注意更改)
	
	String md5 = appId+orderId+payType+price+appKey;
	
	String WaitSign = MD5Encode(md5,"utf-8").toLowerCase();		
	
	boolean succ = false;
	
	if(WaitSign.compareTo(sign)==0){
		if("1".equals(status)){
			succ = true;
			msg = "支付成功";
		}else{
			succ = false;
			msg = "支付失败";
		}
	}else{
		msg = "签名不正确";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- TemplateBeginEditable name="doctitle" -->
<title>充值接口-商户前台通知充值结果</title>
<!-- TemplateEndEditable -->
<!-- TemplateBeginEditable name="head" -->
<!-- TemplateEndEditable -->
</head>

<body>
<form id="form1" method="get" name="form1">
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="30" align="center">
				<h1>
					※ 在线支付完成 ※
				</h1>
			</td>
		</tr>
	</table>
	<table bordercolor="#cccccc" cellspacing="5" cellpadding="0" width="400" align="center"
		border="0">		
		<tr>
			<td class="text_12" bordercolor="#ffffff" align="right" width="150" height="20">
				订单号：</td>
			<td class="text_12" bordercolor="#ffffff" align="left">
			<input  name='orderId' value= "<%=orderId%>" />
				</td>
		</tr>
		<tr>
			<td class="text_12" bordercolor="#ffffff" align="right" width="150" height="20">
				支付结果描述：</td>
			<td class="text_12" bordercolor="#ffffff" align="left">
			<input  name='msg' value= "<%=msg%>"/>
				</td>
		</tr>
		<tr>
			<td class="text_12" bordercolor="#ffffff" align="right" width="150" height="20">
				实际成功金额：</td>
			<td class="text_12" bordercolor="#ffffff" align="left">
			<input  name='price'  value= "<%=price%>"/>
				</td>
		</tr>		
		
	</table> 
</form>
</body>
</html>