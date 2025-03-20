<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage=""%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<% 	
	String serverName = request.getServerName();
	String appId = "100001";//分配的商户号
	String orderId = "Test"+System.currentTimeMillis();//生成商户流水号
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>数据输入页</title>
<SCRIPT LANGUAGE="JavaScript">
    function dosubmit(){
       form1.action = "post.jsp";
       document.form1.submit();
    }
</SCRIPT>
</head>

<body>
<form method="post" name="form1" id="form1" >
<table>
<tr>
<td width="120">支付类型：</td>
<td width="350">
<select name="payType" width="350">
<option value="wx">微信支付</option><!--此选项为PC端二维码扫码支付和手机WAP微信支付，方向取决于WAP参数N或Y-->
<option value="zfb">支付宝</option>
<option value="wxgzh">微信公众号</option>
<option value="wxpc">微信扫码</option>
</select>
</td>
</tr>
<tr>
<td>商户号:</td>
<td><input width="350" type="text" name="appId" value="<%=appId%>"/></td>
</tr>
<tr>
<td>商户流水号:</td>
<td><input width="350" type="text"  name="orderId" value="<%=orderId%>" /></td>
</tr>
<tr>
<td>订单金额:</td>
<td><input width="350" type="text" name="price" value="0.01" /><span>建议1角支付</span> </td>
</tr>
<tr>
<td>商品名称:</td>
<td><input width="350" type="text" name="desc" /></td>
</tr>
<tr>
<td>前台跳转地址:</td>
<td><input width="350" type="text" name="callBackUrl"  value="http://<%=serverName %>/paycenter/jspDemo/pageurl.jsp" />
<font color="red"><b>此地址注意更换成你们可用的通知地址</b></font>
</td> <!--页面跳转连接的商户页面地址-->
</tr>
<tr>
<td>底层访问地址:</td>
<td><input width="350" type="text" name="notifyUrl"  value="http://<%=serverName %>/paycenter/jspDemo/returnurl.jsp" />
<font color="red"><b>此地址注意更换成你们可用的通知地址</b></font>
</td><!--通知服务器底层地址-->
</tr>
<tr>
</tr>
<tr>
<td colspan="2" align="center"><input type="button" name="button" value="提交" onClick="dosubmit()" /></td>
</tr>

</table>
</form>
</body>
</html>
