<%@page contentType="text/html; charset=UTF-8"%>

<%
String userid="";
String password="";
//クッキーの取得
Cookie[]userCookie=request.getCookies();

//クッキーがあるか判定
if(userCookie!=null){
	//IDとパスワード情報の取得
	for(int i=0;i<userCookie.length;i++){
		if(userCookie[i].getName().equals("userid")){
			userid=userCookie[i].getValue();
		}
		
		if(userCookie[i].getName().equals("password")){
			password=userCookie[i].getValue();
		}
	}
}
String message = (String)request.getAttribute("message");
if(message==null){
	message="";
}
%>

<html>
	<head>
		<title>神田雑貨店フリマ</title>
	</head>
	<body>
 		<%@include file= "../common/userHeader.jsp" %>
 		<br>
		<div style="margin-bottom:250px">
		
		<body style="background-color:#FFFFFF; text-align:center;">
			<h1 style="color:#000000;">ログイン</h1>
		
		<div style="margin-bottom:300px">
		<br>	
 			<form action="<%=request.getContextPath()%>/login"method="post">
 				<table style="margin:0 auto">
 					<tr>
 						<th style="background-color:#6666ff; width:120px">ユーザーID</th>
 						<td ><input type=text size="30" name="userid" value="<%=userid%>"></input></td>
 					</tr>
 					<tr>
 						<th style="background-color:#6666ff; width:120px">パスワード</th>

 						<td ><input type=password size="30" name="password" value="<%=password %>"></input></td>

 					</tr>
 				</table>	
 					<div style="text-align: center">
 					<tr>
 						<td colspan=2 style="text-align:center"><br>
 							<input type="submit" value="ログイン">
 							<input type="hidden" name="from" value="user">
 						</td>
 					</tr>
					</div>
					<br>
					<div style="text-align: center">
 					<tr>	
 						<td style="text-align: center; width: 80px; font-size: 15px;"><a
							href="<%=request.getContextPath()%>/view/newRegistration.jsp">新規登録</a>
						</td>
 					</tr>
 					</div>
 			</form>
 			<p>
 			<%=message %>
 		<br>
 		</div>
 		<%@include file= "/common/userFooter.jsp" %>

		</table>	
 	</body>
 </html>
