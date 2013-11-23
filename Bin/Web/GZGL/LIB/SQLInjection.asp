<%
'//*****************数据安全过滤******************//
'	TSNum 要进行过滤的Resquest数据
'	ISNum 0字符1数值
'	ISNol 0不允许为空,1允许为空
function insql(tsnum,isnum,isnol)
	if instr(tsnum,",")or instr(tsnum,"'") or instr(tsnum,"%") or instr(tsnum,";") or instr(tsnum,chr(33)) or instr(tsnum," ") then
		insql="true"
		exit function
	end if
	if instr(tsnum,"*") or instr(tsnum,"/") or instr(tsnum,"\") or instr(tsnum,"-")or instr(tsnum,"+")then
		insql="true"
		exit function
	end if
	if isnum=1 and isnol=0 then
		if isnumeric(tsnum)=false then
			insql="true"
			exit function
		end if 
	end if
	if isnol=0 and cstr(tsnum)="" then
		insql="true"
		exit function
	end if
	insql="false"
end function
%>