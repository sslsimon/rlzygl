<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!-- #include file="BGMConn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<% 


        Set excconn=Server.CreateObject("ADODB.Connection")  
   
        excStrConn= "Driver={Microsoft Excel Driver (*.xls)};DBQ="&request("file") 
	  
      
	      excconn.Open  excStrConn
	
           '查询excel语句
	
	       Set excrs = Server.CreateObject("ADODB.Recordset") 
	 
	       excSql="select * from [Sheet1$]"
	  
	
	  
   
     	    excrs.Open excSql,excconn,2,2  
	
		  
      
       
			
		
          do while Not excrs.EOF 
		
		      
		
	          sql="select * from namesfz where name='"&excrs(0)&"'"
			  
			
			'response.write  excrs(0)
		 
	          set rs=server.createObject("ADODB.Recordset")
			  
		       rs.open sql,conn,1,1
		
			    
				
				
				
				
				
				
				 if Not rs.EOF then '此用户存在
				
				
			  
		         'response.write  rs("id")
		
                   flat=0
			        'if not rs.eof  then
			          'j=0
			       sql1="select * from jhgz where name='"&excrs(0)&"'"
			
		           set rs1=server.CreateObject("adodb.recordset") 

                    rs1.open sql1,conn,1,3 
 
                  
			        do while Not rs1.EOF 
				  
  if year(date())= year(rs1("time"))  and  month(rs1("time"))=month( year(date())&"-"&request("month_gz")&"-"&day(date()))  then
				     
		  flat=1
					
                                    for t_i=1  to  3
 

                              
							   
                                    rs1(t_i+21) = excrs(t_i)
									
                                
  
                                    next 
									
								 
                               rs1.update 
							 'response.write rs1(2)  
                       ' response.write "<script>alert('更新成功！');location.href='gzmanage.asp';<'/script>" 
		
				      end if
				   
				     rs1.movenext
				     loop
				   
				    set rs1=nothing 
				   
				     
				  
			       if flat <> 1  then
				   
				   sql2="select * from qit"
				   
				    set rs2=server.CreateObject("adodb.recordset") 

                    rs2.open sql2,conn,1,3
					rs2.addnew
					rs2("name")=excrs(0)
					rs2("xm")=excrs(1)
					rs2("je")=excrs(2)
				    rs2.update
					rs2.close
					set rs2=nothing
					end  if 

				
				
				
				
				 else  '此用户不存在
				 
				   'response.write excrs(0)
				   
				   sql="select * from cunzainame "
		 
	               set jhgz_rs=server.createObject("ADODB.Recordset")
		          
				   jhgz_rs.open sql,conn,1,3	
				   jhgz_rs.addnew
				   jhgz_rs("name")=excrs(0)
				   jhgz_rs.update
				  
				   ' response.write jhgz_rs("name")
					
				  jhgz_rs.close
				  
				   set jhgz_rs=nothing
                end if  '
				
				
				
				
				
				
				
				  
			 rs.close
			 
			  set rs=nothing
			  
				excrs.MoveNext
         Loop
        


    excrs.close
	
    set excrs=nothing
	
    excConn.close
	
    set excConn=nothing
	
	
	flatt=0  
	
	set cunzai_rs=server.createObject("ADODB.Recordset")
		
		    cunsql="select * from cunzainame "
			
			 cunzai_rs.open cunsql,conn,1,1
			 
			 if Not cunzai_rs.EOF  then
			 flatt=flatt+1
			
			%>

<table width="100%" border="1" cellspacing="0" cellpadding="0">

<tr><td align="center"> 以下用户没有注册！数据没有存入数据库！</td></tr>			

<% do while Not cunzai_rs.EOF %>
			 <tr>
			<td><%= cunzai_rs(1)%></td>
			
			</tr>
			 
			 <%
			 cunzai_rs.MoveNext
			 loop
	
			' response.write "以下用户没有注册！数据没有存入数据库！"
			
			%>
	</table>		
			
	<%	'else 	 
			 'response.write "数据全部存入数据库！"
	end if 	 
 cunzai_rs.close
 
 
 
 set qit_rs=server.createObject("ADODB.Recordset")
		
		    qitsql="select * from qit "
			
			 qit_rs.open qitsql,conn,1,1
			 
			 if Not qit_rs.EOF  then
			 
			flatt=flatt+1
			%>

<table width="100%" border="1" cellspacing="0" cellpadding="0">

<tr><td colspan="3" align="center"> 以下用户&nbsp;<%=request("month_gz")%>&nbsp;月的主工资单还没有存入数据库，请先存主工资单，再添加其他工资单,其他用户数据已经存入数据库！</td></tr>			

<% do while Not qit_rs.EOF %>
			 <tr>
			 <td><%= qit_rs(1)%></td>
			<td><%= qit_rs(2)%></td>
			<td><%= qit_rs(3)%></td>
			</tr>
			 
			 <%
			 qit_rs.MoveNext
			 loop
	
			' response.write "以下用户没有注册！数据没有存入数据库！"
			
			%>
	</table>		
			
	<%	'else 	 
			 'response.write "数据全部存入数据库！"
	end if 	 
 qit_rs.close
 
 set  qit_rs= nothing 
 
 if flatt = 0 then
 
  response.write "<script>alert('全部用户数据都存入数据库！');location.href='gzmanage.asp';</script>" 

 end if
	
set rss=server.createobject("adodb.recordset")
	
sql="delete from cunzainame "

rss.open sql,conn,1,1

set rss=nothing

set rss=server.createobject("adodb.recordset")
	
sql="delete from qit "

rss.open sql,conn,1,1

set rss=nothing
    conn.close
    set conn=nothing


 %>

</body>
</html>
