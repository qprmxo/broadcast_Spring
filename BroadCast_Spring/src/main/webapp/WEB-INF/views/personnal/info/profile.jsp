<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<c:url value='/resources/js/jquery-3.3.1.js'/>"></script>	
<div>

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
});
</script>

	<a href="${sessionScope.id }/setting" class="w3-button w3-black w3-round-larg">プロフィール</a>
	<a href="${sessionScope.id }/category" class="w3-button w3-black w3-round-larg">カテゴリー</a>
	
	<form action="${sessionScope.id }/setting/update" method="post">
		<table>
			<tr>
				<th>タイトル</th><td><input type="text" name="title" value="${vo.title }"></td>
			</tr>
			<tr>
				<th>プロフィール写真</th>
				<td><input type="file" name="" id="imgFile">
					<span id="br"></span><img src="#" height="100" id="imgLogo"></td>
			</tr>
		</table>
	</form>
	
	<button type="button">設定</button>
</div>