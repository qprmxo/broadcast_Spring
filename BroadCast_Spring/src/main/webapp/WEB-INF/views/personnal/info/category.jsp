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
						data : {"name":name,"index_num":$("#list").children().length},
						dataType : "json",
						success : function(data){
							if(data != 0){
								alert("掲示板を追加致しました。");
								location.reload();
								/* $("#list").append("<option id='" + data + "' value='" + data + "'>" + name + "</option>"); */
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
							if(data != 0){
								alert("掲示板を削除しました。");
								location.reload();
								/* $("#list option:selected").remove(); */
							}
						}
					});
				}
			});
			$("#btnUp").on("click", function(){
				$("#list option:selected").each(function(){
					if($(this).index() == 0){
						return false;
					}
					$("#list option:eq(" + ($(this).index() -1) + ")").before($(this));
				});
			});
			$("#btnDown").on("click", function(){
				$("#list option:selected").each(function(){
					if($(this).index() == $("#list").children().length){
						alert($("#list").children().length);
						return false;
					}
					$("#list option:eq(" + ($(this).index() +1) + ")").after($(this));
				});
			});
			$("#btnConfirm").on("click", function(){
				$("#list option").each(function(){
					$.ajax({
						type : "post",
						async : false,
						url : "<c:url value='/${sessionScope.id}/category/confirm'/>",
						data : {"category_num":$(this).val(),"index_num":$(this).index()},
						success : function(data){
							if(data == "false"){
								alert("エラー発生！");
							}
						}
					});
				});
				alert("手順設定を完了しました！");
				location.reload();
			});
		});
	</script>

	<h2>掲示板設定</h2>

	<a href="<c:url value='/${sessionScope.id }/setting'/>" class="w3-button w3-black w3-round-larg">プロフィール</a>
	<a href="<c:url value='/${sessionScope.id }/category'/>" class="w3-button w3-black w3-round-larg">掲示板</a>
	<br><br>
	<input type="text" id="name" placeholder="掲示板の名前入力">
	<button type="button" id="btnSubmit" class="w3-button w3-teal w3-round-large">追加</button>
	<button type="button" id="btnDelete" class="w3-button w3-teal w3-round-large">削除</button>
	<br>
	<select id="list" size="10" style="width:200px;">
		<c:forEach var="categoryVo" items="${categoryList }">
			<option value="${categoryVo.category_num}">${categoryVo.name }</option>
		</c:forEach>
	</select>
	<button type="button" id="btnUp" style="position:absolute;top:350px;">▲</button>
	<button type="button" id="btnDown">▼</button>
	<button type="button" id="btnConfirm" class="w3-button w3-teal w3-round-large">決定</button>
	
</div>
