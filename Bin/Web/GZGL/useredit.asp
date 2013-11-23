<% 
if  session("AdminLogin") <> true then 
response.Redirect "index.asp" 
else 
%> 

<!-- #include file="BGMConn.asp" -->
<!-- #include file="LIB/md5.asp" -->



<% 
if request("act")="xg" then 
sql1="select * from namesfz where ID="&request("ID")

 
set rs1=server.CreateObject("adodb.recordset") 
rs1.open sql1,conn,1,3 



  if request("name")<>"" then 
  rs1("name")=request("name")
  end if 
 
  if request("sex")<>"" then 
' response.write rs1("sex")
  rs1("sex")=request("sex")
  'response.write rs1("sex")
 
  
  end if 
  
   if request("password")<>"" then 
   rs1("password")=md5(request("password")) 
    end if 
 
 rs1.update 
' response.write rs1("sex")
rs1.close 

set rs1=nothing 
 response.write "<script>alert(' 修改成功！');location.href='usrmanage.asp';</script>" 
 
else 
set rs=server.CreateObject("adodb.recordset") 
sql="select * from namesfz where ID="&request("ID")
rs.open sql,conn,1,1 

%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改密码</title>
</head>
<style type="text/css">
<!--
body,td,th {
	font-family: 宋体;
	font-size: 12px;
	color: #000000;
}
.STYLE1 {
	font-size: 14px;
	font-weight: bold;
}
-->
</style>
<body>
<script language="javascript">
<!--
function CheckForm()
{
	
	if(document.form1.qrpassword.value != document.form1.password.value)
	{
		alert("新密码与确认密码不同，重新输入！");
		document.form1.password.focus();
		return false;
	}
	
	}



-->
</script>




<form name="form1" method="post" action="useredit.asp?act=xg&ID=<%=rs("id")%>" onSubmit="return CheckForm();">
 
<table width="265" height="24" border="0" align="center" cellpadding="0" cellspacing="0">


											<tr>
											  <td ><div align="center" class="STYLE1">修改用户信息</div></td>
										
											</tr>
											
								  </table>
 
<br />
<table width="265" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
											  <td width="94"><div align="right" >身份证号：</div></td>
										      <td width="171"><input name="username" type="text" value="<%=rs("SFZID")%>" size="22" maxlength="20"> </td>
											</tr>
								  </table>
								  
								  <table width="267" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
											  <td width="96"><div align="right">姓名：</div></td>
										      <td width="171"><input name="name" type="text" value="<%=rs("name")%>" size="22" maxlength="22"> </td>
											</tr>
								  </table>
								  
								  <table width="267" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
											  <td width="96"><div align="right">性别：</div></td>
										      <td width="171"><input name="sex" type="text" value="<%=rs("sex")%>" size="22" maxlength="22"> </td>
											</tr>
								  </table>
								  
								  
									<table width="267" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
											  <td width="96"><div align="right">新密码：</div></td>
										      <td width="171"><input name="password" type="password" value="" size="22" maxlength="22"> </td>
											</tr>
								  </table>
								  <table width="267" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
											  <td width="96"><div align="right">确认密码：</div></td>
										      <td width="171"><input name="qrpassword" type="password" value="" size="22" maxlength="22"> </td>
											</tr>
								  </table>
<p align="center"> 
<label> 
<input type="submit" name="Submit" value="修改"> 
</label> 
<label> 
<input type="reset" name="Submit2" value="重置"> 
</label> 
</p> 

</form> 
<% 
end if 
rs.close 
conn.close 
set rs=nothing 

set conn=nothing 
%> 
<% 
end if 
%>
</body>
</html>