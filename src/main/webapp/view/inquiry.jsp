<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList, bean.Message,bean.User,dao.UserDAO" %>

<%
ArrayList<Message> messageList = (ArrayList<Message>) request.getAttribute("messageList");
int inquiryNo = (int)request.getAttribute("inquiryNo");
%>

<html>
<head>
<title>お問い合わせ</title>
<link rel="stylesheet" href="../css/style.css">

  <style>
   body {
    font-family: Arial, sans-serif;
    color: #333;
    margin: 0;
    padding: 0;
}

.container {
    width: 90%;
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    display: flex;
    flex-direction: column;
    gap: 20px;
}

h1 {
    text-align: center;
    color: #4CAF50;
    margin-bottom: 0;
}

.form {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

#textarea {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

#submit{
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px;
    border-radius: 5px;
    cursor: pointer;
}

#submit:hover {
    background-color: #45a049;
}

.messages {
    display: flex;
    flex-direction: column;
    gap: 10px;
    max-height: 300px;
    overflow-y: auto;
    padding-right: 10px;
}

.adminMessage {
	/* display:left; で管理者のメッセージを右寄せにしたい*/
    display: flex;
    flex-direction: column;
    background-color: #8fbc8f;
    padding: 10px;
    border-radius: 10px;
    box-shadow: 0 1px 1.5px rgba(0, 0, 0, 0.15);
}
    
.userMessage {
	/* display:right;でユーザーのメッセージを右寄せにしたい*/
    display: flex;
    flex-direction: column;
    background-color: #dcf8c6;
    padding: 10px;
    border-radius: 10px;
    box-shadow: 0 1px 1.5px rgba(0, 0, 0, 0.15);
}

.message-content {
    margin: 0;
}

.message-content strong {
    color: #075E54;
}

.message-timestamp {
    text-align: right;
    color: #999;
    font-size: 0.8em;
    margin: 0;
}

.no-messages {
    text-align: center;
    color: #999;
    font-size: 1.2em;
}
    </style>

</head>
<body>

<%@include file="/common/userHeader.jsp"%>

<body>

<%-- <%@include file= "/common/userHeader.jsp" %> --%>

<br><br>

    <div class="container">
        <h1>問い合わせメッセージ</h1>
        <form action="<%=request.getContextPath()%>/inquiry" method="POST" class="form">
            <textarea name="message" placeholder="メッセージを入力してください..." required id="textarea"></textarea>
            <input type="submit" value="送信" id="submit">
            <input type="hidden" name="inquiryNo" value="<%= inquiryNo %>">
            <input type="hidden" name="cmd" value="insert">
            <input type="hidden" name="from" value="user">
        </form>

        <hr>

        <h2>Messages</h2>
        <div class="messages">
        <%
        	UserDAO userDao = new UserDAO();
            if (messageList != null && !messageList.isEmpty()) {
                for (int i = 0; i < messageList.size(); i++) {
                	String userId = messageList.get(i).getUserId();
                	User massageUser=userDao.selectByUser(userId);
                	
        %>
        		<!-- 管理者権限ユーザーの発言の場合は、チャットの色変える -->
        		<% if( user.getAuthority().equals("m")){ %>
        			<div class="adminMessage">
                        <p class="message-content"><strong><%= messageList.get(i).getUserId() %>:</strong> <%= messageList.get(i).getMessage() %></p>
                        <p class="message-timestamp"><em><%= messageList.get(i).getDate() %></em></p>
                    </div>
        		
        		<% }else{ %>
                    <div class="userMessage">
                        <p class="message-content"><strong><%= messageList.get(i).getUserId() %>:</strong> <%= messageList.get(i).getMessage() %></p>
                        <p class="message-timestamp"><em><%= messageList.get(i).getDate() %></em></p>
                    </div>
        <% }
        	}
          }else{%> 
                <p class="no-messages">No messages available.</p>
        <%
            }
        %>
        </div>
    </div>

	<br><br>

<div style="text-align:center">
    <a href="<%=request.getContextPath()%>/inquiryList">問い合わせ一覧に戻る</a>
    	<%@include file="../common/userFooter.jsp"%>
    	</div>

</body>
</html>