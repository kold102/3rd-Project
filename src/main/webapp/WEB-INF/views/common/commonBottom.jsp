<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() {
		var url = "${pageContext.request.contextPath}/notice/smallABoard"
		$.ajax({
			url : url,
			dataType : "html",
			type : "get",
			contentType : "text/html; charset:utf-8",
			data : {
				param1 : "값1"
			},
			success : function(d) {
				$('#smallABoard').html(d);
			},
			error : function(e) {
				alert("실패" + e);
			}
		});
	});
</script>
<script src="${pageContext.request.contextPath}/resources/js/script.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<div class="container-fluid">
	<div class="footer-menu">
		<a href="#">31.5팀</a>&nbsp;&nbsp;&nbsp;l&nbsp;&nbsp;&nbsp;<a href="#">서비스소개</a>&nbsp;&nbsp;&nbsp;l&nbsp;&nbsp;&nbsp;<a href="#">인재채용</a> &nbsp;&nbsp;&nbsp;l&nbsp;&nbsp;&nbsp;<a href="#">이용약관</a>&nbsp;&nbsp;&nbsp;l&nbsp;&nbsp;&nbsp;<a href="#">개인정보취급방침</a>&nbsp;&nbsp;&nbsp;l&nbsp;&nbsp;&nbsp;<a href="#">FAQ</a>
	</div>
	<div class="row">
		<div class="col-lg-2 col-sm-1 col-xs-0"></div>
		<div class="col-lg-8 col-sm-10 col-xs-12">
			<div class="footer-body">
				<div class="row">
					<div class="col-xs-10">
						<h4><a href="./notice/aBoard" style="font-size: 15px;">공지사항</a></h4>
						<div id="smallABoard">2018년 3월14일에 발표합니다. 준비하세요!</div>
						
					</div>
					<div class="col-xs-2">
						<a href="#"><img class="footer-gara" src="${pageContext.request.contextPath}/resources/images/gara.jpg" title="서비스센터" /></a>
					</div>
				</div>
			</div>
			<div class="footer-waming">
				<h5>Planners는 통신판매중개자이며 통신판매 당사자가 아닙니다. 따라서 서비스 관련 문의는 해당 전문가에게 해주시기 바랍니다.</h5>
				<p>(주)플레너스의 사전 서면 동의 없이 플래너스 사이트의 일체의 정보, 콘텐츠 및 UI등을 상업적 목적으로 전재, 전송, 스크래핑 등 무단 사용할 수 없습니다.</p>
			</div>
			<div class="footer-info">
				<span><b>회사명:</b>(주)플레너스&nbsp;&nbsp;&nbsp;l&nbsp;&nbsp;&nbsp;</span> <span><b>주소:</b>서울시 금천구 코스모로 17길 41, 14층&nbsp;&nbsp;&nbsp;l&nbsp;&nbsp;&nbsp;</span> <span><b>대표:</b>전웅기&nbsp;&nbsp;&nbsp;l&nbsp;&nbsp;&nbsp;</span> <span><b>개인정보관리책임자:</b>박세창</span><br /> <span><b>사업자등록번호:</b>682-45-78541&nbsp;&nbsp;&nbsp;l&nbsp;&nbsp;&nbsp;</span> <span><b>전화번호:</b>1544-6524&nbsp;&nbsp;&nbsp;l&nbsp;&nbsp;&nbsp;</span> <span><b>이메일:</b>help@planners.com</span><br />
				<h6>Copyright &copy; 2018 OurPlanners Inc. All rights reserved</h6>
			</div>
		</div>
		<div class="col-lg-2 col-sm-1 col-xs-0"></div>
	</div>
</div>