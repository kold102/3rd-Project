<%@page import="com.cafe24.ourplanners.member.dto.LoginDTO"%>
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
<title>로그인|OUR PLANNERS</title>
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
	function checkAgree(f) {
		if (f.idAgree.checked != true) {

			popLayerMsg("아이디 재사용 불가 및 복구 불가에 동의 하셔야 합니다.");
			return false;
		}
		if (f.boardAgree.checked != true) {
			popLayerMsg("게시판 서비스 등록 게시글 삭제 불가에 동의 하셔야 합니다.");
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
		<section id="join" class="padbot0">

			<!-- CONTAINER -->
			<div class="container">
				<!-- 좌우측의 공간 확보 -->


				<div class="well well-lg">

					<c:if test="${isNotDeleteAccount}">

					</c:if>

					<c:if test="${not empty error_msg}">
						<div class="alert alert-danger">
							<strong>알림!</strong> ${error_msg}
						</div>
					</c:if>
					<div id="withdraw_wrap">
						<div class="dimmed_layer" style="display: none;"></div>
						<h2 class="screen_out" id="daumBody">회원탈퇴 안내동의 본문</h2>
						<div class="myinfo_intro intro_out">
							<span class="bg_intro"></span>
							<div class="cont_intro">
								<h3 class="tit_comm tit_outagree">회원탈퇴에 앞서 유의사항 및 안내를 반드시 읽고 진행해 주세요!</h3>
							</div>
						</div>
						<!-- 
							idAgree (아이디 재사용 불가 및 복구 불가)
							boardAgree (게시판 서비스 등록 게시글 삭제 불가)
							 -->
						<form action="../member/withdraw" method="post" onsubmit="return checkAgree(this);">
							<input type="hidden" name="step" value="2" />
							<div class="info_agree">

								<div class="alert alert-danger">
									<strong>아이디 재사용 및 복구 불가 안내</strong> <br />회원탈퇴 진행 시 본인을 포함한 타인 모두 <em class="emph_g">아이디 재사용이나 복구가 불가능합니다.</em><br> 신중히 선택하신 후 결정해주세요. <strong class="tit_agree"></strong> <span class="txt_agree"> </span> <span class="check_notice"> <input name="idAgree" class="pull-right tf_check" id="idAgree" type="checkbox" value="Y"> <label class="pull-right lab_check" for="idAgree"> <span class="ico_comm ico_check"></span> 동의
									</label>
									</span>
								</div>



								<div class="alert alert-danger">
									<strong class="tit_agree">게시판형 서비스에 등록한 게시글 삭제 불가 안내</strong><br /> <span class="txt_agree">삭제를 원하는 게시글이 있다면 반드시 회원탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.<br>탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, <em class="emph_g">게시글을 임의로 삭제해드릴 수 없습니다.</em></span> <span class="check_notice"> <input name="boardAgree" class="tf_check pull-right" id="boardAgree" type="checkbox" value="Y"> <label class="lab_check pull-right" for="boardAgree"> <span class="ico_comm ico_check"></span> 동의
									</label>
									</span>
								</div>
							</div>

							<div class="wrap_btn text-center">
								<button class="btn btn-primary" type="button" onclick="javascript:history.go(-1);">탈퇴 취소</button>

								<button class="btn btn-danger" type="submit">다음 단계</button>
							</div>
						</form>

						<!-- 회원탈퇴_안내동의 팝업 -->
						<div class="userinfo_layer" id="wrongLayer" style="top: 300px; margin-left: -188px; display: none;">
							<div class="inner_myinfo_layer">
								<div class="layer_head">
									<strong class="screen_out">회원탈퇴 안내동의 레이어</strong>
								</div>
								<div class="layer_body">
									<strong class="tit_layer">안내사항을 확인하신 후, 동의해 주세요.</strong>
									<div class="btn_process">
										<button class="btn_comm btn_ok" type="button">
											<span class="screen_out">확인</span>
										</button>
									</div>
								</div>
								<div class="layer_foot">
									<button class="btn_comm btn_close" type="button">닫기</button>
								</div>
							</div>
						</div>

					</div>
					<!--// withdraw wrap -->
				</div>
				<!-- // well -->
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
