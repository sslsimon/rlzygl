<%
	Class Pagination
		Rem 成员定义______________________________________________________________________________________________
					'PTitle-项目标题名称;PJumpFileName-跳转页面文件名(一般为此文件名);
					'PModQueryStr-(对某一记录管理时);PJumQueryStr-(跳转页面时)[中间值传送]
					'PPageSize-当前页面记录数;PAbsolutePage-当前页数
					'PCurrentAmount-前当页面记录数
					'PSPPCount(PSonPerPageCount)-分页[一页的子页数];(PFPAmount)-分页[页面的总数]
		Public PTitle,PJumpFileName,PModQueryStr,PJumQueryStr,PPageSize,PAbsolutePage,PCurrentAmount,PSPPCount,PFPAmount
					'PFieldArray-存放将要显示数据库的字段(名称|字段名称|表格显示比例< Such as 50% >);PFieldCount-存放将要显示数据库的字段的个数
		Public PFieldArray,PFieldCount
					'PRst-内部数据集;PSqlStr-内部查询语句
		Public PRst,PSqlStr,PRstIsNull
					'PA_First,PA_Previous,PA_Next,PA_Last－箭头图片HTML代码
					'PTdArrow-跳转按钮样式(图片) 1;PTdHand-跳转按钮样式(图片) 2;PTdFontHand-跳转按钮样式(文字) 3
		Private PA,PA_First,PA_Previous,PA_Next,PA_Last,PTdArrow,PTdHand,PTdFontArrow
		Private PJumpArray()
		Rem 初始化________________________________________________________________________________________________
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
			Set PRst=Server.CreateObject("ADODB.RECORDSET")	'打开数据集
		End Sub
		Rem 过程定义______________________________________________________________________________________________
		Public Sub PInit()	'初始化
			PRst.Open PSqlStr,Conn,1,1
			If PRst.Eof Then
				PRstIsNull=True
			Else
				PRstIsNull=False
			End If
			Call PShowMe()
		End Sub
		Private Sub PShowMe()	'显示
			Call PShowTitle(PTitle)
			If Not PRst.Eof Then
				Call PShowBody()
'				Call PShowJump()	由于有查询功能,这里将由主程序调用
			Else
				Response.Write "<br><br><center>没有数据，请先添加！</center><br><br>"
			End If
		End Sub
		Private Sub PShowTitle(ByVal titleTitle)	'显示顶部项目标题名称
			Response.Write "<table width=""98%"" height=""25"" border=""0"" align=""center"" cellpadding=""0"" cellspacing=""1"" bgcolor=""#D6B69C"">"
			Response.Write "<tr>"
			Response.Write "<td align=""center"" background=""images/BodyMenu.jpg"">［<strong>" & titleTitle & "</strong>］</td>"
			Response.Write "</tr>"
			Response.Write "</table>"
		End Sub
		Private Sub PShowBody()	'显示列表
			PAbsolutePage=Request("PAbsolutePage")
			PRst.PageSize=PPageSize	
			'安全过滤
			If Len(PAbsolutePage)<1 Or len(PAbsolutePage)>9 Then
				'长度不正确
				PAbsolutePage=1
			Else
				If Isnumeric(PAbsolutePage)	Then
					If Abs(PAbsolutePage)>PRst.PageCount then
					'大于总页
						PAbsolutePage=PRst.PageCount
					Else
					'小于总页
						If PAbsolutePage<=0 Then
							PAbsolutePage=1
						Else
							PAbsolutePage=Clng(PAbsolutePage)
						End If
					End If
				Else
				'不是数值
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
							Response.Write "<td width="""&PFieldArray(i,2)&""" align=""left"">"&"　"&Left(PRst(PFieldArray(i,1)),27)&"</td>"
						End if
						i=i+1
					Loop
					Response.Write"<td  align=""center"">"
					Response.Write"<a href=" & PJumpFileName & "?action=edit&id=" & Cstr(PRst("ID")) & "&PAbsolutePage=" & PAbsolutePage & PModQueryStr & "><font color=""#FF0000"">修改</font></a>"
					Response.Write" || "
					Response.Write"<a href=" & PJumpFileName & "?action=del&id=" & Cstr(PRst("ID")) & "&PAbsolutePage=" & PAbsolutePage & PModQueryStr & "><font color=""#FF0000"">删除</font></a>　"
					Response.Write"</td>"
					Response.Write"</tr>"
				PCurrentAmount=PCurrentAmount+1
				PRst.MoveNext
			Loop
			Response.Write "</table>"
		End Sub
		Public Sub PShowJump()	'显示页面跳转
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
				'<!--翻页信息显示区域-->
				Response.Write "<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""1"" bgcolor=""#FFFFFF"" class=""TD9-18"">"
				Response.Write "<tr>"
				Response.Write "<td onMouseOver=""javascript:eval(PIonMouseOver);"" onMouseOut=""javascript:eval(PIonMouseOut);"" title=""总记录数:"&PRst.RecordCount&""" align=""center"" bgcolor=""#EEEEEE"">"
				Response.Write "&nbsp;" & PRst.RecordCount &"&nbsp;"
				Response.Write "</td>"
				Response.Write "<td onMouseOver=""javascript:eval(PIonMouseOver);"" onMouseOut=""javascript:eval(PIonMouseOut);"" title=""当前页面总记录数:" & PCurrentAmount & """ align=""center"" bgcolor=""#EEEEEE"">"
				Response.Write "&nbsp;" & PCurrentAmount &"&nbsp;"
				Response.Write "</td>"
				Response.Write "<td onMouseOver=""javascript:eval(PIonMouseOver);"" onMouseOut=""javascript:eval(PIonMouseOut);"" title=""当前页数:" & PAbsolutePage & "/总页数:" & PRst.PageCount & """ align=""center"" bgcolor=""#EEEEEE"">"
				Response.Write "&nbsp;" & PAbsolutePage & "/" & PRst.PageCount & "页&nbsp;"
				Response.Write "</td>"
				Response.Write "</tr>"
				Response.Write "</table>"
				'<!--翻页信息显示区域-->
				Response.Write "</td>"
				Response.Write "<td>&nbsp;</td>"
				Response.Write "<td bgcolor=""#F0F0F0"">"
				'<!--翻页跳转区域[Arrow]-->
				Response.Write "<table height=""18"" border=""0"" cellpadding=""0"" cellspacing=""1"" bgcolor=""#FFFFFF"" class=""TD9-18"">"
				Response.Write "<tr>"
				Dim PTempStr
				If PJumpArray(0)<>0 Then
					PTempStr=Replace(PA,"$AContent",PA_First)
					PTempStr=Replace(PTempStr,"$FileName",PJumpFileName)
					PTempStr=Replace(PTempStr,"$PageNumber",1)
					PTempStr=Replace(PTempStr,"$QueryStr",PJumQueryStr)
					PTempStr=Replace(PTdHand,"$",PTempStr)
					PTempStr=Replace(PTempStr,"#title","首页")
					Response.Write PTempStr
				Else
					PTempStr=Replace(PTdArrow,"$",PA_First)
					PTempStr=Replace(PTempStr,"#title","")
					Response.Write PTempStr
				End If
				'前PSPPCount页
				If PJumpArray(0)<>0 Then
					PTempStr=Replace(PA,"$AContent",PA_Previous)
					PTempStr=Replace(PTempStr,"$FileName",PJumpFileName)
					PTempStr=Replace(PTempStr,"$PageNumber",PAbsolutePage-PSPPCount)
					PTempStr=Replace(PTempStr,"$QueryStr",PJumQueryStr)
					PTempStr=Replace(PTdHand,"$",PTempStr)
					PTempStr=Replace(PTempStr,"#title","前 " & PSPPCount & " 页")
					Response.Write PTempStr
				Else
					PTempStr=Replace(PTdArrow,"$",PA_Previous)
					PTempStr=Replace(PTempStr,"#title","")
					Response.Write PTempStr
				End If
				'页数单击
				i=i Xor i
				For i=1 to PSPPCount
					If PJumpArray(i)<>0 Then
						If PJumpArray(i)<>PAbsolutePage Then
							PTempStr=Replace(PA,"$AContent","&nbsp;" & PJumpArray(i) & "&nbsp;")
							PTempStr=Replace(PTempStr,"$FileName",PJumpFileName)
							PTempStr=Replace(PTempStr,"$PageNumber",PJumpArray(i))
							PTempStr=Replace(PTempStr,"$QueryStr",PJumQueryStr)
							PTempStr=Replace(PTdHand,"$",PTempStr)
							PTempStr=Replace(PTempStr,"#title","第 " & PJumpArray(i) & " 页")
							Response.Write PTempStr
						Else
							PTempStr=Replace(PTdFontArrow,"$","&nbsp;<font color=""red"">" & PJumpArray(i) & "</font>&nbsp;")
							PTempStr=Replace(PTempStr,"#title","第 " & PJumpArray(i) & " 页")
							Response.Write PTempStr
						End If
					End If
				Next
				'后PSPPCount页
				If PJumpArray(PSPPCount+1)<>0 Then
					PTempStr=Replace(PA,"$AContent",PA_Next)
					PTempStr=Replace(PTempStr,"$FileName",PJumpFileName)
					PTempStr=Replace(PTempStr,"$PageNumber",PAbsolutePage+PSPPCount)
					PTempStr=Replace(PTempStr,"$QueryStr",PJumQueryStr)
					PTempStr=Replace(PTdHand,"$",PTempStr)
					PTempStr=Replace(PTempStr,"#title","后 " & PSPPCount & " 页")
					Response.Write PTempStr
				Else
					PTempStr=Replace(PTdArrow,"$",PA_Next)
					PTempStr=Replace(PTempStr,"#title","")
					Response.Write PTempStr
				End If
				'尾页
				If PJumpArray(PSPPCount+1)<>0 Then
					PTempStr=Replace(PA,"$AContent",PA_Last)
					PTempStr=Replace(PTempStr,"$FileName",PJumpFileName)
					PTempStr=Replace(PTempStr,"$PageNumber",PRst.PageCount)
					PTempStr=Replace(PTempStr,"$QueryStr",PJumQueryStr)
					PTempStr=Replace(PTdHand,"$",PTempStr)
					PTempStr=Replace(PTempStr,"#title","尾页")
					Response.Write PTempStr
				Else
					PTempStr=Replace(PTdArrow,"$",PA_Last)
					PTempStr=Replace(PTempStr,"#title","")
					Response.Write PTempStr
				End If

				Response.Write "</tr>"
				Response.Write "</table>"
				'<!--翻页跳转区域[Arrow]-->
				Response.Write "</td>"
				Response.Write "<td>&nbsp;</td>"
				Response.Write "<td bgcolor=""#F0F0F0"">"
				'<!--翻页跳转区域[Go]-->
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
				'<!--翻页跳转区域-->
				Response.Write "</td>"
				Response.Write "</tr>"
				Response.Write "</table>"
				Else
				Exit Sub
			End If
		End Sub
		Public Sub ParameterField(ByVal FieldCount,ByRef FieldArray)	'初始化数据库字段数组
			Redim PFieldArray(PFieldCount,2)
			PFieldArray=FieldArray
			PFieldCount=FieldCount
		End Sub		
		Rem 函数定义_____________________________________________________________________________________________
	End Class
'	<!-- Copyright By Sniper,All Rights Resolved. -->
'	<!--<meta http-equiv="Content-Type" content="text/html; charset=gb2312">-->
%>