<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	//ajax json데이터 캐쉬 방지
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>|OUR PLANNERS</title>
<jsp:useBean id="today" class="java.util.Date" scope="page" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flexslider.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/responsive.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-icon.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- JS FILES(자바스크립트 연결부분) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.flexslider-min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.pack.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/retina.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/modernizr.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/main.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script type="text/javascript">
	function writeRow() {
		if ($("textarea[name='contents']").val() == "") {
			alert("내용을 입력해주세요.");
			$("textarea[name='contents']").focus();
			return;
		} else if ($("input[name='title']").val() == "") {
			alert("제목을 입력해주세요.");
			$("input[name='title']").focus();
			return;
		}

		var params = $('#writeFrm').serialize();
		var url = "${pageContext.request.contextPath}/notice/writeRowAction";

		$.ajax({
					url : url,
					dataType : "json",
					type : "get",
					contentType : "text/html; charset=utf-8",
					data : params,
					success : function(d) {
						if (d.writeCode == 1) {
							alert("글입력완료");
							location.href = "${pageContext.request.contextPath}/notice/aBoard";
						} else if (d.writeCode == 0) {
							alert("글입력실패");
						} else if (d.writeCode == 2) {
							alert("관리자로그인을 하세요.");
							location.href = "${pageContext.request.contextPath}/member/login";
						}
					},
					error : function(e) {
						alert("작성실패:" + e.status + ":" + e.statusText);
					}
				});
	}
</script>
</head>
<body>

	<!-- PRELOADER -->
	<img id="preloader"
		src="${pageContext.request.contextPath}/resources/images/preloader.gif"
		alt="" />
	<!-- //PRELOADER -->
	<div class="preloader_hide">

		<!-- HEADER -->
		<header>
			<section class="banner" role="banner">
				<!-- header navigation(상단 메뉴 부분) -->

				<%@ include file="../../common/top_main.jsp"%>
				<!--// header navigation(상단 메뉴 부분) -->
			</section>
		</header>
		<!-- //HEADER -->
	</div>
	<!-- test용 시작-->
	<div class="col-xs-4 col-md-4"></div>
	<div class="col-xs-6 col-md-6">
		<form id="writeFrm">
			<table>
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td><input type="text" style="width: 100px" name="title" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="contents" rows="10" style="color: black;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<button type="button" onclick="javascript:writeRow()"
				style="color: black;">글입력하기</button>
			<button type="reset" style="color: red;">Reset</button>
		</form>
	</div>

	<div class="col-xs-2 col-md-2"></div>
	<!-- test용 끝 -->
</body>
</html>