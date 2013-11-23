<%@language=vbscript codepage=936 %>
<!-- #include file="BGMConn.asp" -->
<%

dim UserID,sql,rs

UserID=trim(Request("ID"))
idArr=split(UserID)

for i = 0 to ubound(idArr)

		
		
		sql="delete from namesfz where ID="&clng(idarr(i))
	    conn.Execute sql
		next


rs.close 
conn.close 
set rs=nothing 

set conn=nothing     
response.redirect "usrmanage.asp"
%>