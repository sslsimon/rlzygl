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
<title>�ޱ����ĵ�</title>
</head>
<body>

<script language="javascript">
<!--
function CheckForm()
{
	if(document.form1.file.value=="")
	{
		alert("��ѡ��Excel�ļ���");
		document.form1.password.focus();
		return false;
	}
	
	return true;
	}



-->
</script>
ѡ����ְ���������ݱ�<form action="daogzdsj.asp" method="get" enctype="multipart/form-data"  name="form1" onSubmit="return CheckForm();">
  <label>
  <input type="file" name="file" />
��ѡ���ʱ�ʱ��
          <select name="month_gz" size="1">
            <%for month_i =1 to 12 %>
            <option value="<%=month_i %>"><%=month_i %></option>
            <% next %>
          </select>
  <br />
  </label>
  <label>
  
  <input type="submit" name="Submit" value="�ύ" />
  
  </label>
  <label>
   <input type="reset" name="Submit2" value="����">
  </label>
</form>
</body>
</html>
