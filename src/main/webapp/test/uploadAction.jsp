<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.Timestamp,share.*"%>
    

<%@page import="share.RoomDTO"%>
<%@page import="share.RoomDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%
    //String directory = application.getRealPath("/fileFoler");
	String directory="/Users/bumkey/국비교육/4.JSP/sou/Project/src/main/webapp/fileFolder";
    int maxsize = 1024 * 1024 * 100;
	String encoding="UTF-8";
	//RoomDTO room=new RoomDTO();
	try{
		 MultipartRequest multi = new MultipartRequest(request,directory,maxsize,encoding,new DefaultFileRenamePolicy());
			String filename=multi.getOriginalFileName("file");
			String fileRealname=multi.getFilesystemName("file");
			//String room_no=multi.getParameter("room_no");
			
			new RoomDAO().upload(filename,fileRealname);        
		    out.write("파일명: "+filename+"<br>");
		    out.write("실제파일명: "+fileRealname+"<br>");
	} catch(IOException e){
		e.printStackTrace();
	}
   
%>