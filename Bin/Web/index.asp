<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="LIB/Function.asp"-->
<link href="Css.css" rel="stylesheet" type="text/css">

<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td align="center" valign="middle"><table width="380" border="0" cellpadding="0" cellspacing="1">
			<tr>
				<td width="336" height="25" align="center" ><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [人力资源查询系统]</strong></td>
			</tr>
		</table>
    	<table width="100" height="2" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td></td>
				</tr>
	  </table>
    	<table width="378" border="0" align="center" cellpadding="10" cellspacing="1" >
				<tr>
					<td width="356" align="center" ><table width="273" border="0" align="center" cellpadding="0" cellspacing="0">
					
						<form action="ALoginCheck.asp" name="login" method="post">
							<tr>
								<td valign="top"><table width="60" height="8" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td></td>
										</tr>
									</table>
										<table width="265" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
											  <td width="89"><div align="right">工　号：</div></td>
										      <td width="176"><input name="username" type="text" class="S-T-12" id="username" size="22" maxlength="20"></td>
											</tr>
								  </table>
									<table width="267" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
											  <td width="90"><div align="right">密　码：</div></td>
										      <td width="177"><input name="password" type="password" class="S-T-12" id="password" size="22" maxlength="20"></td>
											</tr>
								  </table>
									<table width="281" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
											  <td width="96"><div align="right">验证码：</div></td>
											  <td width="60"><input name="valication" type="text" class="S-T-12" id="valication" size="8" maxlength="8"></td>
												<td width="108"><div align="center">
														<table width="32" height="18" border="0" cellpadding="0" cellspacing="0">
															<tr>
																<td width="32" valign="middle" bgcolor="#FFFFFF"><%=getcode()%></td>
															</tr>
												  </table>
											  </div></td>
											</tr>
								  </table>
									<table width="60" height="14" border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td></td>
											</tr>
								  </table>
									<table width="253" height="30" border="0" align="center" cellpadding="0" cellspacing="0" align="center">
											<tr>
											  <td  align="center" valign="middle"><INPUT name=登录 type=submit id="sent" value=" 登　录" width=52 height=23 border=0>
											&nbsp;&nbsp;	 <input type="reset" name="Submit" value=" 重　置 " /></td>
											</tr>
								  </table></td>
							</tr>
						</form>
					</table>
						<table width="100" height="8" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td></td>
								</tr>
						</table>
						<table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" >
								<tr>
									<td></td>
								</tr>
						</table>
						<table width="100" height="8" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td></td>
								</tr>
						</table>
				  </td>
				</tr>
	  </table>
</td>
  </tr>
</table>
