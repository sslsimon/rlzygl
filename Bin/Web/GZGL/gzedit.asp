<% 
if  session("AdminLogin") <> true then 
response.Redirect "index.asp" 
else 
%>
<!-- #include file="BGMConn.asp" -->
<!-- #include file="LIB/md5.asp" -->
<% 
if request("act")="xg" then 
sql1="select * from jhgz where ID="&request("ID")

 
set rs1=server.CreateObject("adodb.recordset") 
rs1.open sql1,conn,1,3 

for t=2 to 20
 

  if request("gz"&t)<>"" then 
  rs1(t)=request("gz"&t)
  end if 
  
  next 
  
 rs1(22) = request("gz21")
 rs1(23) = request("gz22")
 rs1(24) = request("gz23")
 
 rs1.update 
' response.write rs1("sex")
rs1.close 

set rs1=nothing 
 response.write "<script>alert(' �޸ĳɹ���');location.href='gzmanage.asp';</script>" 
 
else 

set rs=server.CreateObject("adodb.recordset") 

sql="select * from jhgz where ID="&request("ID")

rs.open sql,conn,1,1 


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�޸�����</title>
</head>
<style type="text/css">
<!--
body,td,th {
	font-family: ����;
	font-size: 12px;
	color: #000000;
}
.STYLE1 {
	font-size: 16px;
	font-weight: bold;
}


-->
</style>
<body>

<form name="form1" method="post" action="gzedit.asp?act=xg&ID=<%=rs("id")%>" >
  <table width="990" border="1" cellspacing="0" cellpadding="0"  bordercolor="#CCCCCC" style="border-collapse:collapse">
  
  <tr>
	<td colspan="20">
	  <div align="center"><span class="STYLE1">�޸Ĺ��ʵ� </span></div></td>
	</tr>
  
    <tr>
      <td width="53">����</td>
      <td width="53">��������</td>
      <td width="53">��λ����</td>
      <td width="53">ְ�ڽ���</td>
      <td width="53">�ۺϲ���</td>
      <td width="53">н������</td>
      <td width="43">�ν�</td>
      <td width="54">Ӧ��С��</td>
      <td width="64">���ϱ���</td>
      <td width="44">ҽ�ƽ�</td>
      <td width="54">ʧҵ��</td>
      <td width="54">������</td>
      <td width="54">�����</td>
      <td width="34">����</td>
      <td width="44">ˮ���</td>
      <td width="44">����˰</td>
      <td width="34">�۳�С��</td>
      <td width="34">ʵ������</td>
      <td width="54">�����Ͽ�</td>
      <td width="74">��ע</td>
    </tr>
    <tr>
      <td align="center"><input name="gz1" type="text" value="<%=rs(1)%>" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz2" type="text" value="<%=rs(2)%>" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz3" type="text" value="<%=rs(3)%>" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz4" type="text" value="<%=rs(4)%>" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz5" type="text" value="<%=rs(5)%>" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz6" type="text" value="<%=rs(6)%>" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz7" type="text" value="<%=rs(7)%>" size="5" maxlength="5">
	  
        &nbsp;</td>
		<td align="center"><input name="gz8" type="text" value="<%=rs(8)%>" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz9" type="text" value="<%=rs(9)%>" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz10" type="text" value="<%=rs(10)%>" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz11" type="text" value="<%=rs(11)%>" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz12" type="text" value="<%=rs(12)%>" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz13" type="text" value="<%=rs(13)%>" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz14" type="text" value="<%=rs(14)%>" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz15" type="text" value="<%=rs(15)%>" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz16" type="text" value="<%=rs(16)%>" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz17" type="text" value="<%=rs(17)%>" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz18" type="text" value="<%=rs(18)%>" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz19" type="text" value="<%=rs(19)%>" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz20" type="text" value="<%=rs(20)%>" size="5" maxlength="5">
        &nbsp;</td>
     
    </tr>
	<tr>
	
	 <tr>
      <td colspan="20"  height="30">&nbsp;</td>
    </tr>
	
	 <tr>
      <td colspan="20" >����������ϸ </td>
    </tr>
	
	 <tr>
	  <td align="center" colspan="2">��Ŀ</td>
	   <td align="center" colspan="2">���</td>
	   <td align="center" colspan="2">����</td>
      <td colspan="14">&nbsp;</td>
    </tr>
	
	
	 <tr>
	  <td align="center" colspan="2"><input name="gz21" type="text" value="<%=rs(22)%>" size="10" maxlength="5"></td>
	   <td align="center" colspan="2"><input name="gz22" type="text"   value="<%=rs(23)%>" size="10" maxlength="5"></td>
	   <td align="center" colspan="2"><input name="gz23" type="text"   value="<%=rs(24)%>" size="10" maxlength="5"></td>
      <td colspan="14">&nbsp;</td>
    </tr>
	
	
	
	
	
	<td colspan="20">
	<p align="center">
      <label>
      <input type="submit" name="Submit" value="�޸�">
      </label>
      <label>
      <input type="reset" name="Submit2" value="����">
      </label>
    </p>
	</td>
	</tr>
	
	
    
  </table>
</form>
<% 
end if 
rs.close 
conn.close 
set rs=nothing 

set conn=nothing 
%>
<% 
end if 
%>
</body>
</html>
