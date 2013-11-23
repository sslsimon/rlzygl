<!-- #include file="Conn.asp" -->
<!-- #include file="LIB/md5.asp" -->
<%
dim username,userpwd,YzCode,sql,rs,Login
username=lcase(trim(request.Form("username")))
userpwd=trim(request.Form("password"))
YzCode=trim(request.Form("valication"))
if username="" then
response.write "<script>alert('登陆出错：\n\n工号不能为空!');location.href='index.asp';</script>"
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

sql="select * from OPERATOR_XX where OPERATOR_NO='"&username&"'"
'sql="select * from OPERATOR_XX"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
if rs.bof and rs.eof then  '判断用户、密码是否正确
   ' Response.Write("llllllllllll")
	Login=false
else
	'判断是否允许登录
   	if rs("OPERATOR_PASSWORD")=userpwd then	
		  sql="select * from OPERATOR_XX WHERE IS_LOGIN=true and OPERATOR_NO='"&username&"'"  
		   set rs=server.CreateObject("adodb.recordset")
        rs.open sql,conn,1,1
        if rs.bof and rs.eof then

	      Login=false
	      response.write "<script>alert('登陆出错：\n\n不允许登录 ！');location.href='index.asp';</script>"
	      end if
		
		Login=true
		session("AdminLogin")=true
		session("OPERATOR_NO")=rs("OPERATOR_NO")
	else
		Login=false
	end if
end if

rs.close
set rs=nothing
conn.close
set conn=nothing

if Login=true     then
  response.Redirect("qry_select.asp")
else
	response.write "<script>alert('登陆出错：\n\n工号或密码错误 ！');location.href='index.asp';</script>"
end if

%>