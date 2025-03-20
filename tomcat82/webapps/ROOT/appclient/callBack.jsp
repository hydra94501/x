<%@page import="com.jxt.paycenter.appclient.utils.Md5Util"%>
<%@page import="com.jxt.paycenter.appclient.utils.CommonUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.jxt.paycenter.helper.CpInfoHelper"%>
<%@page import="com.jxt.paycenter.pojo.CpInfo"%>
<%@page import="com.jxt.paycenter.appclient.action.CallBackAction"%>
<%@page import="org.apache.log4j.Logger"%>
<%@page import="com.jxt.paycenter.appclient.obj.CallBackResult"%>
<%@page import="com.jxt.paycenter.appclient.service.PayFactory"%>
<%@page import="com.jxt.paycenter.appclient.service.IPay"%>
<%@page import="com.jxt.paycenter.helper.PayTypeHelper"%>
<%@page import="com.jxt.paycenter.pojo.PayType"%>
<%@page import="com.qlzf.commons.spring.SpringUtil"%>
<%@page import="com.jxt.paycenter.handler.PayLogHandler"%>
<%@page import="com.jxt.paycenter.pojo.PayLog"%>
<%@page import="com.jxt.paycenter.appclient.utils.HttpUtil"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
PayLogHandler payLogHandler = (PayLogHandler)SpringUtil.getBean("payLogHandler");
PayTypeHelper payTypeHelper = (PayTypeHelper)SpringUtil.getBean("payTypeHelper");
PayFactory payFactory = (PayFactory)SpringUtil.getBean("payFactory");
CpInfoHelper cpInfoHelper = (CpInfoHelper)SpringUtil.getBean("cpInfoHelper");
Logger logger = Logger.getLogger("com.jxt.paycenter.appclient.action.CallBackAction"); 


Long tradeNo = Long.parseLong(request.getParameter("_payLogId"));

PayLog payLog = payLogHandler.select(tradeNo);

PayType payType = payTypeHelper.getPayType(payLog.getPayTypeId());

IPay pay = payFactory.getPay(payType.getName(), payType.getParams());

CallBackResult callBackResult = pay.callBack(request, response);

logger.info(callBackResult);

CpInfo cpInfo = cpInfoHelper.getCpInfo(payLog.getAppId());

String appKey = cpInfo.getKey();

try {
	
	Map<String , String> map = new HashMap<String, String>();
    map.put("code", payLog.getStatus() == 1 || callBackResult == null || callBackResult.isSucc()?"0":"-1");
    map.put("msg", callBackResult.getMsg());
    map.put("order_no", ""+tradeNo);
    map.put("out_trade_no", payLog.getOrderId());
    map.put("appid", cpInfo.getAppId()+"");
    map.put("type", payLog.getType()+"");
    map.put("amount", payLog.getAmount()+"");
    map.put("fee", payLog.getPlatformFee()+"");
    map.put("currency", payLog.getCurrency());
    
    String signStr = "";
    
    try {
        signStr = CommonUtil.FormatBizQueryParaMap(map, false);
    } catch (Exception e) {
        e.printStackTrace();
    }

    String sign = Md5Util.md532(signStr + "&key=" + appKey);
	
    map.put("sign", sign);
	
	String url = HttpUtil.getUrl(payLog.getCallbackUrl(),CommonUtil.FormatBizQueryParaMapObj(map, false));
	
	logger.info("callback redirect url :"+url);
	
	response.sendRedirect(url);
	
	return;
} catch (Exception e) {
	e.printStackTrace();
}
%>