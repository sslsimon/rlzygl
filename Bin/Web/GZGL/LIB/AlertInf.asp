<%
	Public Sub AlertInf(ByVal Inf)
		response.write "<script>alert('"&Inf&"');history.back();</script>"
		response.end
	End Sub
%>