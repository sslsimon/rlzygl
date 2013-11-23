<%
'	Manager is online or not.
	if session("AdminLogin")="" then
		response.write "<script language='javascript'>parent.location.replace('ALogin.asp');</script >"
		response.end
	end if
%>