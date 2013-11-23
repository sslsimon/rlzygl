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
<%
dim strFileName
const MaxPerPage=30
dim totalPut,CurrentPage,TotalPages
dim i,j
dim ID
dim Title
dim sql,rs
dim BigClassName,SmallClassName,SpecialName
dim PurviewChecked
dim strAdmin,arrAdmin
PurviewChecked=false
session("purview")=3
strFileName="gzmanage.asp"

Title=Trim(request("Title"))

ID=Request("ID")

select_tine=Trim(request("select_t"))

if request("page")<>"" then
    currentPage=cint(request("page"))
else
	currentPage=1
end if

sql="select * from htgl "

if Title<>"" then
	sql=sql & " where  ht_code like '%" & Title & "%' "
end if

if select_tine<>"" then
	sql=sql & " where ht_jsrq<='"&select_tine&"'"
	'sql=sql & " where ht_jsrq>#"&select_tine&"# "
	'session("select_tine")=select_tine
end if

sql=sql & " order by ht_jsrq desc"

'Response.Write(sql)

Set rs= Server.CreateObject("ADODB.Recordset")

rs.open sql,conn,1,1

%>
<SCRIPT language=javascript>

function CheckForm()
{
	if(document.form1.select.value=="0")
	{
		alert("请输入查询时间！");
		document.form1.select.focus();
		return false;
	}
	
	}
</SCRIPT>
<link href="Css.css" rel="stylesheet" type="text/css">
<form id="form1" name="form1" method="post" action="qry_htgl_rq1.asp" onSubmit="return CheckForm();">
<select name="select_t" size="1">
  <option value="0" >请选择合同到期日</option>
   <% dim char(20) 
	    i=0
		see=0
	    sql="select * from htgl "
	    set time_rs=server.CreateObject("adodb.recordset")
		time_rs.open sql,conn,1,1
		do while Not time_rs.EOF 
		for j=0 to i
		 if char(j) = day(time_rs("ht_jsrq")) then 
		 see=1
	     exit for
		 else 
		 see = 0
		 end if
		 next
		 if see=0 then 
		 char(i)=day(time_rs("ht_jsrq"))
	 %>
    <option value="<%=time_rs("ht_jsrq")%>"><%=time_rs("ht_jsrq")%></option>
	<%  
	  'char(i)=time_rs("ht_jsrq")
	  i=i+1
	  end if
	  time_rs.movenext
	  loop
	  time_rs.close
	  set time_rs = nothing 
	%>
  </select>
  <input type="submit" name="Submit1" value="查询" />
  <input type="reset" name="Submit1" value="重置" />
<html>
<head>
<title>查询合同信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
  