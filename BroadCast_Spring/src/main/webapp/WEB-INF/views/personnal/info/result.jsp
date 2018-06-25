<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring_Kadai_Result</title>
<script type="text/javascript">
	function check(){
		var result = document.getElementById("result").value;
		alert(result);
		location.href="<c:url value='/${sessionScope.id}'/>";
	}
</script>
</head>
<body onload="check()">
<input type="hidden" id="result" value="${result }">
</body>
</html>