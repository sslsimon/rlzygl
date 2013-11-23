<%
	Private Conf_ExtName_01	'允许的文件类型库
	Conf_ExtName_01=".jpg|.gif|.png"

'01/允许文件类型过滤__________________________________________________________________
'	调用格式：
'	Call IsAllowableFile(".jpg",Conf_ExtName_01)
	'                                      +被验证的文件类型      +允许的文件类型库	
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
'01/允许文件类型过滤__________________________________________________________________

'	<!-- Copyright By Sniper,All Rights Resolved. -->
'	<!--<meta http-equiv="Content-Type" content="text/html; charset=gb2312">-->
%>