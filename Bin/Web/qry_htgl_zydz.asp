<link href="Css.css" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<form name="form1" method="post" action="qry_htgl_zydz.asp">
���������������롰��ͬ���е�ַ�� �����Ϊ�գ�����ʾ���к�ͬ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="qry_select.asp" ><strong>���ز�ѯѡ��ҳ</strong></a><br>
��ͬ���е�ַ =
<input type="text" name="name">

<br>
<input type="submit" name="Submit" value="�ύ">
<input type="reset" name="Submit2" value="����">
</form>

<!--#include file="conn.asp"-->
<%
const MaxPerPage=30
dim totalPut,CurrentPage,TotalPages

name=request.form("name")
tel=request.form("tel")
'conn.open str1

sqll="select * from HTGL "
if name <> "" then
	sqll=sqll & " where  HTZYDZ like '%" & name & "%' "
end if
sqll=sqll & " order by HT_SXRQ desc"
Set rs = Server.CreateObject("ADODB.Recordset")
rs.open sqll,conn,1,1
%>



<!-- �˴����﷨ע�� -->
<html>
<head>
<title>��ѯ��ͬ��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head> 
<body bgcolor="#FFFFFF" text="#000000"> 
<table width="100%" border="0" cellspacing="0" cellpadding="0"></table>
</body>
        <table width="1600" border="1" cellpadding="0" cellspacing="1"  style="border-collapse:collapse">
          <tr  class="title"> 
            <td width="35" height="25" align="center" ><strong>�ڲ����</strong></td>
			<td width="100" height="25" align="center"><strong>��ͬ���</strong></td>
            <td width="55" height="25" align="center" ><strong>�׷�</strong></td>
			<td width="100" height="25" align="center"  ><strong>��ͬ����</strong></td>
			<td width="100" height="25" align="center"><strong>Ʒ������</strong></td>
            <td width="300" height="25" align="center" ><strong>��ͬ���е�ַ</strong></td>
            <td width="60" height="25" align="center" ><strong>��Ч����</strong></td>
            <td width="60" height="25" align="center" ><strong>��������</strong></td>
			<td width="50" height="25" align="center" ><strong>�۵�</strong></td>
            <td width="50" height="25" align="center" ><strong>����</strong></td>
            <td width="50" height="25" align="center" ><strong>�ֳ�</strong></td>
			<td width="110" height="25" align="center" ><strong>��ͬ���</strong></td>
            <td width="55" height="25" align="center" ><strong>��ͬ����</strong></td>
            <td width="55" height="25" align="center" ><strong>��ŵص�</strong></td>
			<td width="60" height="25" align="center" ><strong>ǩ������</strong></td>
			<td width="55" height="25" align="center" ><strong>������</strong></td>
          </tr>
          <%do while not rs.eof%>
          <tr class="tdbg"> 
            <td width="35" height="25" align="center" ><%=rs("HT_ID")%></td>
			<td width="100" height="25" align="center" ><%=rs("HT_CODE")%></td>
            <td width="55" height="25" align="center" ><%=rs("QYJF")%></td>
			<td width="100" height="25" align="center"> <%=rs("HT_NAME")%></td>
			<td width="100" height="25" align="center" ><%=rs("PPMC")%></td>
            <td width="300" height="25" align="center" ><%=rs("HTZYDZ")%></td>
			<td width="60" height="25" align="center" ><%=rs("HT_SXRQ")%></td>
            <td width="60" height="25" align="center" ><%=rs("HT_JSRQ")%></td>
			<td width="50" height="25" align="center" ><%= (rs("HTKD"))%></td>
            <td width="50" height="25" align="center" ><%=rs("HTBD")%></td>
            <td width="50" height="25" align="center" ><%=rs("HTFC")%></td>
			<td width="110" height="25" align="center"><%=rs("HTLB")%></td>
            <td width="55" align="center" ><%=rs("HTXZ")%></td>
            <td width="55" height="25" align="center" ><%=rs("HT_CFDD")%></td>
			<td width="60" height="25" align="center" ><%=rs("HT_QSRQ")%></td>
			<td width="55" height="25" align="center" ><%=rs("HT_JBR")%></td>
            
            
          </tr>
<%
rs.movenext
loop
%>
        </table>
<%
sql2="select count(*) as HT_COUNT from htgl "
if name <> "" then
	sql2=sql2 & " where  PPMC like '%" & name & "%' "
end if
Set rs = Server.CreateObject("ADODB.Recordset")
rs.open sql2,conn,1,1	
%>
<td width="55" height="25" align="center" >���ҵ� <%=rs("HT_COUNT")%> ����¼</td>		
<%
rs.close 
conn.close 
set rs=nothing 
set conn=nothing 
%>