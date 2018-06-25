<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Header -->

<div class="w3-left w3-padding-8" style="margin-left:40px;">
	<a href="<c:url value='/main'/>"><h5>SpringKadai_BroadCast</h5></a>
</div>
	
<div class="w3-right" style="margin-top:5px;margin-right:150px;">

	<c:choose>
		<c:when test="${sessionScope.id == null }">
			<a href="login"><button class="w3-button w3-black">Login</button></a>
		</c:when>
		<c:otherwise>
			<div class="w3-dropdown-hover">
				<button class="w3-button w3-black">${sessionScope.id }</button>
				<div class="w3-dropdown-content w3-bar-block w3-border">	
					<a href="<c:url value='/${sessionScope.id }'/>" class="w3-bar-item w3-button"><i class="fa fa-home">&emsp;</i>ホーム</a> 	
					<a href="<c:url value='/recvList'/>" class="w3-bar-item w3-button"><i class="fa fa-envelope-o">&emsp;</i>メッセージ</a> 
					<a href="http://localhost:3000/enter?nickname=${sessionScope.id }" class="w3-bar-item w3-button"><i class="fa fa-wechat">&emsp;</i>チャット</a>
					<a href="#" class="w3-bar-item w3-button"><i class="fa fa-flask">&emsp;</i>アイテム</a> 
					<a href="#" class="w3-bar-item w3-button"><i class="fa fa-bar-chart">&emsp;</i>内訳</a>
					<a href="#" class="w3-bar-item w3-button"><i class="fa fa-video-camera">&emsp;</i>放送設定</a>
					<a href="<c:url value='/memberUpdate'/>" class="w3-bar-item w3-button"><i class="fa fa-drivers-license-o">&emsp;</i>会員情報修正</a>
					<a href="<c:url value='/logout'/>" class="w3-bar-item w3-button"><i class="fa fa-bed">&emsp;</i>ログアウト</a>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	

</div>
