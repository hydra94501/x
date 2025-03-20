<%@page import="java.io.PrintWriter"%>
<%@page import="com.qlzf.commons.spring.SpringUtil"%>
<%@page import="org.json.JSONObject"%>

<%@page import="com.jxt.paycenter.appclient.utils.CommonUtil"%>
<%@page import="com.jxt.paycenter.appclient.utils.Md5Util"%>
<%@page import="com.jxt.paycenter.helper.CpInfoHelper"%>
<%@page import="com.jxt.paycenter.helper.PayTypeHelper"%>
<%@page import="com.jxt.paycenter.helper.PayTypeHelper.ValidTypeObj"%>
<%@page import="com.jxt.paycenter.helper.WithdrawTypeHelper"%>
<%@page import="com.jxt.paycenter.pojo.CpInfo"%>
<%@page import="org.apache.log4j.Logger"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
CpInfoHelper cpInfoHelper = (CpInfoHelper)SpringUtil.getBean("cpInfoHelper");

PayTypeHelper payTypeHelper = (PayTypeHelper)SpringUtil.getBean("payTypeHelper");

WithdrawTypeHelper withdrawTypeHelper = (WithdrawTypeHelper)SpringUtil.getBean("withdrawTypeHelper");

JSONObject jo = new JSONObject();

jo.put("code", -1);

Map<String, String> map = CommonUtil.requestToMapString(request);

int appId = Integer.parseInt(map.get("appid"));

CpInfo cpInfo = cpInfoHelper. getCpInfo(appId);

if(cpInfo != null) {
	String key = cpInfo.getKey();
	
	String sign = map.remove("sign");
	
	try {
		String signSrc = CommonUtil.FormatBizQueryParaMap(map, false)+"&key="+key;
	
		String signRet = Md5Util.md532(signSrc);
		
		if(sign.equalsIgnoreCase(signRet)) {
			jo.put("code", 0);
			jo.put("msg", "succ");
			
			JSONArray data = new JSONArray();
			
			String channel_type = map.get("channel_type");
			
			String currency = map.get("currency");
			Long[] range = null;
			
			if("1".equals(channel_type)) {
				for(int i = 1; i <= 3; i ++) {
					ValidTypeObj obj = payTypeHelper.getValidTypeObj(currency, i);
					if(obj != null) {
						data.put(obj.toJSON());
					}
				}
				
				jo.put("data", data);
			}else {
				range = withdrawTypeHelper.getRange(currency);
				
				if(range != null) {
					for(int i = 1; i <= 3; i ++) {
						JSONObject jj = new JSONObject();
						jj.put("type", i);
						jj.put("range", range[0]+"-"+range[1]);
						data.put(jj);
					}
					
					jo.put("data", data);
				}else {
					jo.put("msg", "data error");
				}
			}
			
			
		}else {
			jo.put("msg", "sign error");
		}
	}catch (Exception e) {
		jo.put("msg", "sign error");
	}
}else {
	jo.put("msg", "invalid appid");
}

try {
	response.setContentType("text/html;charset=utf-8");
	
	
	String callback = request.getParameter("jsoncallback");
	
	String ret = "";
	
	if(callback != null && callback.length() > 0){
		ret = callback+"("+jo.toString()+")";
	}else{
		ret = jo.toString();
	}
	out.print(ret);
}catch (Exception e) {
	e.printStackTrace();
}
%>