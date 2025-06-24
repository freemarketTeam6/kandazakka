<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*,bean.Inquiries,java.util.ArrayList"%>

<%
ArrayList<Inquiries> inquiriesList = (ArrayList<Inquiries>) request.getAttribute("InquiriesList");
%>
<html>
<head>
<title>お問い合わせ一覧</title>

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/style.css">

<style>
body {
	min-width: 800px;
}

.inquiriesList {
	min-width: 800px;
	width: 90%;
	margin-top: 5%;
	margin-left: auto;
	margin-right: auto;
	border-spacing: 4px;
}

.inquiriesList th {
	text-align: center;
	width: fit-content;
	background-color: #cccccc;
	font-weight: bold;
}

.inquiriesList td {
	text-align: center;
	width: fit-content;
}

.inquiriesList span {
	display: inline-block;
}

.inquiriesList td:nth-child(n)>span {
	text-align: left;
}

.text td {
	text-align: center;
	color: #b22222;
}

#new{
text-align: right;
margin-right:10%;
}

</style>
</head>
<body>

<%@include file="../common/userHeader.jsp"%>

<p id="new">
<a href="<%=request.getContextPath()%>/view/newInquiry.jsp">新規作成</a>
</p>

<table class="inquiriesList">
		<tr>
			<th>No.</th>
			<th>カテゴリ</th>
			<th>お問い合わせタイトル</th>
			<th></th>
			
		</tr>
		
		<%
		//リストがnullじゃないとき繰り返し処理によってlistの値を取得
		if (!(inquiriesList.isEmpty())) {
			for (int i = 0; i < inquiriesList.size(); i++) {
				Inquiries inquiries = (Inquiries) inquiriesList.get(i);
				int No = i+1;
		%>
		<tr>
			<td><%=No%></td>
			<td><span><%=inquiries.getCategory()%></span></td>
			<td><span><%=inquiries.getTitle()%></span></td>

			<td>
			<a href="<%=request.getContextPath()%>/inquiry?inquiryNum=<%=inquiriesList.get(i).getInquiryno()%>&from=user">返信</a>
			</td>
		</tr>
		<%
		}
		} else {
		%>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<%
		}
		%>
	</table>
	<script type="text/javascript">


				for(var n=1;n<=3;n++){
					var span = document.querySelectorAll(".inquiriesList td:nth-child("+n+") > span");
					var maxw = 0;
					for(var i=0;i<span.length;i++){
					if( span[ i ].offsetWidth>maxw ){ maxw = span[ i ].offsetWidth }
					}
					for(var i=0;i<span.length;i++){
					span[ i ].style.width = maxw+"px";
					}
					}
			</script>
			<%@include file="../common/userFooter.jsp"%>
	</body>
	
</html>