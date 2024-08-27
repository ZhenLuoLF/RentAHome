<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Live Chat</title>
    <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            padding-top: 10%;
        }
        .chatbox {
            width: 360px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .chatbox-header {
            background-color: #56c4d8;
            color: white;
            padding: 15px;
            text-align: center;
            font-weight: bold;
        }
        .chatbox-body {
            background-color: white;
            padding: 15px;
            max-height: 400px;
            overflow-y: auto;
        }
        .chatbox-footer {
            padding: 10px;
            background-color: #f5f5f5;
            border-top: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .message {
            margin-bottom: 15px;
        }
        .message-text {
            background-color: #e9f5fa;
            padding: 10px 15px;
            border-radius: 15px;
            max-width: 80%;
        }
        .message.user .message-text {
            background-color: #f1f1f1;
            text-align: left;
            margin-left: auto;
        }
        .chatbox-footer input[type="text"] {
            flex: 1;
            padding: 10px;
            border: none;
            border-radius: 20px;
            box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
            outline: none;
        }
        .chatbox-footer button {
            border: none;
            background-color: #56c4d8;
            color: white;
            border-radius: 20px;
            padding: 10px 15px;
            cursor: pointer;
            margin-left: 10px;
        }
    </style>
    <script>
        function addMessage() {
            const messageInput = document.getElementById("messageInput");
            const messageContent = messageInput.value.trim();

            if (messageContent !== "") {
                const chatboxBody = document.querySelector(".chatbox-body");

                const messageDiv = document.createElement("div");
                messageDiv.classList.add("message", "user");

                const messageTextDiv = document.createElement("div");
                messageTextDiv.classList.add("message-text");
                messageTextDiv.textContent = messageContent;

                messageDiv.appendChild(messageTextDiv);
                chatboxBody.appendChild(messageDiv);

                messageInput.value = "";

                chatboxBody.scrollTop = chatboxBody.scrollHeight;
            }
        }
    </script>
</head>
<body>
<div class="chatbox">
    <div class="chatbox-header">Live Chat</div>
    <div class="chatbox-body">
        <div class="message">
            <div class="message-text">
                Hello and thank you for reserving our house. Please confirm your
                check-in date.
            </div>
        </div>

        <c:forEach var="message" items="${messages}">
            <div
                    class="message ${message.senderId == sessionScope.username ? 'user' : ''}"
            ></div>
            <!-- <div class="message-text">${message.content}</div> -->
        </c:forEach>
    </div>
    <div class="chatbox-footer">
        <form
                action="/message/addmessage"
                method="post"
                onsubmit="addMessage(); return false;"
        >
            <input
                    type="hidden"
                    name="senderId"
                    value="${sessionScope.username}"
            />
            <input type="hidden" name="receiverId" value="${receiverId}" />
            <input
                    type="text"
                    name="message"
                    id="messageInput"
                    placeholder="Type your message"
                    required
            />
            <button type="submit">Send</button>
        </form>
    </div>
</div>
</body>
</html>