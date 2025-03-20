<%@page import="java.io.PrintWriter"%>
<%@page import="com.jxt.paycenter.appclient.action.WithdrawAction"%>
<%@page import="com.qlzf.commons.spring.SpringUtil"%>
<%@page import="org.apache.log4j.Logger"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.jxt.paycenter.appclient.obj.WithdrawResult"%>
<%@page import="com.jxt.paycenter.appclient.service.WithdrawService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
WithdrawService withdrawService = (WithdrawService)SpringUtil.getBean("withdrawService");

Logger logger = Logger.getLogger("com.jxt.paycenter.appclient.action.WithdrawAction");

request.setCharacterEncoding("utf-8");

WithdrawResult result = withdrawService.withdraw(request, response);

JSONObject jo = result.toJSON();

String result1 = jo.toString();

logger.info("execute ret : "+result1);

try {
	response.setContentType("text/html;charset=utf-8");
	
	String callback = request.getParameter("jsoncallback");
	
	String ret = "";
	
	if(callback != null && callback.length() > 0){
		ret = callback+"("+result1+")";
	}else{
		ret = result1;
	}
	out.print(ret);
}catch (Exception e) {
	e.printStackTrace();
}
%>