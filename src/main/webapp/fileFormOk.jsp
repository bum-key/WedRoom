<%-- <%@page import="org.jcp.xml.dsig.internal.dom.DOMUtils"%> --%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@쟰age language="java"쟠ontentType="text/html;쟠harset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	String path=request.getRealPath("fileFolder");
	
	int size=1024*1024*10;
	String file="";
	String oriFile="";
	
	try{
		MultipartRequest multi=new MultipartRequest(request,path,size,"EUC-KR",new DefaultFileRenamePolicy());
		
		Enumeration files=multi.getFileNames();
		String str=(String)files.nextElement();
		
		file=multi.getFilesystemName(str);
		oriFile=multi.getOriginalFileName(str);
	} catch(Exception e){
		e.printStackTrace();
	}

%>
�
<!DOCTYPE쟦tml>
<html>
<head>
<meta쟦ttp-equiv="Content-Type"쟠ontent="text/html;쟠harset=EUC-KR">
<title>Insert쟴itle쟦ere</title>
</head>
<body>
젨젨file쟖pload쟔uccess.
</body>
</html>