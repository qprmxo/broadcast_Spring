<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="w3-padding-16" style="margin-left:20px;">

	<script type="text/javascript">
		$(function(){
			$("#btnBack").on("click", function(){
				history.back();
			});
		});
	</script>

	<h1>${boardVo.title }</h1>
	<span style="font-size:20pt;">${category_name }</span>
	<span style="font-size:20pt;margin-left:100px;">${boardVo.id }</span>
	<span style="margin-left:10px;">(${boardVo.regdate })</span>
	<br><br>
	
	<div style="height:150px;">${boardVo.content }</div>
	
	<br>
	
	<button type="button" id="btnBack" class="w3-button w3-teal w3-round-large">目録</button>
	<c:if test="${requestScope.id == sessionScope.id }">
		<button type="button" class="w3-button w3-teal w3-round-large">更新</button>
		<button type="button" class="w3-button w3-teal w3-round-large">削除</button>
	</c:if>
</div>