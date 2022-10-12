<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>WedRoom</title>
<link href="test/css/main.css" rel="stylesheet" type="text/css" />
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
				<a href="index.html"><img src="test/img/logo.png" /></a>
			</div>
		</header>
		<!-- 메뉴바 -->
		<nav class="nav">
			<ul class="menu">
				<li><a href="share.jsp">쉐어하우스</a></li>
				<li><a href="#">룸메이트</a></li>
				<li><a href="#">자유게시판</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">성향테스트</a></li>
			</ul>
		</nav>
		<!-- 바디 -->
		<body>
			<center>
				<b>글쓰기</b> <br>
				<!-- onsubmit 이벤트="return 호출할 함수명(~)" -->
				<form method="post" name="writeform" action="/Project/writePro.do"
					onsubmit="return writeSave()">

					<!-- 로그인 테이블 만들어지면 히든값 수정하기 -->
					<input type="hidden" name="id_no" value="1">

					<table width="400" border="1" cellspacing="0" cellpadding="0"
						bgcolor="#e0ffff" align="center">
						<tr>
							<td align="right" colspan="2" bgcolor="#b0e0e6"><a
								href="/Project/share.do"> 방목록</a></td>
						</tr>
						<!-- <tr>
							<td width="70" bgcolor="#b0e0e6" align="center">아이디번호</td>
							<td width="330"><input type="text" size="10" maxlength="10"
								name="id_no"></td>
						</tr> -->
						<tr>
							<td width="70" bgcolor="#b0e0e6" align="center">번호</td>
							<td width="330"><input type="text" size="10" maxlength="10"
								name="room_no"></td>
						</tr>
						<tr>
							<td width="70" bgcolor="#b0e0e6" align="center">제 목</td>
							<td width="330"><c:if test="${num==0 }">
									<!--신규글 -->
									<input type="text" size="40" maxlength="50" name="title"></td>
							</c:if>
							<c:if test="${num!=0 }">
								<!--답변글(양수) -->
								<input type="text" size="40" maxlength="50" name="title"
									value="[re]">
								</td>
							</c:if>
						</tr>
						<tr>
							<td width="70" bgcolor="#b0e0e6" align="center">주소</td>
							<td width="330"><input type="text" size="40" maxlength="30"
								name="address"></td>
						</tr>
						<tr>
							<td width="70" bgcolor="#b0e0e6" align="center">조회</td>
							<td width="330"><input type="text" size="40" maxlength="30"
								name="view"></td>
						</tr>
						<tr>
							<td width="70" bgcolor="#b0e0e6" align="center">방 개수</td>
							<td width="330"><input type="text" size="40" maxlength="30"
								name="room_count"></td>
						</tr>
						<tr>
							<td width="70" bgcolor="#b0e0e6" align="center">방옵션</td>
							<td width="330"><input type="text" size="40" maxlength="30"
								name="room_option"></td>
						</tr>
						<tr>
							<td width="70" bgcolor="#b0e0e6" align="center">공과금</td>
							<td width="330"><input type="text" size="40" maxlength="30"
								name="fee"></td>
						</tr>
						<tr>
							<td width="70" bgcolor="#b0e0e6" align="center">방정보</td>
							<td width="330"><input type="text" size="40" maxlength="30"
								name="room_info"></td>
						</tr>
						<tr>
							<td width="70" bgcolor="#b0e0e6" align="center">위도</td>
							<td width="330"><input type="text" size="40" maxlength="30"
								name="lat"></td>
						</tr>
						<tr>
							<td width="70" bgcolor="#b0e0e6" align="center">경도</td>
							<td width="330"><input type="text" size="40" maxlength="30"
								name="lng"></td>
						</tr>
						</tr>
						<tr>
							<!-- a링크,action속성값,이벤트처리를 통해서 이동하는 경우 전부 jsp->do  -->
							<td colspan=2 bgcolor="#b0e0e6" align="center"><input
								type="submit" value="글쓰기"> <input type="reset"
								value="다시작성"> <input type="button" value="목록보기"
								OnClick="window.location='/Project/share.do'"></td>
						</tr>
					</table>
				</form>
		</body>
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
