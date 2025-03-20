<%@page import="java.io.PrintWriter"%>
<%@page import="com.qlzf.commons.spring.SpringUtil"%>
<%@page import="com.jxt.paycenter.appclient.service.NotifyService"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
NotifyService notifyService = (NotifyService)SpringUtil.getBean("notifyService");

try {
	String result = notifyService.notify1(request, response);
	
	response.setContentType("text/html;charset=utf-8");
	
	
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