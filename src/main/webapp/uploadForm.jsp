<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<% 
	request.setCharacterEncoding("UTF-8");
	String path = session.getServletContext().getRealPath("/");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

</head>

<body>
<%
	String filename=request.getParameter("filename");
	filename="images.jpeg";
	/* public static final String IMG_PATH = "/Common/upload/"; */

%>	
 <%-- <img src="<%=request.getContextPath() %>/fileFolder/images.jpeg"> --%>
 <%-- <img src="<%=request.getContextPath() %>/fileFolder/<%=filename %>" height="200px" width="500px"> --%>
    <form action="uploadOK.jsp" method="post" enctype="multipart/form-data">

        파일 : <input type="file" name=file><br />

        <input type="submit" value="file upload"> 

    </form>

</body>

</html>