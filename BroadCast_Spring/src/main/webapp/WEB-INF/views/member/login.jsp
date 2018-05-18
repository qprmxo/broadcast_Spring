<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="w3-container w3-white w3-padding-32 w3-center">

<script type="text/javascript">

	$(function(){
		$("#btnSubmit").on("click",function(){
			if($("#id").val() == null || $("#id").val() == ""){
				alert("IDを入力してください。");
				return false;
			}
			if($("#pwd").val() == null || $("#pwd").val() == ""){
				alert("パスワードを入力してください。");
				return false;
			}
			
			$("#frm").submit();
		});
			
		$("#btnReturn").on("click",function(){
			history.back();
		});
	});

</script>

<h1>ログイン</h1><br>

	<form action="login" method="post" id="frm">
		<table style="margin:auto;">	
			<tr>
				<th>ID</th><td><input type="text" name="id" id="id"></td>
			</tr>
			<tr>
				<th>Password</th><td><input type="password" name="pwd" id="pwd"></td>
			</tr>
		</table>
		
		<br>
		
		<button type="button" id="btnSubmit" class="w3-button w3-teal w3-round-large">ログイン</button>
		<a href="join"><button type="button" class="w3-button w3-teal w3-round-large">新規登録</button></a>
		<button type="button" id="btnReturn" class="w3-button w3-teal w3-round-large">戻る</button>
	</form>

</div>
