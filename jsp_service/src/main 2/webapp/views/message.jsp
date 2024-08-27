<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Message List</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f5f5f5;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: flex-start; /* 从 flex-start 开始对齐 */
      min-height: 100vh;
      padding-top: 10%; /* 添加 padding-top 以便向上移动 */
    }
    .container {
      width: 80%;
      max-width: 800px;
      background-color: #ffffff;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
      padding: 20px;
    }
    .message-list {
      list-style-type: none;
      padding: 0;
      margin: 0;
    }
    .message-item {
      padding: 15px;
      border-bottom: 1px solid #ddd;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .message-item:last-child {
      border-bottom: none;
    }
    .message-content {
      max-width: 70%;
    }
    .message-time {
      color: #888;
      font-size: 0.9em;
    }
    .message-user {
      font-weight: bold;
    }
    .chat-link {
      color: #007bff;
      text-decoration: none;
    }
    .chat-link:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<div class="container">
  <h2>Message List</h2>
  <ul class="message-list">
    <c:forEach var="chatPartner" items="${chatPartners}">
      <li class="message-item">
        <div class="message-content">
          <a href="chat?partnerId=${chatPartner.id}" class="chat-link">
            <span class="message-user">${chatPartner.name}</span>
          </a>
        </div>
        <div class="message-time">${chatPartner.lastMessageTime}</div>
      </li>
    </c:forEach>
  </ul>
</div>
</body>
</html>