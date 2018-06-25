<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="w3-padding-16" style="margin-left:20px;">

	<script type="text/javascript">
		$(function(){
			$("#btnSubmit").on("click", function(){
				var name = $("#name").val();
				if(name == null || name == ""){
					alert("掲示板の名前を入力してください。");
					return false;
				}else{
					$.ajax({
						type : "post",
						url : "<c:url value='/${sessionScope.id}/category/insert'/>",
						data : {"name":name},
						success : function(data){
							if(data){
								alert("掲示板を追加致しました。");
							}
						}
					});
				}
			});
			$("#btnDelete").on("click", function(){
				var opt = $("#list option:selected").val();
				if(opt == null || opt == ""){
					alert("削除対象を選んでください。");
					return false;
				}else{
					$.ajax({
						type : "post",
						url : "<c:url value='/${sessionScope.id}/category/delete'/>",
						data : {"category_num":opt},
						success : function(data){
							if(data){
								alert("掲示板を削除しました。");
							}
						}
					});
				}
			});
		});
	</script>

	<h2>掲示板設定</h2>

	<a href="<c:url value='/${sessionScope.id }/setting'/>" class="w3-button w3-black w3-round-larg">プロフィール</a>
	<a href="<c:url value='/${sessionScope.id }/category'/>" class="w3-button w3-black w3-round-larg">掲示板</a>
	<br><br>
	<input type="text" id="name" placeholder="掲示板の名前入力">
	<button type="button" id="btnSubmit">追加</button>
	<button type="button" id="btnDelete">削除</button>
	<br>
	<select id="list" size="10" style="width:200px;">
		<c:forEach var="category_list" items="${category_list }">
			<option value="${category_list.category_num}">${category_list.name }</option>
		</c:forEach>
	</select>
	
</div>
