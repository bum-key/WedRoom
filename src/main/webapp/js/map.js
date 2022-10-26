/*
 지도 스크립트 코딩32323
*/

var mapContainer = document.getElementById("map"), // 지도를 표시할 div
	mapOption = {
		center: new kakao.maps.LatLng(37.50576119066, 127.055723535), // 지도의 중심좌표
		level: 10, // 지도의 확대 레벨
		mapTypeId: kakao.maps.MapTypeId.ROADMAP, // 지도종류
	};

// 지도를 생성한다
var map = new kakao.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
// 지도 타입 변경 컨트롤을 생성한다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도에 확대 축소 컨트롤을 생성한다
var zoomControl = new kakao.maps.ZoomControl();

// 지도의 우측에 확대 축소 컨트롤을 추가한다
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 클릭한 위도, 경도 정보 콘솔창 띄우기
kakao.maps.event.addListener(map, "click", function (mouseEvent) {
	var latlng = mouseEvent.latLng;
	var message = "위도: " + latlng.getLat() + ", 경도: " + latlng.getLng();
	console.dir(message);
});

// 위치정보 사용
function getLocation() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(
			getAddressByCoords,
			redirectLocation,
			geo_options
		);
	} else {
		location.href = "./share.do";
	}
}

//성공했을 때
function getAddressByCoords(position) {
	var longitude = position.coords.longitude;
	var latitude = position.coords.latitude;
	console.log(longitude);
	console.log(latitude);
	//★★위도 경도 정보를 가지고 서버 사이드로 넘어가는 부분
	location.href =
		"./share.do?longitude=" + longitude + "&latitude=" + latitude;
}

//이미지마커------------------------------------------
var imageSrc =
		"https://lh3.google.com/u/0/d/1dDDH7P4hRAEGUYRc4PVLL86pGxWhOpIO=w2880-h1528-iv1", // 마커이미지의 주소입니다
	imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
	imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
if (navigator.geolocation) {
	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
	navigator.geolocation.getCurrentPosition(function (position) {
		var lat = position.coords.latitude, // 위도
			lon = position.coords.longitude; // 경도
	
		var locPosition = new kakao.maps.LatLng(lat, lon), 
			message = '<div style="padding:5px;">Im here</div>'; // 인포윈도우에 표시될 내용입니다

		// 마커와 인포윈도우를 표시합니다
		displayMarker(locPosition, message);
	});
} else {
	// HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

	var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
		message = "geolocation을 사용할수 없어요..";

	displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		map: map,
		position: locPosition,
		image: markerImage, // 마커의 이미지
	});

	var iwContent = message, // 인포윈도우에 표시할 내용
		iwRemoveable = true;

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		content: iwContent,
		removable: iwRemoveable,
	});

	// 인포윈도우를 마커위에 표시합니다
	infowindow.open(map, marker);

	// 지도 중심좌표를 접속위치로 변경합니다
	map.setCenter(locPosition);
}


