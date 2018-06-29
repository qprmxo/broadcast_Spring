<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="w3-padding-16" style="margin-left:20px;">

	<script type="text/javascript">
		$(function(){
			$("#btnSearch").on("click", function(){
				if($("#search") == null || $("#search") == ""){
					alert("検索キーワードを入力してください。");
					return false;
				}
				$("#frm").submit();
			});
		});
	</script>

	<h1>${category_name }</h1>
	
	<br>
	
	<form action="<c:url value='/${requestScope.id }/boardSearch'/>" method="post" id="frm">	
	<span>
		<select name="searchField" style="height:28px;">
			<c:choose>
				<c:when test="${searchField == 'id' }">
					<option value="id" selected="selected">ID</option>
					<option value="title">タイトル</option>
					<option value="content">内容</option>
				</c:when>
				<c:when test="${searchField == 'title' }">
					<option value="id">ID</option>
					<option value="title" selected="selected">タイトル</option>
					<option value="content">内容</option>
				</c:when>
				<c:when test="${searchField == 'content' }">
					<option value="id">ID</option>
					<option value="title">タイトル</option>
					<option value="content" selected="selected">内容</option>
				</c:when>
				<c:otherwise>
					<option value="id">ID</option>
					<option value="title">タイトル</option>
					<option value="content">内容</option>
				</c:otherwise>
			</c:choose>
			
		</select>
		<input type="hidden" name="category_num" value="${category_num }"> 
		<input type="text" name="search" id="search" value="${search }">
		<button type="button" id="btnSearch" class="w3-button w3-teal w3-round-large">検索</button>
	</span>
	</form>
	<br><br>
	
	<c:choose>
		<c:when test="${not empty boardList }">
			<c:forEach var="boardVo" items="${boardList}">
				<a href="<c:url value='/${requestScope.id}/boardDetail?board_num=${boardVo.board_num }'/>">
					<span style="font-size:15pt;margin-left:20px;">${boardVo.title }</span>
				</a>
				
				<span>(${boardVo.id })</span>
				<span style="margin-left:20px;font-size:15pt;">${boardVo.regdate }</span>
				
				<br><br>
				
				<a href="<c:url value='/${requestScope.id}/boardDetail?board_num=${boardVo.board_num }'/>">
					<span style="margin-left:40px;">${boardVo.content }</span>
				</a>
				<hr style="border:0.5px solid black">
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div>書き込みがありません！！</div>
		</c:otherwise>
	</c:choose>
</div>
