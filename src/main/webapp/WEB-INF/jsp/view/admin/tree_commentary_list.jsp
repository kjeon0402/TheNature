<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The_Nature</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
.total_wrap {
	margin-left: 185px;
}
.tcl_wrap {
	width: 1400px;
	height: 820px;
	margin: 74px auto;
	background-color: white;
}
.tclw_wrap {
	width: 1200px;
	height: 720px;
	padding: 50px 0;
	margin: 0 auto;
}
.board_title {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 20px;
}
.tcll_table {
	width: 100%;
	border-collapse: collapse;
	border-top: 1px solid #707070;
}
.th_td {
	font-weight: bold;
	font-size: 17px;
	height: 45px;
	background-color: #EDEDED;
}
.n_center {
	text-align: center;
}
.tcll_table tr {
	border-bottom: 1px solid #707070;
}
.td_td {
	height: 40px;
}
.btn_function {
	display: flex;
	justify-content: space-between;
	margin: 20px 0;
}
.btn_function button {
	border: 1px solid #707070;
	background-color: white;
	color: #707070;
	font-size: 15px;
	font-weight: bold;
	width: 100px;
	height: 35px;
}
.btn_function button:hover {
	background-color: #707070;
	color: white;
	cursor: pointer;
}
input[type=checkbox]:hover {
	cursor: pointer;
}


/* 페이징 */
.paging {
	display: flex;
	justify-content: center;
	margin-top: 100px;
}
.paging>a {
	width: 20px;
	height: 20px;
	padding: 10px;
	border: 1px solid #EDED;
	font-size: 13px;
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
}
.paging>div {
	background-color: #444547;
	color: white;
	padding: 10px;
	width: 20px;
	height: 20px;
	display: flex;
	justify-content: center;
	border: 1px solid #EDED;
}
/* 페이징 */
</style>
<script>
	function allBoxHandler() {
		var allBox = document.getElementById('allBox')
		var allCheckBox = document.querySelectorAll('.ck_box')
		if(allBox.checked === true) {
			for(let i = 0; i < allCheckBox.length; i++) {
				allCheckBox[i].checked = true
			}
		}else {
			for(let i = 0; i < allCheckBox.length; i++) {
				allCheckBox[i].checked = false
			}
		}
	}
</script>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/view/admin/header/header.jsp"/>

<div class="total_wrap">
	<div class="tcl_wrap">
		<div class="tclw_wrap">
		
			<div class="board_title">나무 해설</div>
			
			<div class="tcl_list">
				<table class="tcll_table">
					<tbody class="tcll_tbody">
						<tr class="tcll_tr">
							<td class="th_td n_center"><input type="checkbox" id="allBox" onchange="allBoxHandler()"></td>
							<td class="th_td n_center">NO</td>
							<td class="th_td n_center">이름</td>
							<td class="th_td n_center">학명</td>
							<td class="th_td n_center">등록자</td>
							<td class="th_td n_center">등록일자</td>
						</tr>
						<c:forEach items="${tcVO }" var="tcVO">
							<tr class="tcll_tr">
								<td class="td_td n_center">
									<input type="checkbox" class="ck_box" name="checkbox_each" value="${tcVO.idx }">
								</td>
								<td class="td_td n_center">${tcVO.idx }</td>
								<td class="td_td n_center"><a href="${root }/tree_commentary_detail?no=${tcVO.idx }" target="_blank">${tcVO.tree_name }</a></td>
								<td class="td_td n_center"><i>${tcVO.tree_name_scientific }</i></td>
								<td class="td_td n_center">${tcVO.writer }</td>
								<td class="td_td n_center">${tcVO.add_date }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		
			<div class="btn_function">
				<div class="bf_left">
					<button class="modi_btn" onclick="modifyCommentary()">수정</button>
					<button class="del_btn" onclick="deleteCommentary()">삭제</button>
				</div>
				<script>
					// 나무 해설 수정
					function modifyCommentary() {
						if($('input[name="checkbox_each"]:checked').length == 0) {
							alert('선택된 항목이 없습니다.')
						}
						if($('input[name="checkbox_each"]:checked').length != 1 && $('input[name="checkbox_each"]:checked').length != 0) {
							alert('수정할 항목은 하나만 선택해야합니다.')
						}
						if($('input[name="checkbox_each"]:checked').length == 1) {
							var confirm_val = confirm('수정 페이지로 이동합니다.')
							if(confirm_val) {
								location.href = 'tree_commentary_modify?no=' + $('input[name="checkbox_each"]:checked').val()
							}
						}
					}
				</script>
				<script>
					// 내 게시글 체크박스 선택 삭제
					function deleteCommentary() {
						if($('input[name="checkbox_each"]:checked').length == 0) {
							alert('선택된 항목이 없습니다.')
						}
						if($('input[name="checkbox_each"]:checked').length != 0) {
							var confirm_val = confirm("정말 삭제하시겠습니까?")
							if(confirm_val) {
								var check = []
								$('input[name="checkbox_each"]:checked').each(function(e) {
									check.push($(this).val())
								})
								var list = {
									'check' : check
								}
								
								$.ajax({
									url: 'delete_commentary',
									type: 'POST',
									data: list,
									success: function(data) {
										if($.trim(data) == 0) {
											alert('해설이 삭제되었습니다.')
											location.href = 'tree_commentary_list'
										} else {
											alert('삭제할 수 없습니다.')
										}
									},
									error: function() {
										alert('에러입니다.')
									}
								})
							}
						}
					}
				</script>
				<div class="bf_right">
					<button class="add_btn" onclick="location.href = '${root}/admin/tree_commentary_write'">등록</button>
				</div>
			</div>
			
		
			<div class="paging">
			    <c:if test="${paging.nowPage != 1 }">
			    	<a href="tree_commentary_list?nowPage=1&cntPerPage=${paging.cntPerPage }">&lt;&lt;</a>
			    	<a href="tree_commentary_list?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage }">&lt;</a>
			    </c:if>
			    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				    <c:choose>
				    	<c:when test="${p == paging.nowPage }">
							<div class="num">${p }</div>                			
				    	</c:when>
				    	<c:when test="${p != paging.nowPage }">
				    		<a href="tree_commentary_list?nowPage=${p }&cntPerPage=${paging.cntPerPage }">${p }</a>
				    	</c:when>
				    </c:choose>
			    </c:forEach>
			    <c:if test="${paging.nowPage != paging.lastPage }">
			    	<a href="tree_commentary_list?nowPage=${paging.nowPage + 1 }&cntPerPage=${paging.cntPerPage }">&gt;</a>
			    	<a href="tree_commentary_list?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage }">&gt;&gt;</a>
			    </c:if>
			</div>
		
		</div>
	</div>
</div>

</body>
</html>