<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<title>BroadCast_Spring</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="resources/js/jquery-3.3.1.js"></script>
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}
table tr{
	height:50px;
}
a{
	text-decoration: none;
}
</style>
</head>
<body>

<div id="wrap">

	<div id="header" class="w3-main w3-light-grey" style="position: fixed;width: 100%;height:105px;">
		<tiles:insertAttribute name="header"/>
	</div>
	
	<div id="content" class="w3-main w3-light-grey" style="padding-top:100px;">
		
		<div id="main" >
			<tiles:insertAttribute name="content"/>
		</div>
		
	</div>
	
	<div id="footer" class="w3-main w3-light-grey">
		<tiles:insertAttribute name="footer"/>
	</div>

</div>

</body>
</html>