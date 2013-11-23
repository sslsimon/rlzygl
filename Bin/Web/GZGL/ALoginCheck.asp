<!-- #include file="BGMConn.asp" -->
<!-- #include file="LIB/md5.asp" -->
<%
dim username,userpwd,YzCode,sql,rs,Login
username=lcase(trim(request.Form("username")))
userpwd=trim(request.Form("password"))
YzCode=trim(request.Form("valication"))
if username="" then
response.write "<script>alert('登陆出错：\n\n身份证号不能为空!');location.href='index.asp';</script>"
response.End()
end if

if userpwd="" then
response.write "<script>alert('登陆出错：\n\n密码不能为空!');location.href='index.asp';</script>"
response.End()
end if


if YzCode=""then
response.write "<script>alert('登陆出错：\n\n验证码不能为空！!');location.href='index.asp';</script>"
response.End()
end if

if cint(YzCode)<>cint(Session("GetCode")) then
response.write "<script>alert('登陆出错：\n\n验证码输入错误！!');location.href='index.asp';</script>"
response.End()
end if

sql="select * from namesfz where SFZID='"&username&"'"
'sql="select * from namesfz"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
if rs.bof and rs.eof then
   ' Response.Write("llllllllllll")
	Login=false
else




	if rs("PassWord")=md5(userpwd) then
   		Login=true
		session("AdminLogin")=true
		session("SFZID")=rs("SFZID")
		session("name")=rs("name")
		if rs("Power")=true then
		session("AdminPower")="admin"
		else
		session("AdminPower")="user"
		end if
		'session("AdminPowerList")=rs("PowerList")
	else
		Login=false
	end if
end if
rs.close
set rs=nothing
conn.close
set conn=nothing

if Login=true     then

  if session("name")="admin" then
    
	response.Redirect("gzmanage.asp")
	
	else
	
	response.Redirect("grgzcx.asp")
	end if
else
	response.write "<script>alert('登陆出错：\n\n身份证号或密码错误 ！');location.href='index.asp';</script>"
end if

%>