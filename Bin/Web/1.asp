<!--#include file="conn.asp"-->
<%
name=request.form("name")
tel=request.form("tel")
'conn.open str1

sqll="select * from RYXX "
if name <> "" then
	sqll=sqll & " where  RY_NAME like '%" & name & "%' "
end if
sqll=sqll & " order by ry_no desc"

Set rs = Server.CreateObject("ADODB.Recordset")
rs.open sqll,conn,1,1
%>

<!-- �˴����﷨ע�� -->
<html>
<head>
<title>��ѯ��Ա��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head> 
<body bgcolor="#FFFFFF" text="#000000"> 
<table width="100%" border="0" cellspacing="0" cellpadding="0"></table>
</body>

        <table width="547" border="1" cellpadding="0" cellspacing="1"  style="border-collapse:collapse">
          <tr  class="title"> 
            
            <td width="30"  height="25" align="center"><strong>���</strong></td>
            <td width="89" align="center"><strong>����</strong></td>
            <td width="51" align="center"  ><strong>�Ա�</strong></td>
            <td width="199" align="center" ><strong>�ƶ��绰</strong></td>

          </tr>
          <%do while not rs.eof%>
          <tr class="tdbg"> 
            <td width="30" align="center" ><%=rs("RY_NO")%></td>
            <td width="89" align="center" ><%=rs("RY_NAME")%></td>
            <td  align="center"> <%=rs("RY_SEX")%></td>
            <td width="199" align="center"><%=rs("RY_MOBEL_PHONE")%></td>
          </tr>
<%
rs.movenext
loop
%>
        </table>
<%
rs.close 
conn.close 
set rs=nothing 
set conn=nothing 
%>