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
 response.write "<script>alert(' 修改成功！');location.href='gzmanage.asp';</script>" 
 
else 

set rs=server.CreateObject("adodb.recordset") 

sql="select * from jhgz where ID="&request("ID")

rs.open sql,conn,1,1 


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改密码</title>
</head>
<style type="text/css">
<!--
body,td,th {
	font-family: 宋体;
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
	  <div align="center"><span class="STYLE1">修改工资单 </span></div></td>
	</tr>
  
    <tr>
      <td width="53">姓名</td>
      <td width="53">保留工资</td>
      <td width="53">岗位津贴</td>
      <td width="53">职岗津贴</td>
      <td width="53">综合补贴</td>
      <td width="53">薪级工资</td>
      <td width="43">课金</td>
      <td width="54">应发小计</td>
      <td width="64">养老保险</td>
      <td width="44">医疗金</td>
      <td width="54">失业金</td>
      <td width="54">公积金</td>
      <td width="54">工会费</td>
      <td width="34">房租</td>
      <td width="44">水电费</td>
      <td width="44">所得税</td>
      <td width="34">扣除小计</td>
      <td width="34">实发工资</td>
      <td width="54">银行上卡</td>
      <td width="74">备注</td>
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
      <td colspan="20" >其他费用明细 </td>
    </tr>
	
	 <tr>
	  <td align="center" colspan="2">项目</td>
	   <td align="center" colspan="2">金额</td>
	   <td align="center" colspan="2">银行</td>
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
      <input type="submit" name="Submit" value="修改">
      </label>
      <label>
      <input type="reset" name="Submit2" value="重置">
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
