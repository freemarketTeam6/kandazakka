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
 		<%@include file= "../common/adminHeader.jsp" %>
 		<br>
		<div style="margin-bottom:250px">
		
		<body style="background-color:#FFFFFF; text-align:center;">
			<h1 style="color:#000000;">管理者ログイン</h1>
		<hr style="text-align: center; height: 2px; background-color: black; width: 950px">
		
		
		<div style="margin-bottom:300px">
		<br>	
 			<form action="<%=request.getContextPath() %>/LoginServlet"method="post">
 				<table style="margin:0 auto">
 					<tr>
 						<th style="background-color:#6666ff; width:120px">ユーザーID</th>
 						<td ><input type=text size="30" name="userid" value="<%=userid%>"></input></td>
 					</tr>
 					<tr>
 						<th style="background-color:#6666ff; width:120px">パスワード</th>
 						<td ><input type=text size="30" name="password" value="<%=password %>"></input></td>
 					</tr>
 					
 					<tr>
 						<td colspan=2 style="text-align:center"><br>
 							<input type="submit" value="ログイン">
 						</td>
 					</tr>
 					
 					<tr>	
 						<td style="text-align: center; width: 80px; font-size: 15px;"><a
							href="<%=request.getContextPath() %>/view/menu.jsp">新規登録</a>
							
						</td>
 					</tr>
 				</table>
 			</form>
 			<p>
 			<%=message %>
 		<br>
 		</div>
 		<%@include file= "../common/adminFooter.jsp" %>
		</table>	
 	</body>
 </html>