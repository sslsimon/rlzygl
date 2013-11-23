<%
str1 = "Driver={XTG Systems Interbase6 ODBC driver};uid=sysdba;pwd=masterkey;Data Source=Interbase"
Set conn = Server.CreateObject("ADODB.Connection")
conn.open str1
%>