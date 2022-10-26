
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login.jsp</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <style>
        *{font-family:'Jua', sans-serif;
        }
        #main{
            width:300px;
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <div id="main" class="container">
        <form action="/login" method="post">
            <input type="text" name="memberEmail" placeholder="이메일" class="form-control"><br>
            <input type="text" name="memberPassword" placeholder="비밀번호" class="form-control" ><br>
            <input type="submit" class="btn btn-primary" value="로그인">
        </form>
    </div>
</body>
</html>
