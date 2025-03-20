<%@page import="java.io.PrintWriter"%>
<%@page import="com.jxt.paycenter.appclient.action.GetUrlAction"%>
<%@page import="org.apache.log4j.Logger"%>
<%@page import="com.qlzf.commons.spring.SpringUtil"%>
<%@page import="com.jxt.paycenter.appclient.service.PayService"%>
<%@page import="com.jxt.paycenter.appclient.obj.UrlResult"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
Logger logger = Logger.getLogger("com.jxt.paycenter.appclient.action.GetUrlAction");

PayService payService = (PayService)SpringUtil.getBean("payService");

UrlResult urlResult = payService.getUrl(request, response);

logger.info("url:"+(urlResult.getCode()==0?urlResult.getData().getUrl():""));

try {
	String redirect = request.getParameter("redirect");
	
	if(redirect != null && "1".equals(redirect)) {
		if(urlResult.getCode() == 0) {
			response.sendRedirect(urlResult.getData().getUrl());
			return;
		}
	}else {
		response.setContentType("text/html;charset=utf-8");

		out.println(urlResult.toJson().toString());
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>