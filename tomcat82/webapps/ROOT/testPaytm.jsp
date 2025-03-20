<%@page import="org.json.JSONObject"%>
<%@page import="java.util.Random"%>
<%@page import="com.jxt.paycenter.appclient.utils.HttpClientUtils"%>
<%@page import="com.jxt.paycenter.appclient.service.impl.PaytmPay"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%
    String url = "https://geepay.site/appclient/getUrl.do?appid=10000&out_trade_no=test"+new Random().nextInt(1000000)+"&amount=1000&callback_url=https://www.google.com&notify_url=https://www.google.com&sign=6206EDF33731B9DA06C138EE29C8A244&type=1&payTypeId=103&version=v1.0&currency=INR";
    
    HttpClientUtils utils = new HttpClientUtils(url, "get", null, null, null, null);
    
    String resp = utils.send();
    
    JSONObject jo = new JSONObject(resp);
    
    String redirect = jo.getJSONObject("data").getString("url");
    
    response.sendRedirect(redirect);
%>