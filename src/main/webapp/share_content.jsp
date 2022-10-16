<%@page import="member.MemberDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="share.*,java.text.SimpleDateFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>WedRoom</title>

<link href="test/css/main.css?af" rel="stylesheet" type="text/css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
</head>
<body>
	<div class="wrap">
		<!-- 로고 -->
		<header class="hd">
			<div class="logo">
				<a href="share_list.do"><img src="test/img/logo.png" /></a>
			</div>
		</header>
		<!-- 메뉴바 -->
		<nav class="nav">
			<ul class="menu">
				<li><a href="share_list.do">쉐어하우스</a></li>
				<li><a href="#">룸메이트</a></li>
				<li><a href="#">자유게시판</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">성향테스트</a></li>
			</ul>
		</nav>
		<!-- body -->
		
		<%
			/* RoomDTO room=new RoomDTO();
			String fileRealname=room.getFileRealname(); */
			int room_no=Integer.parseInt(request.getParameter("room_no"));

			RoomDAO dbPro=new RoomDAO();
			RoomDTO room=dbPro.getRoom(room_no); 
			String fileRealname=room.getFileRealname();
			session.setAttribute("id_no", room.getId_no());
			
			Integer id_no=0;
			if((Integer)session.getAttribute("id_no") !=null){
				id_no=(int)session.getAttribute("id_no");
				System.out.println("session room의 id_no->"+id_no);
			}
			MemberDTO mem=new MemberDTO();
			session.setAttribute("id_no", mem.getId_no());
			
			
			System.out.println("member의 id_no->"+mem.getId_no());
			if(id_no.equals(mem.getId_no())) {
		%>
		<section>
			<div class="section">
				<div class="section2">
					<h2 style="text-align: left; margin-left: 30px">상세보기</h2>
					<form class="row g-3 needs-validation" novalidate>
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>주소:</th>
									<th>${room.address}</th>
									<th>방 이름:</th>
									<th>${room.title}</th>
									<th>작성자 :</th>
									<th>${room.id_no}</th>
									<!-- <th>홍길동</th> -->
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>방 개수 :</td>
									<td>${room.room_count}</td>
									<td>공과금 :</td>
									<td>${room.fee}</td>
									<th>조회수 :</th>
									<th>${room.view }</th>
								</tr>
								<tr>
									<td>방 옵션 :</td>
									<td colspan="5">${room.room_option }</td>
								</tr>
								<tr>
									<td>방 정보 :</td>
									<td colspan="5">${room.room_info }</td>
								</tr>
								<tr>
									<td>방 사진 :</td>
									<c:if test="${room.fileRealname==null}">
										<td colspan="5">사진이 등록되어 있지 않습니다</td>
									</c:if>
									<c:if test="${room.fileRealname!=null}">
										<td colspan="5"><img src="<%=request.getContextPath() %>/fileFolder/${room.fileRealname}" width="400px" height="200px"></td>
									</c:if>
									<%-- <img src="<%=request.getContextPath() %>/fileFolder/${room.fileRealname}" width="400px" height="200px"> --%>
									<%-- <%
										String filename=request.getParameter("filename");
										String directory="/Users/bumkey/국비교육/4.JSP/sou/Project/src/main/webapp/fileFolder";
									    int maxsize = 1024 * 1024 * 100;
										String encoding="UTF-8";
										MultipartRequest multi = new MultipartRequest(request,directory,maxsize,encoding,new DefaultFileRenamePolicy());
										filename=multi.getParameter("filename");
									%>
										<img src="<%=request.getContextPath() %>/fileFolder/<%=filename %>"> --%>
								</tr>
							</tbody>
						</table>
						<div class="div_btnbox">
							<input type="button" onclick="location.href='#'" value="연락하기"
								class="btn btn-outline-warning btn-lg" /> 
								
								<input type="button"
								onclick="location.href='/Project/share_updateForm.do?room_no=${room.room_no}'"
								value="수정하기" class="btn btn-outline-secondary btn-lg" /> 
								<input type="button"
								onclick="location.href='/Project/share_deleteForm.do?room_no=${room.room_no}'"
								value="삭제하기" class="btn btn-outline-danger btn-lg" /> 
								
								
								<input
								class="btn btn-outline-primary btn-lg" type="button"
								onclick="document.location.href='/Project/share_list.do'"
								value="목록보기" />
						</div>
					</form>
				</div>
			</div>
		</section>
		<%} else{%>
		<section>
			<div class="section">
				<div class="section2">
					<h2 style="text-align: left; margin-left: 30px">상세보기</h2>
					<form class="row g-3 needs-validation" novalidate>
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>주소:</th>
									<th>${room.address}</th>
									<th>방 이름:</th>
									<th>${room.title}</th>
									<th>작성자 :</th>
									<th>${room.id_no }</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>방 개수 :</td>
									<td>${room.room_count}</td>
									<td>공과금 :</td>
									<td>${room.fee}</td>
									<th>조회수 :</th>
									<th>${room.view }</th>
								</tr>
								<tr>
									<td>방 옵션 :</td>
									<td colspan="5">${room.room_option }</td>
								</tr>
								<tr>
									<td>방 정보 :</td>
									<td colspan="5">${room.room_info }</td>
								</tr>
								<tr>
									<td>방 사진 :</td>
									<c:if test="${room.fileRealname==null}">
										<td colspan="5">사진이 등록되어 있지 않습니다</td>
									</c:if>
									<c:if test="${room.fileRealname!=null}">
										<td colspan="5"><img src="<%=request.getContextPath() %>/fileFolder/${room.fileRealname}" width="400px" height="200px"></td>
									</c:if>
									<%-- <img src="<%=request.getContextPath() %>/fileFolder/${room.fileRealname}" width="400px" height="200px"> --%>
									<%-- <%
										String filename=request.getParameter("filename");
										String directory="/Users/bumkey/국비교육/4.JSP/sou/Project/src/main/webapp/fileFolder";
									    int maxsize = 1024 * 1024 * 100;
										String encoding="UTF-8";
										MultipartRequest multi = new MultipartRequest(request,directory,maxsize,encoding,new DefaultFileRenamePolicy());
										filename=multi.getParameter("filename");
									%>
										<img src="<%=request.getContextPath() %>/fileFolder/<%=filename %>"> --%>
								</tr>
							</tbody>
						</table>
						<div class="div_btnbox">
							<input type="button" onclick="location.href='#'" value="연락하기"
								class="btn btn-outline-warning btn-lg" /> 
								
								
								
								<input
								class="btn btn-outline-primary btn-lg" type="button"
								onclick="document.location.href='/Project/share_list.do'"
								value="목록보기" />
						</div>
					</form>
				</div>
			</div>
		</section>
		<%} %>
		<!-- 꼬리말 -->
		<footer class="ft">
			<nav class="nav2">
				<ul>
					<li><a href="#">서비스 이용약관</a></li>
					<li class="l1">l</li>
					<li><a href="#">개인정보처리 방침</a></li>
					<li class="l1">l</li>
					<li><a href="#">광고 문의</a></li>
					<li class="l1">l</li>
					<li><a href="#">고객서비스 센터</a></li>
					<li class="l1">l</li>
					<li><a href="#">위치기반 서비스 이용약관</a></li>
				</ul>
			</nav>
			<br />
			<p class="p">
				<a>상호 : (주)위드룸&nbsp;|&nbsp;주소 : 서울특별시 강남구 테헤란로1길
					10&nbsp;|&nbsp;팩스 : 02-123-4567</a> <br /> <a>서비스 이용문의 :
					1234-9876&nbsp;|&nbsp;이메일 : cs@wedroom.com</a>
			</p>
		</footer>
	</div>
</body>
</html>

