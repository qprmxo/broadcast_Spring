<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<div class="w3-padding-16" style="margin-left:20px;">

	<script type="text/javascript">
		$(function(){
			$("#imgFile").change(function () {
		        if (this.files && this.files[0]) {
		        	$("#br").empty();
		            var reader = new FileReader();
		            $("#br").append("<br>");
		            reader.onload = function (e) {
		                $('#imgLogo').attr('src', e.target.result);
		            }
		            reader.readAsDataURL(this.files[0]);
		        }
		    });
			$("#btnSubmit").on("click", function(){
				$("#frm").submit();
			});
		});
	</script>

	<h2>プロフィール設定</h2>

	<a href="<c:url value='/${sessionScope.id }/setting'/>" class="w3-button w3-black w3-round-larg">プロフィール</a>
	<a href="<c:url value='/${sessionScope.id }/category'/>" class="w3-button w3-black w3-round-larg">掲示板</a>
	
	<form action="<c:url value='/${sessionScope.id }/setting/update'/>" method="post" id="frm" enctype="multipart/form-data">
		<table>
			<tr>
				<th>タイトル</th><td><input type="text" name="title" value="${vo.title }"></td>
			</tr>
			<tr>
				<th>プロフィール写真</th>
				<td><input type="file" name="imgfile" id="imgFile">
					<span id="br"></span><img src="#" height="100" id="imgLogo"></td>
			</tr>
		</table>
	</form>
	
	<button type="button" id="btnSubmit">設定</button>
</div>