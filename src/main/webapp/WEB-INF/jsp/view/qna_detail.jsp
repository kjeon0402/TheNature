<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The_Nature</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	.qna_detail_main {
		width: 1000px;
		margin: 80px auto;
	}
	.qna_detail_wrap {
		width: 100%;
	}
	.qna_detail_top {
		width: 100%;
	}
	.qna_detail_title {
		width: 100%;
		border-top: 2px solid #707070;
	}
	.qna_detail_title > .title {
		padding: 15px 20px;
		font-weight: bold;	
	}
	.qna_detail_info {
		display: flex;
		width: 100%;
		border-top: 1px solid #707070;
		border-bottom: 1px solid #707070;
	}
	.qna_detail_info > .qna_detail_date, 
	.qna_detail_info > .qna_detail_writer {
		display: flex;
		width: 50%;
	}
	.qna_detail_date > .title,
	.qna_detail_writer > .title {
		width: 40%;
		padding: 15px 20px;
		background-color: #F7F5F5;
	}
	.qna_detail_date > .date,
	.qna_detail_writer > .writer {
		width: 60%;
		padding: 15px 20px;
	}
	.qna_detail_contents {
		width: 100%;
	}
	.qna_detail_contents > .qna_detail_contents_content {
		padding: 40px 20px;
		border-bottom: 1px solid #707070;
	}
	.qna_detail_contents > .qna_detail_contents_content > p {
		margin: 0;
		margin-bottom: 5px;
		padding: 0;
		font-size: 12px;
	}
	.qna_detail_contents > .answer_area {
		display: flex;
		border-bottom: 1px solid #707070;
	}
	.qna_detail_contents > .answer_area > .connect_line {
		margin-top: 20px;
		margin-left: 20px;
	}
	.qna_detail_contents > .answer_area > .answer_tag {
		margin-top: 40px;
		margin-left: 25px;
		margin-right: 15px;
	}
	.qna_detail_contents > .answer_area > .answer_content {
		margin: 45px 0;
	}
	.answer_area > .answer_content > .title_area {
		margin-bottom: 15px;
	}
	.answer_area > .answer_content > .title_area > .title {
		font-size: 13px;
		font-weight: bold;
		margin-bottom: 5px;
	}
	.answer_area > .answer_content > .title_area > .write_date {
		font-size: 11px;
		color: #707070;
	}
	.answer_area > .answer_content > .content p {
		margin: 0;
		margin-bottom: 5px;
		font-size: 12px;
	}
	.qna_detail_menu {
		display: flex;
		width: 100%;
		justify-content: center;
		font-size: 15px;
		margin-top: 45px;
	}
	.qna_detail_menu > .modify, 
	.qna_detail_menu > .delete {
		border: 1px solid #707070;
		cursor: pointer;
		width: 100px;
		text-align: center;
		padding: 5px 0;
	}
	.qna_detail_menu > .modify {
		margin-right: 10px;
	}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	<jsp:include page="/WEB-INF/jsp/header/header_second.jsp" />
	
	<div class="qna_detail_main">
		<div class="qna_detail_wrap">
			<div class="qna_detail_top">
				<div class="qna_detail_title">
					<div class="title">출석체크를 했는데 포인트를 못받았어요 ㅠㅠ</div>
				</div>
				<div class="qna_detail_info">
					<div class="qna_detail_date">
						<div class="title">작성일</div>
						<div class="date">2021-06-15 14:30:09</div>
					</div>
					<div class="qna_detail_writer">
						<div class="title">작성자</div>
						<div class="writer">김민수</div>
					</div>
				</div>
			</div>
			<div class="qna_detail_contents">
				<div class="qna_detail_contents_content">
					<p>홈페이지를 이용해 주시는 고객 여러분께 진심으로 감사드립니다.</p>
					<p>당사 개인정보 처리방침이 일부 개정됨에 따라 아래와 같이 안내드리오니 서비스 이용에 참고하시기 바랍니다.</p>
					<p>소중한 개인정보를 보다 안전하게 관리하기 위하여 더욱 노력하겠습니다.</p>
					<p>감사합니다.</p><br>
					<p>시행예정일 : 9월 10일</p><br>
					<p>변경내용 : 개인정보</p>
				</div>
				<div class="answer_area">
					<div class="connect_line"><img src="img/view/qna/connect_line.svg" /></div>
					<div class="answer_tag"><img src="img/view/qna/answer_tag.svg" /></div>
					<div class="answer_content">
						<div class="title_area">
							<div class="title">출석체크를 했는데 포인트를 못받았어요 ㅠㅠ</div>
							<div class="write_date">2021-06-15 14:30:09</div>
						</div>
						<div class="content">
							<p>홈페이지를 이용해주시는 고객 여러분께 진심으로 감사드립니다.</p>
							<p>당사 개인정보 처리방침이 일부 개정됨에 따라 아래와 같이 안내드리오니 서비스 이용에 참고하시기 바랍니다.</p>
							<p>소중한 개인정보를 보다 안전하게 관리하기 위하여 더욱 노력하겠습니다.</p>
							<p>감사합니다.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="qna_detail_menu">
				<div class="modify" onclick="">수정</div>
				<div class="delete" onclick="">삭제</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp"/>
	
</body>
</html>