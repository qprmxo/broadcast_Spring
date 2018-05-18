<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="w3-container w3-white w3-padding-32 w3-center">

	<a href="recvList">
		<button type="button" class="w3-button">貰ったメッセージ</button>
	</a>
	<a href="sendList">
		<button type="button" class="w3-button w3-black w3-round-larg">送ったメッセージ</button>
	</a>
	
	<br><br>
	
	<table border="1" style="margin:auto;">
		<tr>
			<th style="width:100px;">貰った人</th>
			<th style="width:300px;">内容</th>
			<th style="width:100px;">日付</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<td colspan="3">メッセージがありません。</td>
			</tr>
		</c:if>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.rid }</td>
				<td>${vo.content }</td>
				<td>${vo.regdate }</td>
			</tr>
		</c:forEach>
	</table>

</div>