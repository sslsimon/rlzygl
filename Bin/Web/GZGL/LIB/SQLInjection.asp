<%
'//*****************���ݰ�ȫ����******************//
'	TSNum Ҫ���й��˵�Resquest����
'	ISNum 0�ַ�1��ֵ
'	ISNol 0������Ϊ��,1����Ϊ��
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