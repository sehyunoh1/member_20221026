
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberMain.jsp</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <style>
        *{font-family:'Jua', sans-serif;
        font-size: 30px;
            text-align: center;
            margin-top: 100px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>${sessionScope.loginEmail}님 환영합니다.</h2>

        <button class="btn btn-warning" onclick="updateform()">내정보 수정하기</button>
        <button class="btn btn-danger" onclick="logout()">로그아웃</button>
    </div>

</body>
<script>
    const updateform = () => {
        location.href= "/update";
    }
    const logout = () => {
      location.href="/logout";
    }
</script>
</html>
