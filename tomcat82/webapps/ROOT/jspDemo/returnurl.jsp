<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@include file="md5.jsp"%>
<%  
	String appId = request.getParameter("appId");//商户号
	String orderId = request.getParameter("orderId");//商户流水号
	String payType = request.getParameter("payType");
	double price = Double.parseDouble(request.getParameter("price"));//实际成功金额
	String status = request.getParameter("status");//支付结果
	String msg = request.getParameter("ResultDesc");//支付结果描述
	
	String outTradeNo = request.getParameter("outTradeNo");
	
	String sign = request.getParameter("sign");//MD5签名
	
	String appKey = "9d85e686031b1c1ae4f13ae22b3cb36f";///////////商户密钥（KEY）(注意更改)
	
	String md5 = appId+orderId+payType+price+appKey;
	
	String WaitSign = MD5Encode(md5,"utf-8").toLowerCase();	
	
	if(WaitSign.compareTo(sign)==0){
		System.out.println("OK");
		//校验通过开始处理订单		
		out.println("true");//全部正确了开始处理您的逻辑		
	}else{
		System.out.println("Md5CheckFail");
		out.println("Md5CheckFail'");//MD5校验失败
	}
%>