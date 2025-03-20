<%@page import="com.qlzf.commons.spring.SpringUtil"%>
<%@page import="com.jxt.paycenter.appclient.service.PayService"%>
<%@page import="java.io.PrintWriter"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
PayService payService = (PayService)SpringUtil.getBean("payService");

try {

	String url = payService.testGetUrl(request, response);

	response.setContentType("text/html;charset=utf-8");
	response.setHeader("Access-Control-Allow-Origin", "*");
	if (!"".equals(url)) {
		out.print(url);
	}

}catch(Exception e) {
	e.printStackTrace();
}
%>