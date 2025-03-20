<%@page import="java.io.PrintWriter"%>
<%@page import="com.qlzf.commons.spring.SpringUtil"%>
<%@page import="com.jxt.paycenter.appclient.service.NotifyService"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
NotifyService notifyService = (NotifyService)SpringUtil.getBean("notifyService");

try {

	request.setCharacterEncoding("utf-8");

	String result = notifyService.notify(request, response);
	
	response.setContentType("application/json");

	String callback = request.getParameter("jsoncallback");
	
	String ret = "";
	
	if(callback != null && callback.length() > 0){
		ret = callback+"("+result+")";
	}else{
		ret = result;
	}
	out.print(ret);
}catch (Exception e) {
	e.printStackTrace();
}
%>