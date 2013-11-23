<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!-- #include file="BGMConn.asp" -->
<!-- #include file="LIB/md5.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<%  'excpath="Database/Book2.xls"
     'excpath=request("file") 
	 
	
  
    Set excconn=Server.CreateObject("ADODB.Connection")  
   
      excStrConn= "Driver={Microsoft Excel Driver (*.xls)};DBQ="& request("file")
	  
    excconn.Open  excStrConn
	
     '查询excel语句
	
	 Set excrs = Server.CreateObject("ADODB.Recordset") 
	 
	 excSql="select * from [080927$]"
	  
	
	  
    excrs.Open excSql,excconn,2,2  
	
		
		 do while Not excrs.EOF 
		 
		set rs=server.createObject("ADODB.Recordset")
		
		sfz=excrs(3)
      
        sql="select * from namesfz where SFZID='"&sfz&"'"
		
        rs.open sql,conn,1,3
		 
		 if  rs.EOF then 
		 
           ' do while Not excrs.EOF 
                rs.addnew
				
                    for i=1 to excrs.Fields.Count-1
                        
						rs(i)=excrs(i)
						
                    next
					rs("PassWord")=md5("123456") 
                rs.update
		else 
		set cunzai_rs=server.createObject("ADODB.Recordset")
		
		   cunsql="select * from cunzainame "
		
          cunzai_rs.open cunsql,conn,1,3
		
			cunzai_rs.addnew
				
                   
                        
						cunzai_rs("name")=excrs(1)
						
						cunzai_rs("sfzid")=excrs(3)
                   
					 
                cunzai_rs.update
				cunzai_rs.close	
			end if
				
                excrs.MoveNext
            Loop
        rs.close
        set rs=nothing
		
		set cunzai_rs=server.createObject("ADODB.Recordset")
		
		    cunsql="select * from cunzainame "
			
			 cunzai_rs.open cunsql,conn,1,1
			%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">

<% do while Not cunzai_rs.EOF %>
			 <tr>
			<td><%= cunzai_rs(1)%></td>
			<td><%= cunzai_rs(2)%></td>
			</tr>
			 
			 <%
			 cunzai_rs.MoveNext
			 loop
			 response.write "数据导入成功！以下用户已经存在。"
		 
 cunzai_rs.close
 
 set excrs=nothing
   
    set  cunzai_rs=nothing
    excConn.close
    set excConn=nothing
	
	
	set rss=server.createobject("adodb.recordset")
	
sql="delete from cunzainame "

rss.open sql,conn,1,1

set rss=nothing
    conn.close
    set conn=nothing
   
	
	
	%>


</body>
</html>
