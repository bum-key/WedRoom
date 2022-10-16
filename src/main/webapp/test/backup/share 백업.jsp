<%@page import="share.RoomDAO"%>
<%@page import="share.RoomDTO"%>
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
			<div class="searchbar">
				<input type="text" placeholder="찾는 주소를 입력해주세요" width="50px"
					id="searchtext" /> <input type="button" value="검색" id="searchBtn" />
			</div>
			<center>
				<b>글목록(전체 글:${pgList.count})</b>
				<table width="700">
					<div class="searchbar">
						<input type="text" placeholder="찾는 주소를 입력해주세요" width="50px"
							id="searchtext" /> <input type="button" value="검색"
							id="searchBtn" />
					</div>

					<div class="searchbar">
					<input
						type="text"
						placeholder="찾는 주소를 입력해주세요"
						width="50px"
						id="searchtext"
					/>
					<input type="button" value="검색" id="searchBtn" />
				</div>

			
					<c:set var="roomtest" value="${roomList}"></c:set>
					<div id="map" style="width: 100%; height: 800px"></div>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b73875579de27ab7f4a19edab09ba444&libraries=services"></script>
					<script type="text/javascript" src="test/js/map2.js">
					</script>
					<script type="text/javascript">
						var positions=new Array()
						<c:forEach var="room" items="${roomList}">
							var content= '<div style="padding:5px; "><a href="content.do?room_no=${room.room_no}"">${room.title} 자세히보기!</a></div>'
							var lat=${room.lat}
							var lng=${room.lng}
							
							 var test={content:content ,latlng: new kakao.maps.LatLng(lat,lng)}
							positions.push(test) 						
						</c:forEach>
						 

							 
						for (var i = 0; i < positions.length; i++) {
							var marker = new kakao.maps.Marker({
								map : map, // 마커를 표시할 지도
								position : positions[i].latlng, // 마커를 표시할 위치
							});
							
							var iwRemoveable=true
							// 마커에 표시할 인포윈도우를 생성합니다 
						    var infowindow = new kakao.maps.InfoWindow({
						        content: positions[i].content,// 인포윈도우에 표시할 내용
						        removable: iwRemoveable
						    });

						    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
						    kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));
						    
						}
						// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
						function makeClickListener(map, marker, infowindow) {
						    return function() {
						        infowindow.open(map, marker);
						    };
						}
					</script>

					<tr>
						<td align="right" bgcolor="#b0e0e6"><a
							href="/Project/share_add.do">글쓰기</a></td>
					</tr>
				</table>
				<!-- 데이터의 유무-->
				<c:if test="${pgList.count==0}">
					<table border="1" width="700" cellpadding="0" cellspacing="0"
						align="center">
						<tr>
							<td align="center">게시판에 저장된 글이 없습니다.</td>
						</tr>
					</table>
				</c:if>
				<c:if test="${pgList.count > 0}">
					<table border="1" width="700" cellpadding="0" cellspacing="0"
						align="center">
						<tr height="30" bgcolor="#b0e0e6">
							<!-- <td align="center" width="50">번 호</td> -->
							<td align="center" width="250">번호</td>
							<td align="center" width="100">제목</td>
							<td align="center" width="150">주소</td>
							<td align="center" width="50">방옵션</td>
							<td align="center" width="100">공과금</td>
							<td align="center" width="100">방정보</td>
						</tr>
						</c:if>
						<!-- 실질적으로 레코드를 출력시켜주는 부분 
         this(현재 마우스를 갖다댄 객체(tr)을 의미
    -->
						<c:set var="number" value="${pgList.number}" />
						<c:forEach var="room" items="${roomList}">
							<tr height="30"
								onmouseover="this.style.backgroundColor='#f76a67'"
								onmouseout="this.style.backgroundColor='#e0ffff'">
								<a
									href="/Project/content.do?room_no=${room.room_no}">
									${room.title}</a>
								<img src="images/hot.gif" border="0" height="16">
								<td align="center" width="100">${room.room_no}</td>
								<td align="center" width="100">${room.title}</td>
								<td align="center" width="150">${room.address}</td>
								<td align="center" width="50">${room.room_option}</td>
								<td align="center" width="100">${room.fee}</td>
								<td align="center" width="100">${room.room_info}</td>
							</tr>
						</c:forEach>
					</table>
					<!-- 페이징 처리 -->
					<c:if test="${pgList.startPage > pgList.blockSize}">
						<a
							href="/Project/share.do?pageNum=${pgList.startPage-pgList.blockSize}&search=${search}&searchtext=${searchtext}">[이전]</a>
					</c:if>

					<c:forEach var="i" begin="${pgList.startPage}"
						end="${pgList.endPage}">
						<a
							href="/Project/share.do?pageNum=${i}&search=${search}&searchtext=${searchtext}">
							<c:if test="${pgList.currentPage==i}">
								<font color="red"><b> [${i}]</b></font>
							</c:if> <c:if test="${pgList.currentPage!=i}">
                   ${i}
           </c:if>
						</a>
					</c:forEach>

					<c:if test="${pgList.endPage <pgList.pageCount}">
						<a
							href="/Project/share.do?pageNum=${pgList.startPage+pgList.blockSize}&search=${search}&searchtext=${searchtext}">[다음]</a>
					</c:if>
					<p>
						<!-- 
   검색어 추가(자주 검색이 되는 항목을 잘 선택) 제목,작성자,제목+본문
   ex) search.do->새로운 요청명령어를 이용해서 추가
         list.do->기존의 내용을 추가
 -->
					<form name="test" action="/Project/share.do">
						<select name="search">
							<option value="title">제목</option>
							<option value="title_address">제목+주소</option>
							<option value="address">주소</option>
						</select> <input type="text" size="15" name="searchtext">&nbsp; <input
							type="submit" value="검색">
					</form>
			</center>
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
