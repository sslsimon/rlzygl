<%
On error resume next
dim DBPath,connstr,conn
DBPath="Database/FlexMenu.mdb" '��̬����·��
connstr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(DBPath)
set conn=server.createobject("ADODB.CONNECTION")
conn.open connstr

%>