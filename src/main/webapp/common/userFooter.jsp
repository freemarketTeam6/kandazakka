<%@ page contentType="text/html; charset=UTF-8" %>

<style>

.wrap{
  display: flex;
  flex-direction: column;
  min-height: 60vh;
}

footer{
	height: 30px;
    width: 100%;
    color: #black;
    text-align: center;
    padding: 5px 0;
}

</style>

<footer>
<div class="wrap"></div>
	<div style="text-align:center">
	<p style="background-color:#ccff99;">
	<tr><a href="<%=request.getContextPath()%>/view/adminLogin.jsp" style="margin-right: 30px;">管理者ページ</a></tr>
	</p>
	<p style="background-color:#ccff99;">
	<tr><td>copyright (c) 2025 all rights reserved.</td></tr>
	</p>
	</div>
</footer>
