<%
On error resume next
dim DBPath,connstr,conn
DBPath="Database/FlexMenu.mdb" '¶¯Ì¬Á´½ÓÂ·¾¶
connstr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(DBPath)
set conn=server.createobject("ADODB.CONNECTION")
conn.open connstr

%>