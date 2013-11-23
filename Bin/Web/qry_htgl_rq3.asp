<!--#include file="conn.asp"-->
<style type="text/css">
<!--

td {
	font-size: 12px;
	
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
-->
</style>
<link href="Css.css" rel="stylesheet" type="text/css">
<html>
<head>
<title>临期合同信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<p align="center" ><font size="5"><strong>临期合同查询</strong>
<br>
<br>
<strong>“<%Response.Write date()%>”</strong>&nbsp;≤&nbsp;<strong>合同到期日期</strong>&nbsp;≤&nbsp;<strong>“<%Response.Write DateAdd("m", 3, date())%>”</strong>
<br>
<p align="left" ><a href="javascript:window.print();"><strong>打印当前页</strong></a></p>
<%
sqll="select * from HTGL where HT_JSRQ>'" & date() & "' and HT_JSRQ <= '" & DateAdd("m", 3, date()) & "'"
sqll=sqll & " order by HT_JSRQ desc"
Set rs = Server.CreateObject("ADODB.Recordset")
rs.open sqll,conn,1,1
%>
</head> 
<body bgcolor="#FFFFFF" text="#000000"> 
<table width="100%" border="0" cellspacing="0" cellpadding="0"></table>
</body>
        <table width="1600" border="1" cellpadding="0" cellspacing="1"  style="border-collapse:collapse">
          <tr  class="title"> 
            <td width="35" height="25" align="center" ><strong>内部编号</strong></td>
			<td width="100" height="25" align="center"><strong>合同编号</strong></td>
            <td width="55" height="25" align="center" ><strong>甲方</strong></td>
			<td width="100" height="25" align="center"  ><strong>合同名称</strong></td>
			<td width="100" height="25" align="center"><strong>品牌名称</strong></td>
            <td width="300" height="25" align="center" ><strong>合同履行地址</strong></td>
            <td width="60" height="25" align="center" ><strong>生效日期</strong></td>
            <td width="60" height="25" align="center" ><strong>结束日期</strong></td>
			<td width="50" height="25" align="center" ><strong>扣点</strong></td>
            <td width="50" height="25" align="center" ><strong>保底</strong></td>
            <td width="50" height="25" align="center" ><strong>分成</strong></td>
			<td width="110" height="25" align="center" ><strong>合同类别</strong></td>
            <td width="55" height="25" align="center" ><strong>合同性质</strong></td>
            <td width="55" height="25" align="center" ><strong>存放地点</strong></td>
			<td width="60" height="25" align="center" ><strong>签署日期</strong></td>
			<td width="55" height="25" align="center" ><strong>经办人</strong></td>
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
sql2="select count(*) as HT_COUNT from htgl where HT_JSRQ>'" & date() & "' and HT_JSRQ <= '" & DateAdd("m", 3, date()) & "'"
Set rs = Server.CreateObject("ADODB.Recordset")
rs.open sql2,conn,1,1	
%>
<td width="55" height="25" align="center" ><font size="2"><strong>共找到 <%=rs("HT_COUNT")%> 条记录</strong></font></td>		
<%
rs.close 
conn.close 
set rs=nothing 
set conn=nothing 
%>		
  