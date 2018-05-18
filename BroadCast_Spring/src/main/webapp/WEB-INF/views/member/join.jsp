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
		
		$("#btnCheck").on("click",function(){
			if($("#id").val() == null || $("#id").val() == ""){
				alert("IDを入力してください。");
				return false;
			}
			$.ajax({
				type : "post",
				url : "idCheck",
				data : {"id":$("#id").val()},
				success : function(res){
					if(res == "true"){
						alert("使用可能です。");
					}else{
						alert("同じIDが存在しています。");
					}
				}
			});
		});
		
		$("#btnReturn").on("click",function(){
			history.back();
		});
	});
</script>

<h1>新規登録</h1><br>

	<form action="join" method="post" id="frm">
		<table style="margin:auto;">
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" id="id"></td>
			</tr>
			<tr>
				<th></th>
				<td><button type="button" id="btnCheck" class="w3-button w3-border w3-border-red w3-round-large">IDチェック</button></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" name="pwd" id="pwd"></td>
			</tr>
			<tr>
				<th>Password確認</th>
				<td><input type="password" name="pwdCheck" id="pwdCheck"></td>
			</tr>
			<tr>
				<th>名前</th>
				<td><input type="text" name="name" id="name"></td>
			</tr>
		</table>
	</form>
	
	<br>
	
	<button type="button" id="btnSubmit" class="w3-button w3-teal w3-round-large">登録</button>
	<button type="button" id="btnReturn" class="w3-button w3-teal w3-round-large">戻る</button>
	
</div>
