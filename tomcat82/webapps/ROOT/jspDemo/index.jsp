<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage=""%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<% 	
	String serverName = request.getServerName();
	String appId = "100001";//������̻���
	String orderId = "Test"+System.currentTimeMillis();//�����̻���ˮ��
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��������ҳ</title>
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
<td width="120">֧�����ͣ�</td>
<td width="350">
<select name="payType" width="350">
<option value="wx">΢��֧��</option><!--��ѡ��ΪPC�˶�ά��ɨ��֧�����ֻ�WAP΢��֧��������ȡ����WAP����N��Y-->
<option value="zfb">֧����</option>
<option value="wxgzh">΢�Ź��ں�</option>
<option value="wxpc">΢��ɨ��</option>
</select>
</td>
</tr>
<tr>
<td>�̻���:</td>
<td><input width="350" type="text" name="appId" value="<%=appId%>"/></td>
</tr>
<tr>
<td>�̻���ˮ��:</td>
<td><input width="350" type="text"  name="orderId" value="<%=orderId%>" /></td>
</tr>
<tr>
<td>�������:</td>
<td><input width="350" type="text" name="price" value="0.01" /><span>����1��֧��</span> </td>
</tr>
<tr>
<td>��Ʒ����:</td>
<td><input width="350" type="text" name="desc" /></td>
</tr>
<tr>
<td>ǰ̨��ת��ַ:</td>
<td><input width="350" type="text" name="callBackUrl"  value="http://<%=serverName %>/paycenter/jspDemo/pageurl.jsp" />
<font color="red"><b>�˵�ַע����������ǿ��õ�֪ͨ��ַ</b></font>
</td> <!--ҳ����ת���ӵ��̻�ҳ���ַ-->
</tr>
<tr>
<td>�ײ���ʵ�ַ:</td>
<td><input width="350" type="text" name="notifyUrl"  value="http://<%=serverName %>/paycenter/jspDemo/returnurl.jsp" />
<font color="red"><b>�˵�ַע����������ǿ��õ�֪ͨ��ַ</b></font>
</td><!--֪ͨ�������ײ��ַ-->
</tr>
<tr>
</tr>
<tr>
<td colspan="2" align="center"><input type="button" name="button" value="�ύ" onClick="dosubmit()" /></td>
</tr>

</table>
</form>
</body>
</html>
