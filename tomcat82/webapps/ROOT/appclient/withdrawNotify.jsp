<%@page import="com.jxt.paycenter.appclient.action.WithdrawNotifyAction"%>
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
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
WithdrawLogHandler withdrawLogHandler = (WithdrawLogHandler)SpringUtil.getBean("withdrawLogHandler");
WithdrawFactory withdrawFactory = (WithdrawFactory)SpringUtil.getBean("withdrawFactory");
WithdrawTypeHelper withdrawTypeHelper = (WithdrawTypeHelper)SpringUtil.getBean("withdrawTypeHelper");
CpService cpService = (CpService)SpringUtil.getBean("cpService");

IWithdraw withdraw = null;

Logger logger = Logger.getLogger("com.jxt.paycenter.appclient.action.WithdrawNotifyAction");

Boolean succ = false;

Long traderNo = Long.parseLong(request.getParameter("_withdrawLogId"));

logger.info("start to notify : "+traderNo);

WithdrawLog withdrawLog = withdrawLogHandler.select(traderNo);
//int oldStatus = withdrawLog.getStatus();

WithdrawType withdrawType = withdrawTypeHelper.getWithdrawType(withdrawLog.getWithdrawTypeId());

withdraw = withdrawFactory.getWithdraw(withdrawType.getName(), withdrawType.getParams());

NotifyParam notifyParam = withdraw.notify(request, response);

if(notifyParam != null) {
	if(notifyParam.isSucc()){
		int status = withdrawLog.getStatus();

		withdrawLog.setNotifyData(notifyParam.getNotifyData());
		withdrawLog.setWithdrawDay(CommonUtil.getDay());
		withdrawLog.setWithdrawTime(notifyParam.getPaymentTime());
		withdrawLog.setStatus(notifyParam.getStatus()==1?2:notifyParam.getStatus());
		withdrawLog.setTransactionNum(notifyParam.getTransactionNumber()+"");


		if(notifyParam.getStatus() == 1) {
			if(withdrawLogHandler.updateSucc(withdrawLog) == 1) {
//					cpService.addWithdraw(withdrawLog);
			}
		}else if(notifyParam.getStatus() == -1){

			// 先判断原订单状态，如果原订单已经被回调成成功，再次接收到失败的回调数据时，改变订单状态为失败重试
			if (status == 2) {
				withdrawLogHandler.updateStatusChangeSuccToFailed(withdrawLog);
				logger.info("withdraw notify again : withdrawLog is  " + withdrawLog.getId());
			} else if (status == 1) {
				withdrawLog.setStatus(-1);
				withdrawLogHandler.updateStatus(withdrawLog);
			}
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
}

%>