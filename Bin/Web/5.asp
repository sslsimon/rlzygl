<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

</head>

<%
str1 = "Driver={XTG Systems Interbase6 ODBC driver};uid=sysdba;pwd=masterkey;Data Source=Interbase"
Set conn = Server.CreateObject("ADODB.Connection")
conn.open str1
Set rs = Server.CreateObject("ADODB.Recordset")

sqll="select * from RYXX "
rs.open sqll,conn,1,3

%>

<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
<%do while not rs.eof%><tr> 
<td><%=rs("ry_no")%></td> 
<td><%=rs("ry_name")%></td> 
<td><%=rs("ry_sex")%></td>  
</tr><% 
rs.movenext 
loop 
%> 
</table> 

<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
</html>