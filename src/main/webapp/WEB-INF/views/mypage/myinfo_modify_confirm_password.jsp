<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,400italic,600,700|Raleway:300,400,500,600'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">

<link rel="shortcut icon" href="http://abusinesstheme.com/demo/voyo/assets/images/favicon.ico">
<link rel="apple-touch-icon" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="144x144" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon-144x144.png">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script>
	$(document).ready(function() {

	});

	function checkPassword(f) {
		if (f.password.value == "") {
			alert("패스워드를 입력하세요");
			f.password.focus();
			return false;

		}
	}
</script>

</head>

<body>
	<!-- PRELOADER -->
	<img id="preloader" src="${pageContext.request.contextPath}/resources/images/preloader.gif" alt="" />
	<!-- //PRELOADER -->
	<div class="preloader_hide">

		<!-- HEADER -->

		<%@ include file="../common/top_main2.jsp"%>

		<!-- HOME -->
		<section id="main" class="section">

			<!-- CONTAINER -->
			<div class="container">
				<!-- 좌우측의 공간 확보 -->

				<div class="row">
					<div class="col-lg-offset-3 col-lg-6 text-center">

						<h3>회원정보 수정전 비밀번호 확인</h3>
						<small>회원정보 수정전 개인 정보 보호를 위해 비밀번호를 다시 확인 합니다.</small><br />

						<c:if test="${errors.isNotMatchPassword}">
							<span class="text-danger">비밀번호가 일치하지 않습니다.</span>
							<br />
							<br />
						</c:if>

						<c:if test="${errors.isNotAdminModifyMember}">
							<span class="text-danger">관리자 계정만 이용할 수 있습니다.</span>
							<br />
							<br />
						</c:if>
						<form name="passwordFrm" method="post" action="<c:url value="/mypage/myinfo"/>" onsubmit="return checkPassword(this);">

							<input type="hidden" name="action" value="modify" />
							<table class="table table-bordered">
								<colgroup>
									<col width="50%" />
									<col width="*" />
								</colgroup>
								<tbody>


									<tr>
										<th class="text-center" style="vertical-align: middle;">패스워드</th>

										<td>
											<input type="text" name="password" class="form-control" style="width: 200px;" />
										</td>


									</tr>

								</tbody>
							</table>


							<div class="row text-center" style="">
								<!-- 각종 버튼 부분 -->
								<button type="submit" class="btn btn-danger">확인</button>
								<!-- <button type="reset" class="btn">리셋하기</button> -->
								<button type="button" class="btn btn-warning" onclick="history.back();">취소</button>

								<!-- <button type="button" class="btn btn-default" onclick="location.href='WriteSkin.jsp';">글쓰기</button> -->
								<!-- <button type="button" class="btn btn-primary">수정하기</button>
					<button type="button" class="btn btn-success">삭제하기</button>
					<button type="button" class="btn btn-info">답글쓰기</button>-->

							</div>


						</form>


					</div>
				</div>

			</div>
			<!-- //CONTAINER -->


		</section>
		<!-- //HOME -->

		<!-- 모달창 -->
		<%@ include file="../common/modal_msg.jsp"%>
		<!-- //모달창 끝 -->


		<!-- Footer section(하단부분) -->
		<%@ include file="../common/bottom.jsp"%>
		<!-- Footer section(하단부분) -->

	</div>
</body>
</html>
