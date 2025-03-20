<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<html>
<head>
   <title>GeePay order</title> 
</head>
<body>
	<center> 
		<h1>Please do not refresh this page...</h1>
	</center> 
<form name="paytm" action="https://securegw.paytm.in/theia/api/v1/showPaymentPage?mid=<%=request.getParameter("appId")%>&orderId=<%=request.getParameter("orderId")%>" method="post">
	<table border="1"> 
		<tbody> 
		    <input type="hidden" name="mid" value="<%=request.getParameter("appId")%>" />
		    <input type="hidden" name="orderId" value="<%=request.getParameter("orderId")%>" />
		    <input type="hidden" name="txnToken" value="<%=request.getParameter("param")%>" />
    	</tbody> 
	</table>
</form>
<script language="javascript">
    document.paytm.submit();
</script>
</body>
</html>