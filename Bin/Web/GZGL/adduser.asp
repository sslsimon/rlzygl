<% 
if  session("AdminLogin") <> true then 
response.Redirect "ALogin.asp" 
else 
%> 

<!-- #include file="BGMConn.asp" -->
<!-- #include file="LIB/md5.asp" -->



<% 
if request("act")="xg" then 

sql1="select * from namesfz where SFZID='"&request("username")&"'"



' response.write sql1
set rs1=server.CreateObject("adodb.recordset") 

rs1.open sql1,conn,1,1 

if  not  rs1.eof then   

rs1.close

response.write "<script>alert('此用户身份证号已经存在！');location.href='usrmanage.asp';</script>" 

end if



sql1="select * from namesfz where name='"&request("name")&"'"

set rs1=server.CreateObject("adodb.recordset") 

rs1.open sql1,conn,1,3 

if  not  rs1.eof then  

  
response.write "<script>alert('此用户名已经存在！');location.href='usrmanage.asp';</script>" 

else

rs1.addnew

  if request("username")<>"" then 
  rs1("SFZID")=request("username")
  end if 

  if request("name")<>"" then 
  rs1("name")=request("name")
  end if 
 
  if request("sex")<>"" then 
' response.write rs1("sex")
  rs1("sex")=request("sex")
  'response.write rs1("sex")
 
  
  end if 
  
  rs1("password")=md5("123456")
 
 
 rs1.update 
' response.write rs1("sex")


response.write "<script>alert('添加成功！');location.href='usrmanage.asp';</script>" 

end if

rs1.close 

set rs1=nothing

else 
 

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
	
	
	if(document.form1.username.value=="")
	{
		alert("请输入身份证号！");
		document.form1.username.focus();
		return false;
	}
	if(document.form1.sex.value == "")
	{
		alert("请输入性别！");
		document.form1.sex.focus();
		return false;
	}
	
	if(document.form1.name.value == "")
	{
		alert("请输入姓名！");
		document.form1.name.focus();
		return false;
	}
	
	
	
	
	
	}



-->
</script>




<form name="form1" method="post" action="adduser.asp?act=xg" onSubmit="return CheckForm();">

<table width="265" height="24" border="0" align="center" cellpadding="0" cellspacing="0">


											<tr>
											  <td ><div align="center" class="STYLE1">添加新用户</div></td>
										
											</tr>
								  </table>
 
<br />
<table width="265" height="24" border="0" align="center" cellpadding="0" cellspacing="0">


											<tr>
											  <td width="94"><div align="right" >身份证号：</div></td>
										      <td width="171"><input name="username" type="text" value="" size="22" maxlength="20"> </td>
											</tr>
								  </table>
								  
								  <table width="267" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
											  <td width="96"><div align="right">姓名：</div></td>
										      <td width="171"><input name="name" type="text" value="" size="22" maxlength="22"> </td>
											</tr>
								  </table>
								  
								  <table width="267" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
											  <td width="96"><div align="right">性别：</div></td>
										      <td width="171"><input name="sex" type="text" value="" size="22" maxlength="22"> </td>
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

set conn=nothing 
%> 
<% 
end if 
%>
</body>
</html>