<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/CSS/MemberUpdate.css" rel="stylesheet">

<script type="text/javascript">
	function result() {
		var tagCheck = document.getElementsByName("tag");
		var mesg = "";
		console.log("tagCheck: ", tagCheck);
		for (var i = 0; i < tagCheck.length; i++) {
			if (tagCheck[i].checked)
				mesg += "," + tagCheck[i].value
		}
		mesg = mesg.substring(1);

	}
</script>
</head>

<body>
	<!-- 페이지 상단 로고 및 배너 -->
	<header>
		<div class="wrapper">
			<h1>
				<a href="Main.jsp"><img class="logo" src="../Image/logo.png" alt="로고 이미지"></a>
			</h1>
			<nav>
				<div class="empty"></div>
				<ul class="nav">
					<li><a href="#">게시판</a></li>
					<li><a href="#">뉴스 및 소식</a></li>
					<li><a href="MyPage.jsp">마이페이지</a></li>
					<li><a href="#">로그아웃</a></li>
				</ul>
			</nav>
		</div>
	</header>

	<%
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
	String mbrId = dto.getMbrId();
	String mbrName = dto.getMbrName();
	String mbrPw = dto.getMbrPw();
	String mbrEmail = dto.getMbrEmail();
	String mbrGenre = dto.getMbrGenre();
	String mbrRegdate = dto.getMbrRegdate();

	//찍어보기
	System.out.println("dto:  " + dto.toString());
	System.out.println("id: " + mbrId);
	%>
	<!-- 메인화면 컨텐츠-->
	<!-- 안의 내용은 데이터 받아오면 변경 예정 -->
	<div class="wrapper">
		<h2>회원정보 수정</h2>
		<!-- 상단 -->
		<section class="main-contents">
			<form action="MemberUpdateServlet" method="post">
				<input type="hidden" value="<%=mbrId%>" name="mbrId">

				<!-- hidden으로 데이터 전달  -->
				<div class="member">
					아이디 &nbsp;&nbsp;&nbsp;
					<%=mbrId%></div>
				<br>

				<div class="member">
					닉네임 &nbsp;&nbsp;&nbsp; <input type="text" class="mbrinfo" value="<%=mbrName%>" name="mbrName" id="mbrName">
				</div>
				<br>

				<div class="member">
					이메일 &nbsp;&nbsp;&nbsp; <input type="email" class="mbrinfo" value="<%=mbrEmail%>" name="mbrEmail" id="mbrEmail">
				</div>
				<br>

				<div class="member">
					선호장르
					<table border="1">
						<tr>
							<td><input type="checkbox" name="tag" id="tag1" value="레이싱"> <label for="tag1">&nbsp;레이싱</label></td>
							<td><input type="checkbox" name="tag" id="tag2" value="생존"> <label for="tag2">&nbsp;생존</label></td>
							<td><input type="checkbox" name="tag" id="tag3" value="슈팅"> <label for="tag3">&nbsp;슈팅</label></td>
							<td><input type="checkbox" name="tag" id="tag4" value="스포츠"> <label for="tag4">&nbsp;스포츠</label></td>
							<td><input type="checkbox" name="tag" id="tag5" value="시뮬레이션"> <label for="tag5">&nbsp;시뮬레이션</label></td>
							<td><input type="checkbox" name="tag" id="tag6" value="액션"> <label for="tag6">&nbsp;액션</label></td>
						</tr>
						<tr>
							<td><input type="checkbox" name="tag" id="tag7" value="어드밴처"> <label for="tag7">&nbsp;어드밴처</label></td>
							<td><input type="checkbox" name="tag" id="tag8" value="오프월드"> <label for="tag8">&nbsp;오프월드</label></td>
							<td><input type="checkbox" name="tag" id="tag9" value="음악"> <label for="tag9">&nbsp;음악</label></td>
							<td><input type="checkbox" name="tag" id="tag10" value="전략"> <label for="tag10">&nbsp;전략</label></td>
							<td><input type="checkbox" name="tag" id="tag11" value="전쟁"> <label for="tag11">&nbsp;전쟁</label></td>
							<td><input type="checkbox" name="tag" id="tag12" value="캐쥬얼"> <label for="tag12">&nbsp;캐쥬얼</label></td>
						</tr>
						<tr>
							<td><input type="checkbox" name="tag" id="tag13" value="모험"> <label for="tag13">&nbsp;모함</label></td>
							<td><input type="checkbox" name="tag" id="tag14" value="판타지"> <label for="tag14">&nbsp;판타지</label></td>
							<td><input type="checkbox" name="tag" id="tag15" value="퍼즐"> <label for="tag15">&nbsp;퍼즐</label></td>
							<td><input type="checkbox" name="tag" id="tag16" value="롤플레잉"> <label for="tag16">&nbsp;롤플레잉</label></td>
							<td><input type="checkbox" name="tag" id="tag17" value="공상과학"> <label for="tag17">&nbsp;공상과학</label></td>
							<td><input type="checkbox" name="tag" id="tag18" value="턴제전략"> <label for="tag18">&nbsp;턴제전략</label></td>
						</tr>
						<tr>
							<td><input type="checkbox" name="tag" id="tag19" value="협동"> <label for="tag19">&nbsp;협동</label></td>
							<td><input type="checkbox" name="tag" id="tag20" value="애니"> <label for="tag20">&nbsp;애니</label></td>
							<td><input type="checkbox" name="tag" id="tag21" value="어려움"> <label for="tag21">&nbsp;어려움</label></td>
							<td><input type="checkbox" name="tag" id="tag22" value="카드배틀"> <label for="tag22">&nbsp;카드배틀</label></td>
							<td><input type="checkbox" name="tag" id="tag23" value="인디게임"> <label for="tag23">&nbsp;인디게임</label></td>
							<td><input type="checkbox" name="tag" id="tag24" value="경영"> <label for="tag24">&nbsp;경영</label></td>
						</tr>
					</table>
				</div>
				<button onclick="result()">확인</button>
				<button type="reset">취소</button>
			</form>

		</section>

	</div>

	<!-- 페이지 최하단 배너 -->
	<footer>
		<div class="wrapper">
			<p>
				<small>&copy; 2021 PlayGround</small>
			</p>
		</div>
	</footer>
</body>
</html>