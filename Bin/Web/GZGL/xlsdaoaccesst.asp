<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<%
if  session("name") <> "admin" then 
response.Redirect "index.asp" 
end if

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>
<body>
<script language="javascript">
<!--
function CheckForm()
{
	if(document.form1.file.value=="")
	{
		alert("请选择Excel文件！");
		document.form1.password.focus();
		return false;
	}
	return true;
	
}



-->
</script>

选择导入的Excel文件<form action="xlsdaccess.asp" method="get" enctype="multipart/form-data" name="form1" onSubmit="return CheckForm();">
  <label>
  <input type="file" name="file" />
  </label>
  <label>
  <input type="submit" name="Submit" value="提交" />
  </label>
  <label>
 
  </label>
</form>
</body>
</html>
