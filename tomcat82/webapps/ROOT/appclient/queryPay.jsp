<%@page import="com.qlzf.commons.spring.SpringUtil"%>
<%@page import="java.io.IOException"%>
<%@page import="org.json.JSONException"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.jxt.paycenter.appclient.utils.Md5Util"%>
<%@page import="com.jxt.paycenter.handler.PayLogHandler"%>
<%@page import="com.jxt.paycenter.helper.CpInfoHelper"%>
<%@page import="com.jxt.paycenter.pojo.CpInfo"%>
<%@page import="com.jxt.paycenter.pojo.PayLog"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
PayLogHandler payLogHandler = (PayLogHandler)SpringUtil.getBean("payLogHandler");
CpInfoHelper cpInfoHelper = (CpInfoHelper)SpringUtil.getBean("cpInfoHelper");

String orderId = request.getParameter("orderId");
int appId = Integer.parseInt(request.getParameter("appId")); 
String sign = request.getParameter("sign");

JSONObject jo = new JSONObject();
jo.put("orderId", orderId);

CpInfo cpInfo = cpInfoHelper.getCpInfo(appId);

if(cpInfo == null) {
	jo.put("status", "4");//not find cpinfo
}else {
	String appKey = cpInfo.getKey();
	
	StringBuffer sb = new StringBuffer();
	sb.append("appId=").append(appId).append("&orderId=").append(orderId).append("&key=").append(appKey);
	String md5Src = sb.toString();
	String md5Ret = Md5Util.MD5Encode(md5Src, "utf-8");
	
	if(md5Ret.equalsIgnoreCase(sign)) {
		PayLog payLog = payLogHandler.selectByApp(appId, orderId);
		
		try {
			if(payLog != null){
				int status = payLog.getStatus();
				
				jo.put("status", status);
				
			}else{
				jo.put("status", "3");//not find payLog
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}else {
		jo.put("status", "4");
	}			
}

try {
	response.setContentType("text/html;charset=utf-8");
	
	String ret = jo.toString();
	
	out.print(ret);
} catch (IOException e) {
	e.printStackTrace();
}
%>