<!--#include file="conn.asp"-->
  <select name="select_t" size="1">
  <option value="0" >请选择查询时间</option>
     <% dim char(20) 
	    i=0
		see=0
	    sql="select * from htgl "
	    set time_rs=server.CreateObject("adodb.recordset")
		time_rs.open sql,conn,1,1
		do while Not time_rs.EOF 
		
		for j=0 to i
		
		 if char(j) = Day(time_rs("ht_sxrq")) then 
		 
		 see=1
		  
         exit for
		 
		 else 
		 
		 see = 0
		 
		 end if
		 
		 next
		 
		 if see=0 then 
		 char(i)=Day(time_rs("ht_sxrq"))
		
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
    <input type="submit" name="Submit1" value="查询" />
  <input type="reset" name="Submit1" value="重置" />