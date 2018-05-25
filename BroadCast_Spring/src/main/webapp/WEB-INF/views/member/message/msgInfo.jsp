<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Msg_Info</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btnClose").on("click",function(){
			window.close();
		});
	});
</script>
<style>
table th{
	height:40px;
	width:80px;
}
</style>
<body>

<div class="w3-container w3-white w3-center">

	<h1>メッセージ確認</h1>

	<table border="1" style="margin: auto;">
		<tr>
			<th>貰った人</th><td>${vo.rid }</td>
		</tr>
		<tr>
			<th>送った人</th><td>${vo.sid }</td>
		</tr>
		<tr>
			<th>日付</th><td>${vo.regdate }</td>
		</tr>
		<tr>
			<th>内容</th><td><textarea rows="12" cols="40" name="content" readonly="readonly">${vo.content }</textarea></td>
		</tr>		
	</table>
	
	<br>
	
	<button type="button" id="btnClose" class="w3-button w3-teal w3-round-large" style="margin-left:380px;">閉じる</button>
	
</div>
</body>
</html>