
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberDetail.jsp</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <style>
        *{font-family:'Jua', sans-serif;  }
        #main{
            width: 300px;
            margin-top: 50px;

        }
    </style>
</head>
<body>
        <div class="container" id="main">
            <h2>조회 결과</h2>
            <h5> 이름 : ${member.memberName}</h5>
            <h5> 이메일 : ${member.memberEmail}</h5>
            <h5> 비밀번호 : ${member.memberPassword}</h5>
            <h5> 나이 : ${member.memberAge}</h5>
            <h5> 전화번호 : ${member.memberMobile}</h5>
<%--            <form action="/delete?memberId=${member.memberId}">--%>
<%--                <input type="submit" value="회원 탈퇴" class="btn btn-primary">--%>

<%--            </form>--%>
        </div>
</body>
</html>
