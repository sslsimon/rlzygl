<%
'	¡¤Include LIB:
'	Properties:
'		StrPick_up
'		FillStr
'	Methods:
'		StrLength()
	Class UnicodeChinese
	Rem Const
		private Unicode_Chinese
		public StrPick_up,FillStr
	Rem Sub
		private sub Class_Initialize()
			Unicode_Chinese = (len("ÎÒ°®Äã")=3)
			FillStr=VbNullString
		end sub
		public sub ResetStr()
			StrPick_up=VbNullString
			FillStr=VbNullString
		end sub
		public function strLength(ByVal str,ByVal ASCIILen)
			ON ERROR RESUME NEXT
			if Unicode_Chinese then
				dim l,t,c
				dim i
				dim countstr
				countstr=0
				l=len(str)
				t=l
				i=1
				for i=1 to l
					c=asc(mid(str,i,1))
					if c<0 then
						c=c+65536
					end if
					if c>255 then
						t=t+1
						countstr=countstr+2
					else
						countstr=countstr+1
					end if
					if countstr<=ASCIILen then
						StrPick_up=StrPick_up+mid(str,i,1)
						if (countstr mod 2)<>0 then
							FillStr=" "
						else
							FillStr=VbNullString
						end if
					end if
				next
				strLength=t
			else 
				strLength=len(str)
				StrPick_up=mid(str,0,ASCIILen)
			end if		
			if err.number<>0 then err.clear
		end function 
	End CLass
'	<!-- Copyright By Sniper,All Rights Resolved. -->
'	<!--<meta http-equiv="Content-Type" content="text/html; charset=gb2312">-->
%>