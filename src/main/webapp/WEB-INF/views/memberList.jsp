
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>MemberList.jsp</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <style>
        *{font-family:'Jua', sans-serif;  }
        #main{

            text-align: center;

        }
        td,th {
            border: 1px solid black;
            border-collapse: collapse;
            height: auto;
            width : 300px;
            margin : auto;
            padding: 5px;
        }
    </style>
</head>
<body>
      <div id="main" class="container">
        <table>
            <tr>
                <th>이름</th>
                <th>이메일</th>
                <th>삭제</th>

            </tr>
        <c:forEach items="${memberList}" var="member">
            <tr>
                <td>
                    <a href="/member?memberId=${member.memberId}">${member.memberName}</a>
                </td>
                <td>${member.memberEmail}</td>
                <td>
                    <button class="btn btn-danger" onclick="deleteMember('${member.memberId}')">삭제</button>
                </td>
            </tr>
        </c:forEach>
        </table>
      </div>
</body>
<script>
    const deleteMember = (clickedId) => {

      <%--  console.log('${memberList}');--%>
        console.log("클릭한 id값:", clickedId);
        location.href="/delete?memberId="+clickedId;

    }
</script>
</html>
