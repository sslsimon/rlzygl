


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
	
		    set rs=server.createObject("ADODB.Recordset")
      
       
		
          do while Not excrs.EOF 
		
		      flat = 0
		
	          sql="select * from namesfz where name='"&excrs(0)&"'"
		 
	          set rs=server.createObject("ADODB.Recordset")
		       rs.open sql,conn,1,1
		
			    
				
				
				
				
				
				
				 if not rs.EOF then '此用户存在
				
				
			  
		         'response.write  rs("id")
		
              
			        'if not rs.eof  then
			          'j=0
			       sql1="select * from jhgz where name='"&rs("name")&"'"
			
		           set rs1=server.CreateObject("adodb.recordset") 

                    rs1.open sql1,conn,1,3 
 
                  
			        do while Not rs1.EOF 
				  
if year(date())= year(rs1("time"))  and  month(rs1("time"))=month( year(date())&"-"&request("month_gz")&"-"&day(date()))  then
				     
		flat = 1		  
					
                                    for t_i=1  to  19
 

                              
							   
                                    rs1(t_i+1) = excrs(t_i)
									
                                
  
                                    next 
									
								 rs1("time") =( year(date())&"-"&request("month_gz")&"-"&day(date()))
                               rs1.update 
							 'response.write rs1(2)  
                       ' response.write "<script>alert('更新成功！');location.href='gzmanage.asp';<'/script>" 
		
				      end if
				   
				     rs1.movenext
				     loop
				   
				   

             if flat<>1 then
			 
                  rs1.addnew
  
                     for t=0 to 19
 

                   
                    rs1(t+1)=excrs(t)
                   
  
                    next 
  
                  rs1("time") =( year(date())&"-"&request("month_gz")&"-"&day(date()))
 
                  			
                 rs1.update 

                  
                 end if
				 
                 rs1.close 
				  
				  set rs1=nothing 
				   
				 '  response.write "<script>alert('添加成功！');location.href='gzmanage.asp';</'script>" 
				  
			
				

				
				
				
				 else  '此用户不存在
				 
				    sql="select * from cunzainame "
		 
	               set jhgz_rs=server.createObject("ADODB.Recordset")
		          
				   jhgz_rs.open sql,conn,1,3	
				   jhgz_rs.addnew
				   jhgz_rs("name")=excrs(0)
				   jhgz_rs.update
				  
				   ' response.write jhgz_rs("name")
					
				  jhgz_rs.close
				  
				  
                end if  '
				
				
				
				
				
				
				
				  
			 rs.close
				excrs.MoveNext
         Loop
        
        set rs=nothing
 set jhgz_rs=nothing
    excrs.close
    set excrs=nothing
    excConn.close
    set excConn=nothing
	
	
	
	
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
</table>		 
			 <%
			 cunzai_rs.MoveNext
			 loop
			 response.write "以下用户没有注册！数据没有存入数据库！"
		 
 cunzai_rs.close
	
	set rss=server.createobject("adodb.recordset")
	
sql="delete from cunzainame "

rss.open sql,conn,1,1

set rss=nothing
    conn.close
    set conn=nothing


 %>
</body>
</html>
