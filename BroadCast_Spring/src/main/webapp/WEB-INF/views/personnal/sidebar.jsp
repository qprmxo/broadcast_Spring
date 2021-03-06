<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left"
	style="z-index: 3; width: 200px;" id="mySidebar">
	<br>
	<div class="w3-container">
		<a href="#" onclick="w3_close()"
			class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey"
			title="close menu"> <i class="fa fa-remove"></i>
		</a> 
		
		<c:choose>
			<c:when test="${profileVo.org_filename == null}">
				<img src="<c:url value='/resources/image/default.png'/>">
			</c:when>
			<c:otherwise>
				<img src="<c:url value='/resources/image/${profileVo.save_filename }'/>">
			</c:otherwise>
		</c:choose>
		
		<br> 
		<br>
		<h4>
			<b>${requestScope.id }</b>&emsp;
			<c:if test="${requestScope.id == sessionScope.id }">
				<a href="<c:url value='/${requestScope.id }/setting'/>"><i class="fa fa-cogs"></i></a>
			</c:if>
		</h4>
		<p class="w3-text-grey">${profileVo.title }</p>
	</div>
	<div class="w3-bar-block">
		<a href="<c:url value='/${requestScope.id }/boardInsert'/>"><button type="button" style="margin-left:10px;width:180px;">書き込み</button></a>
		<ul>
			<li><a href="<c:url value='/${requestScope.id }/boardList'/>">すべての書き込み</a></li>
			<c:forEach var="categoryVo" items="${categoryList }">
				<li><a href="<c:url value='/${requestScope.id }/boardList?category_num=${categoryVo.category_num }'/>">${categoryVo.name }</a></li>
			</c:forEach>
		</ul>
	</div>
	<div class="w3-panel w3-large">
		<a href="https://www.facebook.com"><i class="fa fa-facebook-official w3-hover-opacity"></i></a> 
		<a href="https://www.instagram.com"><i class="fa fa-instagram w3-hover-opacity"></i></a> 
		<a href="https://www.snapchat.com"><i class="fa fa-snapchat w3-hover-opacity"></i></a> 
		<a href="https://www.pinterest.co.kr"><i class="fa fa-pinterest-p w3-hover-opacity"></i></a> 
		<a href="https://twitter.com/login"><i class="fa fa-twitter w3-hover-opacity"></i></a> 
		<a href="https://kr.linkedin.com"><i class="fa fa-linkedin w3-hover-opacity"></i></a>
	</div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity"
	onclick="w3_close()" style="cursor: pointer" title="close side menu"
	id="myOverlay"></div>
