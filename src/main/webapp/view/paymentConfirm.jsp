<%@page contentType="text/html; charset=UTF-8"%>

<%@page import="bean.Goods,dao.GoodsDAO"  %>

<%@page import="java.util.*,bean.Goods,util.MyFormat"%>

<%

MyFormat myFormat = new MyFormat();
%>
<%
//送られてきた商品IDを取得
String goodsIdString = (String)request.getParameter("goodsId");
int goodsId = Integer.parseInt(goodsIdString);

//商品IDをもとに商品オブジェクトを検索
GoodsDAO goodsDao = new GoodsDAO();
Goods goods = goodsDao.selectGoodsByGoodsID(goodsId);

%>

<html>
<head>
<title>入金完了</title>
</head>

<body>

<%@include file = "/common/userHeader.jsp"%>

<div>

<p>入金が完了しました</p>

<br>


<table>写真

<th>写真</th>
<td><img src="<%=request.getContextPath() %>/file/images/<%= goods.getImgPath() %>" alt="商品写真"></td>

<th>商品名</th>
<td><%=goods.getGoodsName()%></td>

<th>個数</th>
<td><%=goods.getQuantity() %></td>

<th>種類</th>
<td><%=goods.getCategory() %></td>

<th>備考</th>
<td><%=goods.getGoodsMemo() %></td>

<th>価格</th>
<td><%=myFormat.moneyFormat(goods.getPrice())%></td>



</table>



商品発送までしばらくお待ちください

<form action="<%=request.getContextPath() %>/buyList" method="GET">
<input type="submit"  value="購入一覧へ戻る">
</form>


</div>

<%@include file = "/common/userFooter.jsp"%>







</body>
</html>