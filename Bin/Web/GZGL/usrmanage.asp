<%@language=vbscript codepage=936 %>


<%
if  session("name") <> "admin" then 
response.Redirect "index.asp" 
end if

%>
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
strFileName="usrmanage.asp"

Title=Trim(request("Title"))
ID=Request("ID")

if request("page")<>"" then
    currentPage=cint(request("page"))
else
	currentPage=1
end if

sql="select * from namesfz "

if Title<>"" then
	sql=sql & " where  name like '%" & Title & "%' "
end if


sql=sql & " order by ID desc"

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

</SCRIPT>
<link href="Css.css" rel="stylesheet" type="text/css">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <tr> 
    <td width="862" align="center" valign="top"> <br>
      <b> </b> 
      <p align="center"><strong>�� �� 
        �� ��</strong>&nbsp;&nbsp;&nbsp; </p>
      <p align="center"><a href="adduser.asp" >����û�</a></p>
      <form name="del" method="Post" action="UserDel.asp" onSubmit="return ConfirmDel();">
        <table width="546" height="29" border="1" cellpadding="0" cellspacing="1" style="border-collapse:collapse">
          <tr > 
            <td width="467" height="25"><a href="usrmanage.asp">&nbsp;�û�����</a> &gt;&gt; 
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
            <td width="128">&nbsp; 
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
%> </td>
          </tr>
        </table>
        <%		
	    if currentPage=1 then
        	showContent
        	showpage strFileName,totalput,MaxPerPage,true,false,"���û�"
   	 	else
   	     	if (currentPage-1)*MaxPerPage<totalPut then
         	   	rs.move  (currentPage-1)*MaxPerPage
         		dim bookmark
           		bookmark=rs.bookmark
            	showContent
            	showpage strFileName,totalput,MaxPerPage,true,false,"���û�"
        	else
	        	currentPage=1
           		showContent
           		showpage strFileName,totalput,MaxPerPage,true,false,"���û�"
	    	end if
		end if
	end if
%>
        <%  
sub showContent
   	dim i
    i=0
%>
        <table width="547" border="1" cellpadding="0" cellspacing="1"  style="border-collapse:collapse">
          <tr  class="title"> 
            <td width="51" height="25" align="center"><strong>ѡ��</strong></td>
            <td width="30"  height="25" align="center"><strong>ID</strong></td>
            <td width="89" align="center"><strong>����</strong></td>
            <td width="51" align="center"  ><strong>�Ա�</strong></td>
            <td width="199" align="center" ><strong>���֤��</strong></td>
            
            <td width="193" align="center" ><strong>����</strong></td>
          </tr>
          <%do while not rs.eof%>
          <tr class="tdbg"> 
            <td width="51" height="22" align="center" > 
              <input name='ID' type='checkbox' onClick="unselectall()" id="ID" value='<%=cstr(rs("ID"))%>'>
            </td>
            <td width="30" align="center" ><%=rs("ID")%></td>
            <td width="89" align="center" ><%=rs("name")%></td>
            <td  align="center"> <%=rs("sex")%></td>
            <td width="199" align="center"><%=rs("SFZID")%></td>
            
            <td width="193" align="center" > <a href="useredit.asp?ID=<%=rs("ID")%>">�޸�</a> 
              <a href="UserDel.asp?ID=<%=rs("ID")%>" onClick="return ConfirmDel();">ɾ��</a>            </td>
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
      <br> <table width="620" border="0" cellpadding="0" cellspacing="0" class="border" style="border-collapse:collapse">
        <tr class="tdbg"> 
          <form name="searchsoft" method="get" action="usrmanage.asp">
            <td height="30"> <strong>�����û���</strong> <input name="Title" type="text" class=smallInput id="Title" size="10" maxlength="20"> 
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