<!-- #include file="Conn.asp" -->
<!-- #include file="LIB/md5.asp" -->
<%
dim username,userpwd,YzCode,sql,rs,Login
username=lcase(trim(request.Form("username")))
userpwd=trim(request.Form("password"))
YzCode=trim(request.Form("valication"))
if username="" then
response.write "<script>alert('��½����\n\n���Ų���Ϊ��!');location.href='index.asp';</script>"
response.End()
end if

if userpwd="" then
response.write "<script>alert('��½����\n\n���벻��Ϊ��!');location.href='index.asp';</script>"
response.End()
end if

if YzCode=""then
response.write "<script>alert('��½����\n\n��֤�벻��Ϊ�գ�!');location.href='index.asp';</script>"
response.End()
end if

if cint(YzCode)<>cint(Session("GetCode")) then
response.write "<script>alert('��½����\n\n��֤���������!');location.href='index.asp';</script>"
response.End()
end if

sql="select * from OPERATOR_XX where OPERATOR_NO='"&username&"'"
'sql="select * from OPERATOR_XX"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
if rs.bof and rs.eof then  '�ж��û��������Ƿ���ȷ
   ' Response.Write("llllllllllll")
	Login=false
else
	'�ж��Ƿ������¼
   	if rs("OPERATOR_PASSWORD")=userpwd then	
		  sql="select * from OPERATOR_XX WHERE IS_LOGIN=true and OPERATOR_NO='"&username&"'"  
		   set rs=server.CreateObject("adodb.recordset")
        rs.open sql,conn,1,1
        if rs.bof and rs.eof then

	      Login=false
	      response.write "<script>alert('��½����\n\n�������¼ ��');location.href='index.asp';</script>"
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
	response.write "<script>alert('��½����\n\n���Ż�������� ��');location.href='index.asp';</script>"
end if

%>