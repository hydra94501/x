<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.qlzf.commons.spring.SpringUtil"%>
<%@page import="org.json.JSONException"%>
<%@page import="com.jxt.paycenter.appclient.obj.WithdrawResult"%>
<%@page import="com.jxt.paycenter.appclient.obj.WithdrawResultExt"%>
<%@page import="com.jxt.paycenter.appclient.utils.Md5Util"%>
<%@page import="com.jxt.paycenter.handler.WithdrawLogHandler"%>
<%@page import="com.jxt.paycenter.helper.CpInfoHelper"%>
<%@page import="com.jxt.paycenter.pojo.CpInfo"%>
<%@page import="com.jxt.paycenter.pojo.WithdrawLog"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
WithdrawLogHandler withdrawLogHandler = (WithdrawLogHandler)SpringUtil.getBean("withdrawLogHandler");

CpInfoHelper cpInfoHelper = (CpInfoHelper)SpringUtil.getBean("cpInfoHelper");

String orderId = request.getParameter("out_trade_no");
int appId = Integer.parseInt(request.getParameter("appId")); 
String sign = request.getParameter("sign");

WithdrawResult result = new WithdrawResult();

CpInfo cpInfo = cpInfoHelper.getCpInfo(appId);

if(cpInfo == null) {
	result.setMsg("invalid appId");
}else {
	String appKey = cpInfo.getKey();
	
	StringBuffer sb = new StringBuffer();
	sb.append("appId=").append(appId).append("&out_trade_no=").append(orderId).append("&key=").append(appKey);
	String md5Src = sb.toString();
	String md5Ret = Md5Util.MD5Encode(md5Src, "utf-8");
	
	if(md5Ret.equalsIgnoreCase(sign)) {
		WithdrawLog withdrawLog = withdrawLogHandler.selectByApp(appId, orderId);
		
		try {
			if(withdrawLog != null){
				int status = withdrawLog.getStatus() > -3 ?withdrawLog.getStatus() :-2  ;
				String msg = (status ==2?"success":(status ==-2?"failed":"pending"));
				result = new WithdrawResult(status, msg, new WithdrawResultExt(withdrawLog.getId()+"", withdrawLog.getOrderId(), withdrawLog.getAmount(), withdrawLog.getPlatformFee()));
				
			}else{
				result.setMsg("invalid out_trade_no");
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}else {
		result.setMsg("invalid sign");
	}			
}

try {
	JSONObject retJo = result.toJSON();
	
	response.setContentType("text/html;charset=utf-8");
	
	String callback = request.getParameter("jsoncallback");
	
	String ret = "";
	
	if(callback != null && callback.length() > 0){
		ret = callback+"("+retJo.toString()+")";
	}else{
		ret = retJo.toString();
	}
	out.print(ret);
}catch (Exception e) {
	e.printStackTrace();
}

%>