<%
	Private Function CheckExp(ByVal patrn,ByVal strng)
		Dim regEx,Match
		Set regEx=new regExp
		regEx.Pattern=patrn
		regEx.IgnoreCase=true
		regEx.Global=true
		CheckExp=regEx.Test(strng)
	End Function
	
	'<------*�û���------>
	'����Ӣ����ĸ��Сд&����&�»���,��ʼλ����Ϊ"�»��ߺ�����",����Ϊ(4-Length)λ
	'Length Ϊ�ܳ���
	'IsOrnotUB(ByRef TempStr)
	Public Function CheckUsername(ByVal Username,ByVal Length)
		'�жϳ����Ƿ�����Ч��Χ��
		dim TempLen
		TempLen=UC.strLength(Username,0)
		if TempLen<4 or TempLen>Length then
			CheckUsername=False
			Exit Function
		end if
		call UC.ResetStr()
		dim TempCount
		TempCount=TempCount xor TempCount
		dim TempStr
		TempStr=asc(left(Username,1))
		If TempStr<0 Then
			TempStr=TempStr+65536
		End If
		if TempStr=95 then
			CheckUsername=false
			Exit Function
		end if
		dim TempStr11
		dim TempLenUC
		TempLenUC=len(Username)
		for TempCount=2 to TempLenUC
			TempStr11=mid(Username,TempCount,1)
			if not IsOrnotUB(TempStr11) then
				CheckUsername=false
				Exit Function
			end if
		next
		CheckUsername=true
	End Function
	
	'<------��֤��------>
	'����Ϊ(1-Length)λ,Ӣ����ĸ��Сд&�»���
	'Length Ϊ�ܳ���
	Public Function CheckValication(ByVal Valication,ByVal Length)
		CheckValication=CheckExp("^[0-9]{"&Length&"}$",Valication)
	End Function
	
	'<------��������֤�����Ƿ����------>
	'Bound:[A-Za-z0-9]
	Public Function CheckPasswordUB(ByVal Password1,ByVal Password2,ByVal Length)
		dim i,iasc,istr,ilen
		i=i xor i
		iasc =iasc xor iasc
		for i=1 to Len(Password1)
			istr=mid(passord1,i,1)
			if instr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxya0123456789#@$^&*-_",istr)<1 then
				CheckPasswordUB=false
				Exit Function
			end if
		next
		ilen=ilen xor ilen
		if password1=password2 then
			ilen=UC.strLength(password1,0)
			if ilen<6 or ilen>Length then
				CheckPasswordUB=false
			else
				CheckPasswordUB=true
			end if
		else
			CheckPasswordUB=False
			Exit Function	
		end if	
	End Function
		
	'<------Email------>
	Public Function CheckEmail(ByVal email)
		CheckEmail=CheckExp("^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+(\w)+[.]{0,2}(\w)+$",email)
	End Function

	'<------Birthday------>
	Public Function CheckBirthday(ByVal birth_year1,ByVal birth_month1,ByVal birth_day1)
		if isdate( birth_year1 &"-"& birth_month1 &"-"& birth_day1 ) then
			CheckBirthday=true
			Exit Function
		end if
		CheckBirthday=false
	End Function

	'<------Telephone----->
	Public function CheckTelephone(ByVal Tel)
		CheckTelephone=CheckExp("[0-9]{4,15}",Tel)
	End Function
%>
<%<!-- Copyright By Sniper,All Rights Resolved. -->%>
<%<!-- The following Sentence,in order to this page cannot be made DisorderlyCode by dreamweaver. -->%>
<%<!--<meta http-equiv="Content-Type" content="text/html; charset=gb2312">-->%>