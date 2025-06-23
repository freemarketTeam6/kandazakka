<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Goods"%>


<html>
<head>
<title>出品商品一覧</title>
<link rel="stylesheet" href="../view/css/style.css">
</head>




<body>
	<header>
		<h2 style="text-align: center; font-size: 40px">出品一覧</h2>
		<hr size=10px color="greeen">
	</header>



	<hr size=5px color="black">

	<div>
		<table>
			<tr>
				<th>商品画像</th>
				<th>商品名</th>
				<th>金額</th>
				<th>取引状況</th>
			</tr>


			<%
		//リクエストスコープから出品一覧ArrayListを取得
		ArrayList<Goods> myGoodsList = request.getAttribute("myGoodsList");
		
		
		if(myGoodsList!=null){
			for(int i=0;i<myGoodsList.size();i++){
				Goods goods = (Goods)myGoodsList.get(i);
				%>

			<tr>
				<td><img src="<%=goods.getImgPath()%>"></td>
				<td><%=goods.getGoodsName() %></td>
				<td><%=goods.getPrice() %></td>
				<td>
					<%
					//商品のステータスを変数に格納
					String status = goods.getStatus;
			
					switch(status){
					case 0:
						%> 出品中 <%
					case 1:
					%> 入金待ち <%
					case 2:
						%>

					<form action="<%=request.getContextPath()%>/shipping" method="POST">
						<input type="submit" value="発送する">
					</form> <%
					case 3:
					%> 発送済み }
					

				</td>
			</tr>

			<% 
			}
		}
		%>
		</table>
		
		<form action="<%=request.getContextPath()%>/mypage" method="POST">
			<input type="submit" value="マイページへ戻る">
		</form>


	</div>


</body>
</html>
