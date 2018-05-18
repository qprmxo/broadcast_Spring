<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
  
<div class="w3-container w3-white w3-padding-32 w3-center">

<script type="text/javascript">
	$(function(){
		$("#btnUpdate").on("click",function(){
			if($("#pwd").val() == null || $("#pwd").val() == ""){
				alert("パスワードを入力してください。");
				return false;
			}
			if($("#pwdCheck").val() == null || $("#pwdCheck").val() == ""){
				alert("パスワードチェックを入力してください。");
				return false;
			}
			if($("#pwdCheck").val() != $("#pwd").val()){
				alert("パスワードとパスワードチェックが違います。");
				return false;
			}
			if($("#name").val() == null || $("#name").val() == ""){
				alert("名前を入力してください。");
				return false;
			}
			
			$("#frm").submit();
		});
		
		$("#btnReturn").on("click",function(){
			history.back();
		});
	});
</script>

<h1>会員情報修正</h1><br>

	<form action="update" method="post" id="frm">
		<table style="margin:auto;">
			<tr>
				<th>会員番号</th><td><input type="text" value="${vo.m_num }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>会員ID</th><td><input type="text" value="${vo.id }" name="id" readonly="readonly"></td>
			</tr>
			<tr>
				<th>パスワード</th><td><input type="password" name="pwd" id="pwd" value="${vo.pwd }"></td>
			</tr>
			<tr>
				<th>パスワードチェック</th><td><input type="password" id="pwdCheck" value="${vo.pwd }"></td>
			</tr>
			<tr>
				<th>名前</th><td><input type="text" name="name" id="name" value="${vo.name }"></td>
			</tr>
		</table>
		
		<br>
		
		<button type="button" id="btnUpdate" class="w3-button w3-teal w3-round-large">修正</button>
		<button type="button" id="btnReturn" class="w3-button w3-teal w3-round-large">戻る</button>
		
	</form>

</div>