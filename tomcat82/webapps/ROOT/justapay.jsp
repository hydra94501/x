<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<html>
<head>
    <title>client</title></head>
<body onload="document.my_form.submit()">
<form method="post" name="my_form" action="https://paydesk.justapay.com/payment/gateway/v1/initialrequest">
    <input type="hidden" name="clientId" value="<%=request.getParameter("clientId")%>">
    <input type="hidden" name="encrypt" value="<%=request.getParameter("encrypt")%>">
    </td></tr>
    <tr>
        <td valign="top">
            <input type="submit" style="display:none">
</form>
</body>
</html>