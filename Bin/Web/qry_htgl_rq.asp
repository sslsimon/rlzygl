<!--#include file="conn.asp"-->

<link href="Css.css" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<form name="form1" method="post" action="qry_htgl_rq.asp" onSubmit="return CheckForm();">
���������������롰��ͬ���ڡ� �����Ϊ�գ�����ʾ���к�ͬ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="qry_select.asp" ><strong>���ز�ѯѡ��ҳ</strong></a><br>
  <select name="select_t" size="1">
  <option value="0" >��ѡ���ѯʱ��</option>
   <% dim char(20) 
	    i=0
		see=0
	    sql="select * from htgl "
	    set time_rs=server.CreateObject("adodb.recordset")
		time_rs.open sql,conn,1,1
		do while Not time_rs.EOF 
		for j=0 to i
		 if char(j) = month(time_rs("ht_sxrq")) then 
		 see=1
	     exit for
		 else 
		 see = 0
		 end if
		 next
		 if see=0 then 
		 char(i)=month(time_rs("ht_sxrq"))
	 %>
    <option value="<%=time_rs("ht_sxrq")%>"><%=time_rs("ht_sxrq")%></option>
	<%  
	  'char(i)=time_rs("ht_sxrq")
	  i=i+1
	  end if
	  time_rs.movenext
	  loop
	  time_rs.close
	  set time_rs = nothing 
	%>
  </select>

<br>
  <input type="submit" name="Submit1" value="��ѯ" />
  <input type="reset" name="Submit1" value="����" />
</form>


<%
const MaxPerPage=30
dim totalPut,CurrentPage,TotalPages

name=request.form("name")
tel=request.form("tel")
'conn.open str1

sqll="select * from HTGL "
if name <> "" then
	sqll=sqll & " where ht_sxrq > name & "
end if
sqll=sqll & " order by HT_jsRQ desc"
Set rs = Server.CreateObject("ADODB.Recordset")
rs.open sqll,conn,1,1
%>



<!-- �˴����﷨ע�� -->
<html>
<head>
<title>��ѯ��ͬ��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head> 
<body bgcolor="#FFFFFF" text="#000000"> 
<table width="100%" border="0" cellspacing="0" cellpadding="0"></table>
</body>
        <table width="1600" border="1" cellpadding="0" cellspacing="1"  style="border-collapse:collapse">
          <tr  class="title"> 
            <td width="35" height="25" align="center" ><strong>�ڲ����</strong></td>
			<td width="100" height="25" align="center"><strong>��ͬ���</strong></td>
            <td width="55" height="25" align="center" ><strong>�׷�</strong></td>
			<td width="100" height="25" align="center"  ><strong>��ͬ����</strong></td>
			<td width="100" height="25" align="center"><strong>Ʒ������</strong></td>
            <td width="300" height="25" align="center" ><strong>��ͬ���е�ַ</strong></td>
            <td width="60" height="25" align="center" ><strong>��Ч����</strong></td>
            <td width="60" height="25" align="center" ><strong>��������</strong></td>
			<td width="50" height="25" align="center" ><strong>�۵�</strong></td>
            <td width="50" height="25" align="center" ><strong>����</strong></td>
            <td width="50" height="25" align="center" ><strong>�ֳ�</strong></td>
			<td width="110" height="25" align="center" ><strong>��ͬ���</strong></td>
            <td width="55" height="25" align="center" ><strong>��ͬ����</strong></td>
            <td width="55" height="25" align="center" ><strong>��ŵص�</strong></td>
			<td width="60" height="25" align="center" ><strong>ǩ������</strong></td>
			<td width="55" height="25" align="center" ><strong>������</strong></td>
          </tr>
          <%do while not rs.eof%>
          <tr class="tdbg"> 
            <td width="35" height="25" align="center" ><%=rs("HT_ID")%></td>
			<td width="100" height="25" align="center" ><%=rs("HT_CODE")%></td>
            <td width="55" height="25" align="center" ><%=rs("QYJF")%></td>
			<td width="100" height="25" align="center"> <%=rs("HT_NAME")%></td>
			<td width="100" height="25" align="center" ><%=rs("PPMC")%></td>
            <td width="300" height="25" align="center" ><%=rs("HTZYDZ")%></td>
			<td width="60" height="25" align="center" ><%=rs("HT_SXRQ")%></td>
            <td width="60" height="25" align="center" ><%=rs("HT_JSRQ")%></td>
			<td width="50" height="25" align="center" ><%= (rs("HTKD"))%></td>
            <td width="50" height="25" align="center" ><%=rs("HTBD")%></td>
            <td width="50" height="25" align="center" ><%=rs("HTFC")%></td>
			<td width="110" height="25" align="center"><%=rs("HTLB")%></td>
            <td width="55" align="center" ><%=rs("HTXZ")%></td>
            <td width="55" height="25" align="center" ><%=rs("HT_CFDD")%></td>
			<td width="60" height="25" align="center" ><%=rs("HT_QSRQ")%></td>
			<td width="55" height="25" align="center" ><%=rs("HT_JBR")%></td>
            
            
          </tr>
<%
rs.movenext
loop
%>
        </table>
<%
sql2="select count(*) as HT_COUNT from htgl "
if name <> "" then
	sql2=sql2 & " where  PPMC like '%" & name & "%' "
end if
Set rs = Server.CreateObject("ADODB.Recordset")
rs.open sql2,conn,1,1	
%>
<td width="55" height="25" align="center" >���ҵ� <%=rs("HT_COUNT")%> ����¼</td>		
<%
rs.close 
conn.close 
set rs=nothing 
set conn=nothing 
%>