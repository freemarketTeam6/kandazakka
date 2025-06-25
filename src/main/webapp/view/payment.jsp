<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*,bean.Goods,util.MyFormat"%>

<%

MyFormat myFormat = new MyFormat();
%>

<html>
<head>
<title>入金</title>
</head>

<body>

<%@include file = "/common/userHeader.jsp"%>

<div>

<p>購入商品情報を確認し、入金してください。</p>

<%
//リクエストスコープから商品のGoodsオブジェクトを取得
Goods goods = (Goods)request.getAttribute("goods");


%>



<table>写真

<th>写真</th>
<td><img src="<%=request.getContextPath()%>/file/images/<%=orderList.get(i).getImgPath()%>" alt="商品写真"></td>
<th>商品名</th>
<td><%=goods.getGoodsName()%></td>

<th>個数</th>
<td><%=goods.getQuantity() %></td>

<th>種類</th>
<td><%=goods.getCategory() %></td>

<th>備考</th>
<td><%=goods.getGoodsMemo() %></td>

<th>価格</th>
<td><%=myFormat.moneyFormat(goodsList.get(i).getPrice()) %></td>



</table>



<form action="<%=request.getContextPath() %>/payment" method="POST">
<input type="submit" value="入金する">
</form>

<form action="<%=request.getContextPath() %>/buyList" method="POST">
<input type="submit"  value="キャンセル">
</form>


</div>

<%@include file = "/common/userFooter.jsp"%>







</body>
</html>