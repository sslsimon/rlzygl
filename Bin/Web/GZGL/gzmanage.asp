<%@language=vbscript codepage=936 %>

<style type="text/css">
<!--

td {
	font-size: 12px;
	
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
-->
</style>
<!-- #include file="BGMConn.asp" -->
<!-- #include file="LIB/Functionn.asp" -->
<%
dim strFileName
const MaxPerPage=30
dim totalPut,CurrentPage,TotalPages
dim i,j
dim ID
dim Title
dim sql,rs
dim BigClassName,SmallClassName,SpecialName
dim PurviewChecked
dim strAdmin,arrAdmin
PurviewChecked=false
session("purview")=3
strFileName="gzmanage.asp"

Title=Trim(request("Title"))

ID=Request("ID")

select_tine=Trim(request("select_t"))

if request("page")<>"" then
    currentPage=cint(request("page"))
else
	currentPage=1
end if

sql="select * from jhgz "

if Title<>"" then
	sql=sql & " where  name like '%" & Title & "%' "
end if

if select_tine<>"" then
	sql=sql & "where time=#"&select_tine&"# "
	'session("select_tine")=select_tine
end if

sql=sql & " order by ID desc"

'Response.Write(sql)

Set rs= Server.CreateObject("ADODB.Recordset")

rs.open sql,conn,1,1

%>
<SCRIPT language=javascript>
function unselectall()
{
    if(document.del.chkAll.checked){
	document.del.chkAll.checked = document.del.chkAll.checked&0;
    } 	
}

function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.Name != "chkAll")
       e.checked = form.chkAll.checked;
    }
  }
function ConfirmDel()
{
   if(confirm("ȷ��Ҫɾ��ѡ�е��û���һ��ɾ�������ָܻ���"))
     return true;
   else
     return false;
	 
}

function CheckForm()
{
	if(document.form1.select.value=="0")
	{
		alert("�������ѯʱ�䣡");
		document.form1.select.focus();
		return false;
	}
	
	

	
	}


</SCRIPT>
<link href="Css.css" rel="stylesheet" type="text/css">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <tr>
    <td  align="center" valign="top"><br>
      <b> </b>
      <p align="center"><strong>�� �� 
        �� ��</strong>&nbsp;&nbsp;&nbsp; </p>
      <p align="center"><a href="addgz.asp" >��ӹ��ʵ�</a>&nbsp;&nbsp;
	  <a href="xlsdaoaccesst.asp" target="_blank">�����û�����</a> 
	 &nbsp; <a href="daogzdsjt.asp" target="_blank">���������ʵ�����</a>&nbsp;
	   <a href="daogzdsjtqt.asp" target="_blank">�����������ʵ�����</a>&nbsp;
	    <a href="usrmanage.asp" target="_blank">�û�����&nbsp; </a>
		 <a href="loigoout.asp" >�˳�</a> 
		 
		 </p>
      <a href="javascript:window.print();">��ӡ���ʵ�</a>
	  <form id="form1" name="form1" method="post" action="gzmanage.asp" onSubmit="return CheckForm();">
 
  <select name="select_t" size="1">
  <option value="0" >��ѡ���ѯʱ��</option>
     <% dim char(20) 
	    i=0
		see=0
	    sql="select * from jhgz "
	    set time_rs=server.CreateObject("adodb.recordset")
		time_rs.open sql,conn,1,1
		do while Not time_rs.EOF 
		
		for j=0 to i
		
		 if char(j) = month(time_rs("time")) then 
		 
		 see=1
		  
         exit for
		 
		 else 
		 
		 see = 0
		 
		 end if
		 
		 next
		 
		 if see=0 then 
		 char(i)=month(time_rs("time"))
		
	 %>
    <option value="<%=time_rs("time")%>"><%=time_rs("time")%></option>
	<%  
	  'char(i)=time_rs("time")
	  i=i+1
	  end if
	  time_rs.movenext
	  loop
	  time_rs.close
	  set time_rs = nothing 
	%>
  
  </select>

 
  <input type="submit" name="Submit1" value="��ѯ" />
  <input type="reset" name="Submit1" value="����" />
  
</form>
      <form name="del" method="Post" action="delgz.asp" onSubmit="return ConfirmDel();">
       
	    <table width="972" height="29" border="1" cellpadding="0" cellspacing="1" style="border-collapse:collapse" >
          <tr >
            <td width="534" height="25"><a href="gzmanage.asp">&nbsp;���ʹ���</a> &gt;&gt;
              <%
if request.querystring="" then
	response.write "�����û�"
else
	if request("Query")<>"" then
		if Title<>"" then
			response.write "�����к��С�<font color=blue>" & Title & "</font>�����û�"
		else
			response.Write("�����û�")
		end if
 	
	end if
end if
%>




            </td>
            <td width="429"  align="right">&nbsp;
              <%
  	if rs.eof and rs.bof then
		response.write "���ҵ� 0 ���û�</td></tr></table>"
	else
    	totalPut=rs.recordcount
		if currentpage<1 then
       		currentpage=1
    	end if
    	if (currentpage-1)*MaxPerPage>totalput then
	   		if (totalPut mod MaxPerPage)=0 then
	     		currentpage= totalPut \ MaxPerPage
		  	else
		      	currentpage= totalPut \ MaxPerPage + 1
	   		end if

    	end if
		response.Write "���ҵ� " & totalPut & " ���û�"
%>
            </td>
          </tr>
        </table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" height="5">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
	
		
        <%		
	    if currentPage=1 then
        	showContent
        	showpage strFileName,totalput,MaxPerPage,true,false,"���û�",select_tine
   	 	else
   	     	if (currentPage-1)*MaxPerPage<totalPut then
         	   	rs.move  (currentPage-1)*MaxPerPage
         		dim bookmark
           		bookmark=rs.bookmark
            	showContent
            	showpage strFileName,totalput,MaxPerPage,true,false,"���û�",select_tine
        	else
	        	currentPage=1
           		showContent
           		showpage strFileName,totalput,MaxPerPage,true,false,"���û�",select_tine
	    	end if
		end if
	end if
%>
        <%  
sub showContent
   	dim i
    i=0
%>
        <table width="100%" border="1" cellpadding="0" cellspacing="1" style="border-collapse:collapse" >
          <tr  class="title">
            <td width="34" height="25" align="center"><strong>ѡ��</strong></td>
            <td width="45" align="center">����</td>
            <td width="50" align="center">��������</td>
            <td width="17" align="center">��λ����</td>
            <td width="81" align="center">ְ�ڽ���</td>
            <td width="18" align="center">�ۺϲ���</td>
            <td width="17" align="center">н������</td>
            <td width="15" align="center">�ν�</td>
            <td width="23" align="center">Ӧ��С��</td>
            <td width="19" align="center">���ϱ���</td>
            <td width="54" align="center">ҽ�ƽ�</td>
            <td width="57" align="center">ʧҵ��</td>
            <td width="49" align="center">������</td>
            <td width="44" align="center">�����</td>
            <td width="43" align="center">����</td>
            <td width="45" align="center">ˮ���</td>
            <td width="42" align="center">����˰</td>
            <td width="58" align="center">�۳�С��</td>
            <td width="50" align="center">ʵ������</td>
            <td width="87" align="center">ʱ��</td>
            <td width="60" align="center" ><strong>����</strong></td>
          </tr>
          <%do while not rs.eof%>
		  
          <tr class="tdbg">
		  
		  
           <td width="34" height="22" align="center" > 
              <input name='ID' type='checkbox' onClick="unselectall()" id="ID" value='<%=cstr(rs("ID"))%>'>
            </td>
            <td align="center"><a href="seetable.asp?id=<%=cstr(rs("ID"))%>"  target="_blank"><%= rs(1)%>&nbsp;</a></td>
            <%
 
   tr_i=2
 Do While  tr_i < rs.Fields.Count - 6
 
   %>
            <td align="center"><%= rs(tr_i)%>&nbsp;</td>
            <% 
   tr_i=tr_i+1
   loop
   
   %>
            <td align="center"><%= rs("time")%>&nbsp;</td>
            <td width="81" align="center" ><a href="gzedit.asp?ID=<%=rs("ID")%>">�޸�</a>&nbsp;<a href="delgz.asp?ID=<%=rs("ID")%>" onClick="return ConfirmDel();">ɾ��</a></td>
          </tr>
          <%
	i=i+1
	      if i>=MaxPerPage then exit do
	      rs.movenext
	loop
%>
        </table>
              <table width="549" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="250" height="30"><input name="chkAll" type="checkbox" id="chkAll" onclick=CheckAll(this.form) value="checkbox">
              ѡ�б�ҳ��ʾ�������û�</td>
            <td width="335"><input name="submit" type='submit' value='ɾ��ѡ�����û�' > 
            <input name="Action" type="hidden" id="Action" value="Del"></td>
          </tr>
        </table>
        <%
   end sub 
%>
      </form>
      <br>
      <table width="970" border="0" cellpadding="0" cellspacing="0" class="border">
        <tr class="tdbg">
          <form name="searchsoft" method="get" action="gzmanage.asp">
            <td width="794" height="30"><strong>���ҹ��ʵ���</strong>
              <input name="Title" type="text" class=smallInput id="Title" size="10" maxlength="20">
              <input name="Query" type="submit" id="Query" value="�� ѯ">
              &nbsp;&nbsp;�����롰�û����� �� ���ա� �� �����������Ϊ�գ�����������û�</td>
          </form>
        </tr>
      </table></td>
  </tr>
</table>
<%
rs.close 
conn.close 
set rs=nothing 

set conn=nothing 
%>
