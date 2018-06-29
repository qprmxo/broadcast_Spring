<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div>

<script type="text/javascript">
	$(function(){
		$("#chkAll").on("click",function(){
			if($(this).is(":checked")){
				$("input[type=checkbox]").attr("checked", "checked");
			}else{
				$("input[type=checkbox]").removeAttr("checked");
			}
		});
		
		$("#btnDelete").on("click",function(){
			if($("input.chk").is(":checked")){
				var flag = confirm("選択した項目を削除しますか?");
				if(flag){
					$("#frm").submit();
				}
			}else{
				alert("削除する項目を選択してください。");
				return false;
			}
		});
	});
</script>
	
	<a href="recvList">
		<button type="button" class="w3-button w3-black w3-round-larg">貰ったメッセージ</button>
	</a>
	<a href="sendList">
		<button type="button" class="w3-button">送ったメッセージ</button>
	</a>
	
	<br><br>
	
	<a href="msgSend" onclick="window.open(this.href, '', 'width=500, height=600'); return false;" style="margin-left: 440px;">
		<button type="button" class="w3-button w3-teal w3-round-large">作成</button>
	</a>
	<button type="button" id="btnDelete" class="w3-button w3-teal w3-round-large">削除</button>
	
	<br>
	
	<form action="msgRecvDelete" method="post" id="frm">
	
	<table border="1" style="margin: auto;">
		<tr>
			<th style="width:50px;"><input type="checkbox" id="chkAll"></th>
			<th style="width:50px;">状態</th>
			<th style="width:100px;">送った人</th>
			<th style="width:300px;">内容</th>
			<th style="width:100px;">日付</th>
		</tr>
		<c:if test="${empty messageList }">
			<tr>
				<td colspan="5">メッセージがありません。</td>
			</tr>
		</c:if>
		<c:forEach var="messageVo" items="${messageList }">
			<tr>
				<td><input type="checkbox" name="chk" value="${messageVo.msg_num }" class="chk"></td>
				<c:choose>
					<c:when test="${messageVo.read_check == 0 }">
						<td><i class="fa fa-envelope"></i></td>
					</c:when>
					<c:otherwise>
						<td><i class="fa fa-envelope-open-o"></i></td>
					</c:otherwise>
				</c:choose>
				<td>${messageVo.sid }</td>
				<td><a href="msgInfo?msg_num=${messageVo.msg_num }&cmd=read" 
						onclick="window.open(this.href, '', 'width=500, height=600'); return false;">${messageVo.content }</a></td>
				<td>${messageVo.regdate }</td>
			</tr>
		</c:forEach>
	</table>
	
	</form>
	
	<br><br>
	
	<div class="w3-bar-all w3-center">
		<c:choose>
			<c:when test="${pu.startPageNum>5 }">
				<a href="recvList?pageNum=${pu.startPageNum-1 }" class="w3-bar-item w3-button w3-hover-black">前へ</a>
			</c:when>
			<c:otherwise>
				<a href="#" class="w3-bar-item w3-button w3-hover-black">前へ</a>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${empty messageList }">
				<a href="#" class="w3-bar-item w3-button w3-hover-black"><span style="color:red">1</span></a>
			</c:when>
			<c:otherwise>
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum }">
						<a href="#" class="w3-bar-item w3-button w3-hover-black"><span style="color:red">${i }</span></a>
					</c:when>
					<c:otherwise>
						<a href="recvList?pageNum=${i }" class="w3-bar-item w3-button w3-hover-black">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				<a href="recvList?pageNum=${pu.endPageNum+1 }'/>" class="w3-bar-item w3-button w3-hover-black">次へ</a>
			</c:when>
			<c:otherwise>
				<a href="#" class="w3-bar-item w3-button w3-hover-black">次へ</a>
			</c:otherwise>
		</c:choose>
	</div>
	
</div>