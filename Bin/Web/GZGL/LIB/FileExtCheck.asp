<%
	Private Conf_ExtName_01	'������ļ����Ϳ�
	Conf_ExtName_01=".jpg|.gif|.png"

'01/�����ļ����͹���__________________________________________________________________
'	���ø�ʽ��
'	Call IsAllowableFile(".jpg",Conf_ExtName_01)
	'                                      +����֤���ļ�����      +������ļ����Ϳ�	
	Private Function IsAllowableFile(ByRef BeCheckedExtName,ByVal AllowableExtNameArray)
		Dim i,ii
		BeCheckedExtName=LCase(BeCheckedExtName)
		AllowableExtNameArray=LCase(AllowableExtNameArray)
		AllowableExtNameArray=Split(AllowableExtNameArray,"|")
		For i=0 To UBound(AllowableExtNameArray)
			If AllowableExtNameArray(i)=BeCheckedExtName Then
				IsAllowableFile=True
				Exit Function
			End If
		Next
		IsAllowableFile=False
	End Function
'01/�����ļ����͹���__________________________________________________________________

'	<!-- Copyright By Sniper,All Rights Resolved. -->
'	<!--<meta http-equiv="Content-Type" content="text/html; charset=gb2312">-->
%>