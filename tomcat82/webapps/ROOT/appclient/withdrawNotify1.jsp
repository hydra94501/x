<%@page import="com.jxt.paycenter.appclient.action.WithdrawNotify1Action"%>
<%@page import="com.qlzf.commons.spring.SpringUtil"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.apache.log4j.Logger"%>
<%@page import="com.jxt.paycenter.appclient.obj.NotifyParam"%>
<%@page import="com.jxt.paycenter.appclient.service.CpService"%>
<%@page import="com.jxt.paycenter.appclient.service.IWithdraw"%>
<%@page import="com.jxt.paycenter.appclient.service.WithdrawFactory"%>
<%@page import="com.jxt.paycenter.appclient.utils.CommonUtil"%>
<%@page import="com.jxt.paycenter.handler.WithdrawLogHandler"%>
<%@page import="com.jxt.paycenter.helper.WithdrawTypeHelper"%>
<%@page import="com.jxt.paycenter.pojo.WithdrawLog"%>
<%@page import="com.jxt.paycenter.pojo.WithdrawType"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
WithdrawLogHandler withdrawLogHandler = (WithdrawLogHandler)SpringUtil.getBean("withdrawLogHandler");
WithdrawFactory withdrawFactory = (WithdrawFactory)SpringUtil.getBean("withdrawFactory");
WithdrawTypeHelper withdrawTypeHelper = (WithdrawTypeHelper)SpringUtil.getBean("withdrawTypeHelper");
CpService cpService = (CpService)SpringUtil.getBean("cpService");
Logger logger = Logger.getLogger("com.jxt.paycenter.appclient.action.WithdrawNotify1Action");
IWithdraw withdraw = null;


Boolean succ = false;

String withdrawName = request.getParameter("_withdrawName");
logger.info("start to notify : "+withdrawName);



WithdrawType withdrawType = withdrawTypeHelper.getWithdrawType(withdrawName);

withdraw = withdrawFactory.getWithdraw(withdrawType.getName(), withdrawType.getParams());

NotifyParam notifyParam = withdraw.notify(request, response);
if(notifyParam.isSucc()){
	WithdrawLog withdrawLog = withdrawLogHandler.select(notifyParam.getPaymentLogId());
	withdrawLog.setNotifyData(notifyParam.getNotifyData());
	withdrawLog.setWithdrawDay(CommonUtil.getDay());
	withdrawLog.setWithdrawTime(notifyParam.getPaymentTime());
	withdrawLog.setStatus(notifyParam.getStatus()==1?2:notifyParam.getStatus());
	withdrawLog.setTransactionNum(notifyParam.getTransactionNumber()+"");
	
	if(notifyParam.getStatus() == 1) {
		if(withdrawLogHandler.updateSucc(withdrawLog) == 1) {
//			cpService.addWithdraw(withdrawLog);
		}
	}else if(notifyParam.getStatus() == -1){
		withdrawLog.setStatus(-1);
		withdrawLogHandler.updateStatus(withdrawLog);
	}
	
	succ = true;
}

String result = withdraw.getNotifyMsg(succ);

try {
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