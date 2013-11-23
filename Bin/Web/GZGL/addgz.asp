<% 
if  session("AdminLogin") <> true then 
response.Redirect "ALogin.asp" 
else 
%>
<!-- #include file="BGMConn.asp" -->
<!-- #include file="LIB/md5.asp" -->
<% 
if request("act")="xg" then 

 flat=0

            sql="select * from namesfz where name='"&request("gz1")&"'"
            set rs=server.CreateObject("adodb.recordset") 
             rs.open sql,conn,1,1 

            if rs.eof then 
 
                         rs.close
                        set rs=nothing
 
                   response.write "<script>alert('此用户不存在！');location.href='gzmanage.asp';</script>" 

             else



                     sql1="select * from jhgz where name='"&rs("name")&"'"


 
                    set rs1=server.CreateObject("adodb.recordset") 

                    rs1.open sql1,conn,1,3 
 
                  
			       do while Not rs1.EOF 
				  
if year(date())= year(rs1("time"))  and  month(rs1("time"))=month( year(date())&"-"&request("month_gz")&"-"&day(date()))  then
				     
		flat = 1		  
					
                                   for t_i=2  to  20
 

                               if request("gz"&t_i)<>"" then  
							   
                                    rs1(t_i) = request("gz"&t_i)
									
                                 end if 
  
                                next 
								
								 rs1(22) = request("gz21")
								 rs1(23) = request("gz22")
								 rs1(24) = request("gz23")
								
                               rs1.update 
							' response.write rs1(2)  
                        response.write "<script>alert('更新成功！');location.href='gzmanage.asp';</script>" 
		
				      end if
				   
				     rs1.movenext
				     loop
				   
				   

if flat<>1 then
                  rs1.addnew
  
                  for t=1 to 20
 

                    if request("gz"&t)<>"" then 
                    rs1(t)=request("gz"&t)
                    end if 
  
                    next 
  
                  rs1("time") =( year(date())&"-"&request("month_gz")&"-"&day(date()))
 
                  	 rs1(22) = request("gz21")
					 rs1(23) = request("gz22")
					 rs1(24) = request("gz23")		
                 rs1.update 

                   rs1.close 
end if
                
				  set rs1=nothing 
				   response.write "<script>alert('添加成功！');location.href='gzmanage.asp';</script>" 
				  
			
				
				end if
				
 rs.close
 set rs=nothing
else 




%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
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
<form name="form1" method="post" action="addgz.asp?act=xg" >
  <table width="990" border="1" cellspacing="0" cellpadding="0"  bordercolor="#CCCCCC" style="border-collapse:collapse">
    <tr>
      <td colspan="20"><div align="center"><span class="STYLE1">添加工资单 </span></div></td>
    </tr>
    <tr>
      <td width="48">姓名</td>
      <td width="46">保留工资</td>
      <td width="47">岗位津贴</td>
      <td width="47">职岗津贴</td>
      <td width="47">综合补贴</td>
      <td width="47">薪级工资</td>
      <td width="43">课金</td>
      <td width="48">应发小计</td>
      <td width="55">养老保险</td>
      <td width="43">医疗金</td>
      <td width="48">失业金</td>
      <td width="48">公积金</td>
      <td width="48">工会费</td>
      <td width="43">房租</td>
      <td width="43">水电费</td>
      <td width="43">所得税</td>
      <td width="43">扣除小计</td>
      <td width="43">实发工资</td>
      <td width="48">银行上卡</td>
      <td width="70">备注</td>
    </tr>
    <tr>
      <td align="center"><input name="gz1" type="text"  size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz2" type="text"  size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz3" type="text"  size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz4" type="text"  size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz5" type="text"  size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz6" type="text"  size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz7" type="text"  size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz8" type="text"  size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz9" type="text" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz10" type="text"  size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz11" type="text"  size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz12" type="text" size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz13" type="text"  size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz14" type="text"  size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz15" type="text"  size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz16" type="text"  size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz17" type="text"  size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz18" type="text"  size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz19" type="text"  size="5" maxlength="5">
        &nbsp;</td>
      <td align="center"><input name="gz20" type="text"  size="5" maxlength="5">
        &nbsp;</td>
    </tr>
	
	
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
	  <td align="center" colspan="2"><input name="gz21" type="text"  size="10" maxlength="5"></td>
	   <td align="center" colspan="2"><input name="gz22" type="text"  size="10" maxlength="5"></td>
	   <td align="center" colspan="2"><input name="gz23" type="text"  size="10" maxlength="5"></td>
      <td colspan="14">&nbsp;</td>
    </tr>
	
    <tr>
      <td colspan="20"><p align="center"> 请选择工资表时间
          <select name="month_gz" size="1">
            <%for month_i =1 to 12 %>
            <option value="<%=month_i %>"><%=month_i %></option>
            <% next %>
          </select>
          <label>
          <input type="submit" name="Submit" value="添加">
          </label>
          <label>
          <input type="reset" name="Submit2" value="重置">
          </label>
        </p></td>
    </tr>
  </table>
</form>
<% 
end if 

conn.close 
set conn=nothing 
%>
<% 
end if 
%>
</body>
</html>
