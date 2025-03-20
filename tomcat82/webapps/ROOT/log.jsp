<%@page import="com.jxt.paycenter.appclient.service.impl.PaytmPay"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%
    PaytmPay.getLogger().info("paytmlog_"+request.getParameter("param"));
%>