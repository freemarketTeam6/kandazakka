<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*,bean.Inquiries"%>

<%
ArrayList<Inquiries> inquiriesList = (ArrayList<Inquiries>) request.getAttribute("InquiriesList");
%>
<html>
<head>
<title>お問い合わせ一覧</title>
</head>
<body>
	<%@include file="../common/adminHeader.jsp"%>

	<a href="<%=request.getContextPath()%>/view/adminMenu.jsp">【管理者メニュー画面】</a>
	<h1 style="text-align: center;">お問い合わせ一覧</h1>
	<hr style="text-align: center; height: 3px; background-color: black; width: 1500px">
	
	<table style="margin: auto">
		<tr>
			<th style="background-color:#ffffa8; width:200px">No.</th>
			<th style="background-color:#ffffa8; width:200px">カテゴリ</th>
			<th style="background-color:#ffffa8; width:200px">お問い合わせタイトル</th>
			<th style="background-color:#ffffa8; width:200px">ユーザー</th>
			<th style="background-color:#ffffa8; width:200px">返信</th>
		</tr>

		<!-- リクエストスコープからデータの取得 -->
		<%
		//リストがnullじゃないとき繰り返し処理によってlistの値を取得
		if (!(inquiriesList.isEmpty())) {
			for (int i = 0; i < inquiriesList.size(); i++) {
				Inquiries inquiries = (Inquiries) inquiriesList.get(i);
		%>
		<tr>
			<!-- DTOクラスを使用し一覧を表示 -->
			<td style="text-align: center; width: 200px"><%=inquiries.getInquiryno()%></td>
			<td style="text-align: center; width: 200px"><%=inquiries.getCategory()%></td>
			<td style="text-align: center; width: 200px"><%=inquiries.getTitle()%></td>
			<td style="text-align: center; width: 200px"><%=inquiries.getUser_id()%></td>

			<td style="text-align: center; width: 125px">
				<!-- PRIMARY KEYのgetInquirynoを参照してチャット機能へのリンク --> <a

				href="<%=request.getContextPath()%>/inquiry?inquiryNo=<%=inquiriesList.get(i).getInquiryno()%>&from=admin">返信</a>

			</td>
		</tr>
		<%
		}
		} else {
		%>
		<tr>
			<td style="text-align: center; width: 200px">&nbsp;</td>
			<td style="text-align: center; width: 200px">&nbsp;</td>
			<td style="text-align: center; width: 200px">&nbsp;</td>
			<td style="text-align: center; width: 250px" colspan="2">&nbsp;</td>
		</tr>
		<%
		}
		%>
	</table>
	</body>
	<!-- フッター部分 -->
	<%@include file="../common/adminFooter.jsp"%>
</html>