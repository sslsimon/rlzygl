

<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<!-- #include file="BGMConn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���ʲ�ѯ -- ��л���ĸ�������������</title>
<link href="Css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body,td,th {
	font-family: ����;
	font-size: 12px;
	color: #000000;
}
-->
</style></head>
<script language="javascript">
<!--
function CheckForm()
{
	if(document.form1.select.value=="0")
	{
		alert("�������ѯʱ�䣡");
		document.form1.select.focus();
		return false;
	}
	
	

	
	}



-->
</script>
<body>
<%
 
  sql="select top 1 * from jhgz where  id="&request("ID")
  set rs=server.CreateObject("adodb.recordset")
  
  rs.open sql,conn,1,1
  
  if rs.bof and rs.eof then
  response.write "<script>alert('û����Ĺ��ʵ���');location.href='gzmanage.asp';</script>"
  else 
 %>
<p align="center">&nbsp;&nbsp;&nbsp;&nbsp; ������<%= rs("name")%>
&nbsp;&nbsp;&nbsp;����Ϊ��&nbsp;<%= rs("time")%>&nbsp;���ʵ�&nbsp;<a href="javascript:window.print();">��ӡ���ʵ�</a> 
&nbsp;<a href="xgmm.asp" >�޸�����</a>&nbsp;&nbsp; </p>    
<table width="990" border="1" cellspacing="0" cellpadding="2"  bordercolor="#CCCCCC" style="border-collapse:collapse">
  
  <tr><td colspan="19"> &nbsp;&nbsp;&nbsp;�����ʵ�  ----   ��л���ĸ������������� !</td></tr>
  <tr>
    <td width="49">��������</td>
    <td width="49">��λ����</td>
    <td width="48">ְ�ڽ���</td>
    <td width="48">�ۺϲ���</td>
    <td width="48">н������</td>
    <td width="28">�ν�</td>
    <td width="51">Ӧ��С��</td>
    <td width="51">���ϱ���</td>
    <td width="40">ҽ�ƽ�</td>
    <td width="40">ʧҵ��</td>
    <td width="41">������</td>
    <td width="43">�����</td>
    <td width="28">����</td>
    <td width="37">ˮ���</td>
    <td width="42">����˰</td>
    <td width="52">�۳�С��</td>
    <td width="54">ʵ������</td>
    <td width="55">�����Ͽ�</td>
    <td width="70">��ע</td>
	
  </tr>
  <tr>
  <%
 
   i=2
 Do While  i<rs.Fields.Count-5
 
   %>
   <td align="center" ><%= rs(i)%>&nbsp;</td>
   <% i=i+1
   loop
   %>
  
     <td align="center" ><a title="<% =rs("bz")%>"><%=left(rs("bz"),4)%>&nbsp;</td>
	  <%
   rs.close
set rs=nothing

   
   %>
   
  </tr>
</table>

<table width="990" border="0" cellspacing="0" cellpadding="2"  >
  
  <tr><td colspan="19" height="20"> &nbsp;&nbsp;&nbsp;</td></tr>
 
</table>
<%

sql="select top 1 * from jhgz where  id="&request("ID")
  set rs=server.CreateObject("adodb.recordset")
  
  rs.open sql,conn,1,1
  
  if  Not  rs.bof  then
%>
<table width="990" border="1" cellspacing="0" cellpadding="2"  bordercolor="#CCCCCC" style="border-collapse:collapse">
  
  <tr><td colspan="19"> &nbsp;&nbsp;&nbsp;������ϸ���ñ�</td></tr>
  <tr>
    <td width="49" align="center">��Ŀ</td>
    <td width="49" align="center">���</td>
    <td width="48" align="center">����</td>
</tr>

 <tr>
    <td width="49" align="center">
	<%if rs("xm")<>"" then %> 
	<% =rs("xm")%>&nbsp;
	<% else %> 
	��
	<%end if%>
	</td>
    <td width="49" align="center">
	<%if rs("jg")<>0 then %> 
	<% =rs("jg")%>&nbsp;
	<% else %> 
	0
	<%end if%>
	
	</td>
    <td width="48" align="center">
	<%if rs("yh")<>"" then %> 
	<% =rs("yh")%>
	<% else %> 
	��
	<%end if%></td>
</tr>

</table>

<% end if 
  rs.close
set rs=nothing

 conn.close
    set conn=nothing


 %>

<p>
  <%end if %>

</body>
</html>
