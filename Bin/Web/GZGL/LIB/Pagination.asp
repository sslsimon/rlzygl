<%
	Class Pagination
		Rem ��Ա����______________________________________________________________________________________________
					'PTitle-��Ŀ��������;PJumpFileName-��תҳ���ļ���(һ��Ϊ���ļ���);
					'PModQueryStr-(��ĳһ��¼����ʱ);PJumQueryStr-(��תҳ��ʱ)[�м�ֵ����]
					'PPageSize-��ǰҳ���¼��;PAbsolutePage-��ǰҳ��
					'PCurrentAmount-ǰ��ҳ���¼��
					'PSPPCount(PSonPerPageCount)-��ҳ[һҳ����ҳ��];(PFPAmount)-��ҳ[ҳ�������]
		Public PTitle,PJumpFileName,PModQueryStr,PJumQueryStr,PPageSize,PAbsolutePage,PCurrentAmount,PSPPCount,PFPAmount
					'PFieldArray-��Ž�Ҫ��ʾ���ݿ���ֶ�(����|�ֶ�����|�����ʾ����< Such as 50% >);PFieldCount-��Ž�Ҫ��ʾ���ݿ���ֶεĸ���
		Public PFieldArray,PFieldCount
					'PRst-�ڲ����ݼ�;PSqlStr-�ڲ���ѯ���
		Public PRst,PSqlStr,PRstIsNull
					'PA_First,PA_Previous,PA_Next,PA_Last����ͷͼƬHTML����
					'PTdArrow-��ת��ť��ʽ(ͼƬ) 1;PTdHand-��ת��ť��ʽ(ͼƬ) 2;PTdFontHand-��ת��ť��ʽ(����) 3
		Private PA,PA_First,PA_Previous,PA_Next,PA_Last,PTdArrow,PTdHand,PTdFontArrow
		Private PJumpArray()
		Rem ��ʼ��________________________________________________________________________________________________
		Private Sub Class_Initialize()
			PA="<a href='$FileName?PAbsolutePage=$PageNumber$QueryStr'>$AContent</a>"
			PA_First="<img src=""images/First.gif"" width=""9"" height=""8"" border=""0"">"
			PA_Previous="<img src=""images/Previous.gif"" width=""8"" height=""8"" border=""0"">"
			PA_Next="<img src=""images/Next.gif"" width=""8"" height=""8"" border=""0"">"
			PA_Last="<img src=""images/Last.gif"" width=""9"" height=""8"" border=""0"">"	
			PTdArrow="<td title=""#title"" onMouseOver=""javascript:eval(PonMouseOverArrow);"" onMouseOut=""javascript:eval(PonMouseOutArrow);"" width=""16"" align=""center"" valign=""middle"" bgcolor=""#EEEEEE"">$</td>"
			PTdHand="<td title=""#title"" onMouseOver=""javascript:eval(PonMouseOverHand);"" onMouseOut=""javascript:eval(PonMouseOutHand);"" width=""16"" align=""center"" valign=""middle"" bgcolor=""#EEEEEE"">$</td>"
			PTdFontArrow="<td title=""#title""onMouseOver=""javascript:this.style.cursor='arrow';"" width=""16"" align=""center"" valign=""middle"" bgcolor=""#DDDDDD"">$</td>"
			PAbsolutePage=1
			Set PRst=Server.CreateObject("ADODB.RECORDSET")	'�����ݼ�
		End Sub
		Rem ���̶���______________________________________________________________________________________________
		Public Sub PInit()	'��ʼ��
			PRst.Open PSqlStr,Conn,1,1
			If PRst.Eof Then
				PRstIsNull=True
			Else
				PRstIsNull=False
			End If
			Call PShowMe()
		End Sub
		Private Sub PShowMe()	'��ʾ
			Call PShowTitle(PTitle)
			If Not PRst.Eof Then
				Call PShowBody()
'				Call PShowJump()	�����в�ѯ����,���ｫ�����������
			Else
				Response.Write "<br><br><center>û�����ݣ�������ӣ�</center><br><br>"
			End If
		End Sub
		Private Sub PShowTitle(ByVal titleTitle)	'��ʾ������Ŀ��������
			Response.Write "<table width=""98%"" height=""25"" border=""0"" align=""center"" cellpadding=""0"" cellspacing=""1"" bgcolor=""#D6B69C"">"
			Response.Write "<tr>"
			Response.Write "<td align=""center"" background=""images/BodyMenu.jpg"">��<strong>" & titleTitle & "</strong>��</td>"
			Response.Write "</tr>"
			Response.Write "</table>"
		End Sub
		Private Sub PShowBody()	'��ʾ�б�
			PAbsolutePage=Request("PAbsolutePage")
			PRst.PageSize=PPageSize	
			'��ȫ����
			If Len(PAbsolutePage)<1 Or len(PAbsolutePage)>9 Then
				'���Ȳ���ȷ
				PAbsolutePage=1
			Else
				If Isnumeric(PAbsolutePage)	Then
					If Abs(PAbsolutePage)>PRst.PageCount then
					'������ҳ
						PAbsolutePage=PRst.PageCount
					Else
					'С����ҳ
						If PAbsolutePage<=0 Then
							PAbsolutePage=1
						Else
							PAbsolutePage=Clng(PAbsolutePage)
						End If
					End If
				Else
				'������ֵ
					PAbsolutePage=1
				End If
			End If
			PRst.Absolutepage=PAbsolutePage
			Response.Write "<table width=""98%"" height=""25"" border=""0"" align=""center"" cellpadding=""0"" cellspacing=""1"" bgcolor=""#D6B69C"" class=""TD9-18"">"
				Response.Write "<tr bgcolor=""#FEFEFE"">"
			Dim i
			i=i Xor i
			Do While i<=Ubound(PFieldArray)-1
					Response.Write "<td width=""" & PFieldArray(i,2) & """ align=""center"" bgcolor=""#F5F5F5"">" & PFieldArray(i,0) & "</td>"
				i=i+1
			Loop
				Response.Write "</tr>"
			PCurrentAmount=PCurrentAmount xor PCurrentAmount
			Do While PCurrentAmount<PRst.PageSize And Not PRst.Eof
				Response.Write "<tr bgcolor=""#F0F0F0"" onMouseOver=""javascript:eval(LonMouseOver);"" onMouseOut=""javascript:eval(LonMouseOut);"">"
					i=i Xor i
					Do While i<Ubound(PFieldArray)-1
						If i<>1 Then
							Response.Write "<td width="""&PFieldArray(i,2)&""" align=""center"">"&PRst(PFieldArray(i,1))&"</td>"
						Else
							Response.Write "<td width="""&PFieldArray(i,2)&""" align=""left"">"&"��"&Left(PRst(PFieldArray(i,1)),27)&"</td>"
						End if
						i=i+1
					Loop
					Response.Write"<td  align=""center"">"
					Response.Write"<a href=" & PJumpFileName & "?action=edit&id=" & Cstr(PRst("ID")) & "&PAbsolutePage=" & PAbsolutePage & PModQueryStr & "><font color=""#FF0000"">�޸�</font></a>"
					Response.Write" || "
					Response.Write"<a href=" & PJumpFileName & "?action=del&id=" & Cstr(PRst("ID")) & "&PAbsolutePage=" & PAbsolutePage & PModQueryStr & "><font color=""#FF0000"">ɾ��</font></a>��"
					Response.Write"</td>"
					Response.Write"</tr>"
				PCurrentAmount=PCurrentAmount+1
				PRst.MoveNext
			Loop
			Response.Write "</table>"
		End Sub
		Public Sub PShowJump()	'��ʾҳ����ת
			Dim i,PJumpArray(),PJumpStart,PJumpEnd
			Redim PJumpArray(PSPPCount+1)
			i=i Xor i
			Do While i<=PSPPCount+1
				PJumpArray(i)=0
				i=i+1
			Loop
			PFPAmount=PRst.PageCount\PSPPCount
			PJumpStart=(PAbsolutePage\PSPPCount)*PSPPCount+1
			If (PAbsolutePage Mod PSPPCount)=0 Then
				PJumpStart=PJumpStart-PSPPCount
			End If
			PJumpArray(0)=PJumpStart-1
			i=1
			Do While i<=PSPPCount+1
					If (PJumpArray(i-1)+1)<=PRst.PageCount Then
						PJumpArray(i)=PJumpStart+i-1
						If (PJumpArray(i-1)+1)=PRst.PageCount Then
							PJumpEnd=PJumpArray(i)
							Exit Do
						End If
						PJumpEnd=PJumpArray(i-1)
					End If
					i=i+1
			Loop
			If Not PRstIsNull Then
				Response.Write "<table border=""0"" cellpadding=""0"" cellspacing=""0"">"
				Response.Write "<tr>"
				Response.Write "<td bgcolor=""#F0F0F0"">"
				'<!--��ҳ��Ϣ��ʾ����-->
				Response.Write "<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""1"" bgcolor=""#FFFFFF"" class=""TD9-18"">"
				Response.Write "<tr>"
				Response.Write "<td onMouseOver=""javascript:eval(PIonMouseOver);"" onMouseOut=""javascript:eval(PIonMouseOut);"" title=""�ܼ�¼��:"&PRst.RecordCount&""" align=""center"" bgcolor=""#EEEEEE"">"
				Response.Write "&nbsp;" & PRst.RecordCount &"&nbsp;"
				Response.Write "</td>"
				Response.Write "<td onMouseOver=""javascript:eval(PIonMouseOver);"" onMouseOut=""javascript:eval(PIonMouseOut);"" title=""��ǰҳ���ܼ�¼��:" & PCurrentAmount & """ align=""center"" bgcolor=""#EEEEEE"">"
				Response.Write "&nbsp;" & PCurrentAmount &"&nbsp;"
				Response.Write "</td>"
				Response.Write "<td onMouseOver=""javascript:eval(PIonMouseOver);"" onMouseOut=""javascript:eval(PIonMouseOut);"" title=""��ǰҳ��:" & PAbsolutePage & "/��ҳ��:" & PRst.PageCount & """ align=""center"" bgcolor=""#EEEEEE"">"
				Response.Write "&nbsp;" & PAbsolutePage & "/" & PRst.PageCount & "ҳ&nbsp;"
				Response.Write "</td>"
				Response.Write "</tr>"
				Response.Write "</table>"
				'<!--��ҳ��Ϣ��ʾ����-->
				Response.Write "</td>"
				Response.Write "<td>&nbsp;</td>"
				Response.Write "<td bgcolor=""#F0F0F0"">"
				'<!--��ҳ��ת����[Arrow]-->
				Response.Write "<table height=""18"" border=""0"" cellpadding=""0"" cellspacing=""1"" bgcolor=""#FFFFFF"" class=""TD9-18"">"
				Response.Write "<tr>"
				Dim PTempStr
				If PJumpArray(0)<>0 Then
					PTempStr=Replace(PA,"$AContent",PA_First)
					PTempStr=Replace(PTempStr,"$FileName",PJumpFileName)
					PTempStr=Replace(PTempStr,"$PageNumber",1)
					PTempStr=Replace(PTempStr,"$QueryStr",PJumQueryStr)
					PTempStr=Replace(PTdHand,"$",PTempStr)
					PTempStr=Replace(PTempStr,"#title","��ҳ")
					Response.Write PTempStr
				Else
					PTempStr=Replace(PTdArrow,"$",PA_First)
					PTempStr=Replace(PTempStr,"#title","")
					Response.Write PTempStr
				End If
				'ǰPSPPCountҳ
				If PJumpArray(0)<>0 Then
					PTempStr=Replace(PA,"$AContent",PA_Previous)
					PTempStr=Replace(PTempStr,"$FileName",PJumpFileName)
					PTempStr=Replace(PTempStr,"$PageNumber",PAbsolutePage-PSPPCount)
					PTempStr=Replace(PTempStr,"$QueryStr",PJumQueryStr)
					PTempStr=Replace(PTdHand,"$",PTempStr)
					PTempStr=Replace(PTempStr,"#title","ǰ " & PSPPCount & " ҳ")
					Response.Write PTempStr
				Else
					PTempStr=Replace(PTdArrow,"$",PA_Previous)
					PTempStr=Replace(PTempStr,"#title","")
					Response.Write PTempStr
				End If
				'ҳ������
				i=i Xor i
				For i=1 to PSPPCount
					If PJumpArray(i)<>0 Then
						If PJumpArray(i)<>PAbsolutePage Then
							PTempStr=Replace(PA,"$AContent","&nbsp;" & PJumpArray(i) & "&nbsp;")
							PTempStr=Replace(PTempStr,"$FileName",PJumpFileName)
							PTempStr=Replace(PTempStr,"$PageNumber",PJumpArray(i))
							PTempStr=Replace(PTempStr,"$QueryStr",PJumQueryStr)
							PTempStr=Replace(PTdHand,"$",PTempStr)
							PTempStr=Replace(PTempStr,"#title","�� " & PJumpArray(i) & " ҳ")
							Response.Write PTempStr
						Else
							PTempStr=Replace(PTdFontArrow,"$","&nbsp;<font color=""red"">" & PJumpArray(i) & "</font>&nbsp;")
							PTempStr=Replace(PTempStr,"#title","�� " & PJumpArray(i) & " ҳ")
							Response.Write PTempStr
						End If
					End If
				Next
				'��PSPPCountҳ
				If PJumpArray(PSPPCount+1)<>0 Then
					PTempStr=Replace(PA,"$AContent",PA_Next)
					PTempStr=Replace(PTempStr,"$FileName",PJumpFileName)
					PTempStr=Replace(PTempStr,"$PageNumber",PAbsolutePage+PSPPCount)
					PTempStr=Replace(PTempStr,"$QueryStr",PJumQueryStr)
					PTempStr=Replace(PTdHand,"$",PTempStr)
					PTempStr=Replace(PTempStr,"#title","�� " & PSPPCount & " ҳ")
					Response.Write PTempStr
				Else
					PTempStr=Replace(PTdArrow,"$",PA_Next)
					PTempStr=Replace(PTempStr,"#title","")
					Response.Write PTempStr
				End If
				'βҳ
				If PJumpArray(PSPPCount+1)<>0 Then
					PTempStr=Replace(PA,"$AContent",PA_Last)
					PTempStr=Replace(PTempStr,"$FileName",PJumpFileName)
					PTempStr=Replace(PTempStr,"$PageNumber",PRst.PageCount)
					PTempStr=Replace(PTempStr,"$QueryStr",PJumQueryStr)
					PTempStr=Replace(PTdHand,"$",PTempStr)
					PTempStr=Replace(PTempStr,"#title","βҳ")
					Response.Write PTempStr
				Else
					PTempStr=Replace(PTdArrow,"$",PA_Last)
					PTempStr=Replace(PTempStr,"#title","")
					Response.Write PTempStr
				End If

				Response.Write "</tr>"
				Response.Write "</table>"
				'<!--��ҳ��ת����[Arrow]-->
				Response.Write "</td>"
				Response.Write "<td>&nbsp;</td>"
				Response.Write "<td bgcolor=""#F0F0F0"">"
				'<!--��ҳ��ת����[Go]-->
				Response.Write "<table border=""0"" cellpadding=""0"" cellspacing=""1"" bgcolor=""#FFFFFF"" class=""TD9-18"">"
				Response.Write "<form action=""" & PJumpFileName & "?PJumQueryStr=" & PJumQueryStr & """ method=""post"" name=""QL"">"
				Response.Write "<tr>"
				Response.Write "<td width=""29"" align=""center"" bgcolor=""#EEEEEE"">"
				Response.Write "<input name=""PAbsolutePage"" type=""text"" id=""PAbsolutePage"" style=""width:27; height:16; margin:0; font-size:12px; line-height:12px;"" size=""6""></td>"
				Response.Write "<td align=""center"" bgcolor=""#EEEEEE"">"
				Response.Write "<input type=""submit"" name=""QuickLaunch"" value=""GO"" style=""width:; height:16;""></td>"
				Response.Write "</tr>"
				Response.Write "</form>"
				Response.Write "</table>"
				'<!--��ҳ��ת����-->
				Response.Write "</td>"
				Response.Write "</tr>"
				Response.Write "</table>"
				Else
				Exit Sub
			End If
		End Sub
		Public Sub ParameterField(ByVal FieldCount,ByRef FieldArray)	'��ʼ�����ݿ��ֶ�����
			Redim PFieldArray(PFieldCount,2)
			PFieldArray=FieldArray
			PFieldCount=FieldCount
		End Sub		
		Rem ��������_____________________________________________________________________________________________
	End Class
'	<!-- Copyright By Sniper,All Rights Resolved. -->
'	<!--<meta http-equiv="Content-Type" content="text/html; charset=gb2312">-->
%>