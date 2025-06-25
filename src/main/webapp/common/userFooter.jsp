<%@ page contentType="text/html; charset=UTF-8" %>

<style>
.wrapper{
    min-height: 100vh;
    position: relative;/*←相対位置*/
    padding-bottom: 30px;/*←footerの高さ*/
    box-sizing: border-box;/*←全て含めてmin-height:100vhに*/
}

footer{
    width: 100%;
    background-color: #ccff99;
    color: #black;
    text-align: center;
    padding: 5px 0;

 position: absolute;/*←絶対位置*/
    bottom: 0; /*下に固定*/
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