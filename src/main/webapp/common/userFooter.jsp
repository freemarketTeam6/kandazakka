<%@ page contentType="text/html; charset=UTF-8" %>

<style>

.wrap{
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

footer{
    width: 100%;
    background-color: #ccff99;
    color: #black;
    text-align: center;
    padding: 5px 0;
}
</style>

<footer>
<div style="text-align:center">
<tr><a href="<%=request.getContextPath()%>/view/adminLogin.jsp" style="margin-right: 30px;">管理者ページ</a></tr>
</div>
<br>
<div style="text-align:center">
<tr><td>copyright (c) 2025 all rights reserved.</td></tr>
</div>
</footer>
