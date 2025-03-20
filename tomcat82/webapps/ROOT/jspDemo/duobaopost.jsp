<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@include file="md5.jsp"%>
<%  
	String serverName = request.getServerName();
	String appId = "100002";//商户号
	String payType = request.getParameter("payType");//支付方式
	String orderId = request.getParameter("orderId");//商户流水号或订单号
	double price = Double.parseDouble(request.getParameter("price"));//订单金额
	String desc = request.getParameter("desc");//商品名称
	
	String callBackUrl = request.getParameter("callBackUrl");//通知商户页面端地址
	callBackUrl = callBackUrl.replace("&","%26");
	
	String notifyUrl = request.getParameter("notifyUrl");//服务器底层通知地址
	if(notifyUrl == null || notifyUrl.length() == 0){
		notifyUrl = "http://115.28.52.43:9020/pay/synch/netpay/jxtPayNotify.do";
	}
	
	String appKey = "9205FB8024659A4E3B61F36CE61DA8B4";///////////商户密钥（KEY）(注意更改)
	
	String md5 =new String(appId+orderId+payType+price+appKey);//MD5签名格式
	System.out.println(md5);
	
	String sign = MD5Encode(md5,"utf-8").toLowerCase();//计算MD5值
	
	String payUrl="http://"+serverName+"/paycenter/appclient/getUrl.do";//API收银台支付Post请求地址
	
	response.sendRedirect(payUrl+"?appId="+appId+"&orderId="+orderId+"&payType="+payType+"&price="+price+"&desc="+desc+"&callBackUrl="+callBackUrl+"&notifyUrl="+notifyUrl+"&sign="+sign);
 %>