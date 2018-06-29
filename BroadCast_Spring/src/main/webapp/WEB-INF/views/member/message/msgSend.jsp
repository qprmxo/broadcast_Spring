<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Message_Send</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="resources/js/jquery-3.3.1.js"></script>
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
			$("#frm").submit();
		});
		
		$("#btnClose").on("click",function(){
			window.close();
		});
	});
</script>
<body>

	<div class="w3-container w3-white w3-center">
	
		<h1>メッセージ書き</h1>
	
		<form action="msgSend" method="post" id="frm">
			
			<table border="1" style="margin: auto;">
				<tr>
					<th style="height:40px;width:50px;">ID</th>
					<td>
						<span style="vertical-align: bottom;">
							<input type="text" id="rid" name="rid">
						</span>&emsp;
						<button type="button" id="idCheck" class="w3-button w3-teal w3-round-large" style="padding:5px 5px;">IDチェック</button>				
					</td>
				</tr>		
				<tr>
					<th>内容</th><td><textarea rows="15" cols="40" name="content"></textarea></td>
				</tr>
			</table>
			
			<br>
			
			<button type="button" id="btnSend" class="w3-button w3-teal w3-round-large" style="margin-left:300px;">発送</button>
			<button type="button" id="btnClose" class="w3-button w3-teal w3-round-large">閉じる</button>
			
		</form>
	
	</div>

</body>
</html>