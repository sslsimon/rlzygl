

<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<!-- #include file="BGMConn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>工资查询 -- 感谢您的付出，明天会更好</title>
<link href="Css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body,td,th {
	font-family: 宋体;
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
		alert("请输入查询时间！");
		document.form1.select.focus();
		return false;
	}
	
	

	
	}



-->
</script>
<body>
<%
 
  if request("act")="xg" then
  date_cx = request("select")

  sql="select * from jhgz where time=#"&date_cx&"# and name='"&session("name")&"' order by time desc"
  'response.write  sql
  else
  sql="select top 1 * from jhgz where  name='"&session("name")&"' order by time desc"
  end if
  set rs=server.CreateObject("adodb.recordset")
  rs.open sql,conn,1,1
  if rs.bof and rs.eof then
  response.write "<script>alert('没有你的工资单！');location.href='index.asp';</script>"
  else 
 %>
<p align="center">身份证号：<%= session("SFZID")%>&nbsp;&nbsp;&nbsp;&nbsp; 姓名：<%= rs("name")%>
&nbsp;&nbsp;&nbsp;本表为：&nbsp;<%= rs("time")%>&nbsp;工资单&nbsp;<a href="javascript:window.print();">打印工资单</a> 
&nbsp;<a href="xgmm.asp" >修改密码</a>&nbsp;&nbsp; <a href="loigoout.asp" >退出</a> </p>    
<form id="form1" name="form1" method="post" action="grgzcx.asp?act=xg" onSubmit="return CheckForm();">
  <label>
  <select name="select" size="1">
  <option value="0" >请选择查询时间</option>
     <% dim char(20) 
	    i=0
		see=0
	    sql="select * from jhgz "
	    set time_rs=server.CreateObject("adodb.recordset")
		time_rs.open sql,conn,1,1
		do while Not time_rs.EOF 
		
		for j=0 to i
		
		 if char(j) = month(time_rs("time")) then 
		 
		 see=1
		  
         exit for
		 
		 else 
		 
		 see = 0
		 
		 end if
		 
		 next
		 
		 if see=0 then 
		 char(i)=month(time_rs("time"))
		
	 %>
    <option value="<%=time_rs("time")%>"><%=time_rs("time")%></option>
	<%  
	  'char(i)=time_rs("time")
	  i=i+1
	  end if
	  time_rs.movenext
	  loop
	  time_rs.close
	  set time_rs = nothing 
	%>
  
  </select>
  </label>
 
  <input type="submit" name="Submit" value="查询" />
  <input type="reset" name="Submit2" value="重置" />
  
</form>
<table width="990" border="1" cellspacing="0" cellpadding="2"  bordercolor="#CCCCCC" style="border-collapse:collapse">
  
  <tr><td colspan="19"> &nbsp;&nbsp;&nbsp;主工资单  ----   感谢您的付出，明天会更好 !</td></tr>
  <tr>
    <td width="49">保留工资</td>
    <td width="49">岗位津贴</td>
    <td width="48">职岗津贴</td>
    <td width="48">综合补贴</td>
    <td width="48">薪级工资</td>
    <td width="28">课金</td>
    <td width="51">应发小计</td>
    <td width="51">养老保险</td>
    <td width="40">医疗金</td>
    <td width="40">失业金</td>
    <td width="41">公积金</td>
    <td width="43">工会费</td>
    <td width="28">房租</td>
    <td width="37">水电费</td>
    <td width="42">所得税</td>
    <td width="52">扣除小计</td>
    <td width="54">实发工资</td>
    <td width="55">银行上卡</td>
    <td width="70">备注</td>
	
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

  if request("act")="xg" then
  date_cx = request("select")

  sql="select * from jhgz where time=#"&date_cx&"# and name='"&session("name")&"' order by time desc"
  'response.write  sql
  else
  sql="select top 1 * from jhgz where  name='"&session("name")&"' order by time desc"
  end if
  set rs=server.CreateObject("adodb.recordset")
  rs.open sql,conn,1,1
  if  Not  rs.bof  then
%>
<table width="990" border="1" cellspacing="0" cellpadding="2"  bordercolor="#CCCCCC" style="border-collapse:collapse">
  
  <tr><td colspan="19"> &nbsp;&nbsp;&nbsp;其他明细费用表单</td></tr>
  <tr>
    <td width="49" align="center">项目</td>
    <td width="49" align="center">金额</td>
    <td width="48" align="center">银行</td>
</tr>

 <tr>
    <td width="49" align="center">
	<%if rs("xm")<>"" then %> 
	<% =rs("xm")%>&nbsp;
	<% else %> 
	无
	<%end if%>
	</td>
    <td width="49" align="center">
	<%if rs("jg")<>0 then %> 
	<% =rs("jg")%>&nbsp;
	<% else %> 
	0
	<%end if%>
	
	</td>
    <td width="48" align="center"><%if rs("yh")<>"" then %> 
	<% =rs("yh")%>
	<% else %> 
	无
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
