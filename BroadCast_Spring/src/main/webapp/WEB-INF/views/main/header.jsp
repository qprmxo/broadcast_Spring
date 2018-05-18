<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Header -->

<a href="#"><img src="/w3images/avatar_g2.jpg" style="width: 65px;"
	class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
	onclick="w3_open()"><i class="fa fa-bars"></i></span>
<div class="w3-container w3-light-grey w3-right w3-padding-32" style="margin-right:50px;">

	<c:choose>
		<c:when test="${sessionScope.id == null }">
			<a href="login"><button class="w3-button w3-black">Login</button></a>
		</c:when>
		<c:otherwise>
			<div class="w3-dropdown-hover">
				<button class="w3-button w3-black">${sessionScope.id }</button>
				<div class="w3-dropdown-content w3-bar-block w3-border">
					<a href="recvList" class="w3-bar-item w3-button">メッセージ</a> 
					<a href="#" class="w3-bar-item w3-button">アイテム</a> 
					<a href="#" class="w3-bar-item w3-button">内訳</a>
					<a href="#" class="w3-bar-item w3-button">放送設定</a>
					<a href="memberUpdate" class="w3-bar-item w3-button">会員情報修正</a>
					<a href="logout" class="w3-bar-item w3-button">ログアウト</a>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	

</div>
