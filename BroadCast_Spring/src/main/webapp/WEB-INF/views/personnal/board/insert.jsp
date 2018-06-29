<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="w3-padding-16" style="margin-left:20px;">

<script type="text/javascript">
	$(function(){
		$("#btnBack").on("click", function(){
			history.back();
		});
		$("#btnSubmit").on("click", function(){
			if($("#title").val() == null || $("#title").val() == ""){
				alert("タイトルを入力してください。");
				return false;
			}
			if($("#content").val() == null || $("#content").val().replace(/(^\s*)|(\s*$)/gi, "")){
				alert("内容を入力してください。");
				return false;
			}
			$("#frm").submit();
		});
	});
</script>

<h1>書き込み</h1>

<form action="<c:url value='/${requestScope.id }/boardInsert'/>" method="post" id="frm">
	<table border="1">
		<tr>
			<th>カテゴリー</th>
			<td>
				<select name="category" id="category" style="height:28px;">
					<c:forEach var="categoryVo" items="${categoryList }">
						<option value="${categoryVo.category_num }">${categoryVo.name }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>タイトル</th>
			<td><input type="text" name="title" id="title"></td>
		</tr>
		<tr>
			<th>内容</th>
			<td><textarea rows="7" cols="40" name="content" id="content"></textarea></td>
		</tr>
	</table>
</form>

<br>

<button type="button" id="btnSubmit" class="w3-button w3-teal w3-round-large" style="margin-left:300px;">確認</button>
<button type="button" id="btnBack" class="w3-button w3-teal w3-round-large">戻る</button>

</div>