<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="resources/js/jquery-3.3.1.js"></script>
<div class="w3-container w3-white w3-center w3-main" style="text-align:center;">

<script type="text/javascript">
	$(function(){
		$("#idCheck").on("click",function(){
			if($("#rid").val() == null || $("#rid").val() == ""){
				alert("IDを入力してください。");
				return false;
			}
			$.ajax({
				type : "post",
				url : "idCheck",
				data : {"id":$("#rid").val()},
				success : function(res){
					if(res == "false"){
						alert("発送可能です。");
					}else{
						alert("存在していない会員です。");
					}
				},
				error : function(e){
					alert("Error : " + e);
				}
			});
		});
		
		$("#btnSend").on("click",function(){
			if($("#rid").val() == null || $("#rid").val() == ""){
				alert("IDを入力してください。");
				return false;
			}
			frm.submit();
		});
		
		$("#btnClose").on("click",function(){
			window.close();
		});
	});
</script>

	<form action="msgSend" method="post" id="frm">
		
		<table border="1" style="margin: auto;">
			<tr>
				<th style="height:40px;">ID</th>
				<td>
					<input type="text" id="rid" name="rid">&emsp;
					<button type="button" id="idCheck" class="w3-button w3-teal w3-round-large">IDチェック</button>				
				</td>
			</tr>		
			<tr>
				<th>内容</th><td><textarea rows="20" cols="40" name="content"></textarea></td>
			</tr>
		</table>
		
		<br>
		
		<button type="button" id="btnSend" class="w3-button w3-teal w3-round-large">発送</button>
		<button type="button" id="btnClose" class="w3-button w3-teal w3-round-large">閉じる</button>
		
	</form>

</div>