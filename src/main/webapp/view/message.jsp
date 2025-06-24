<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList, bean.Message" %>

<%
ArrayList<Message> messageList = (ArrayList<Message>) request.getAttribute("messageList");
int goods_id = (int)request.getAttribute("goods_id");
%>

<html>
<head>
    <title>Chat Room</title>
    <style>

.container {
    width: 90%;
    max-width: 600px;
    margin: 10px auto;
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

input[type="text"], textarea {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px;
    border-radius: 5px;
    cursor: pointer;
}

input[type="submit"]:hover {
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
    
.message {
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

	<%@include file="../common/userHeader.jsp"%>
	
    <div class="container">
        <h1>取引メッセージ</h1>
        <form action="<%=request.getContextPath()%>/message" method="post" class="form">
            <textarea name="message" placeholder="メッセージを入力してください..." required></textarea>
            <input type="submit" value="送信">
            <input type="hidden" name="goods_id" value=<%= goods_id %>>
            <input type="hidden" name="cmd" value="insert">
        </form>

        <hr>

        <h2>Messages</h2>
        <div class="messages">
        <%
            if (messageList != null && !messageList.isEmpty()) {
                for (int i = 0; i < messageList.size(); i++) {
        %>
                    <div class="message">
                        <p class="message-content"><strong><%= messageList.get(i).getUserId() %>:</strong> <%= messageList.get(i).getMessage() %></p>
                        <p class="message-timestamp"><em><%= messageList.get(i).getDate() %></em></p>
                    </div>
        <%
                }
            } else {
        %>
                <p class="no-messages">No messages available.</p>
        <%
            }
        %>
        </div>
    </div>
	<%@include file="../common/userFooter.jsp"%>    
</body>
</html>
