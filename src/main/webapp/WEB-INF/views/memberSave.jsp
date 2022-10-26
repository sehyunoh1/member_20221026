
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberSave.jsp</title>
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
        <form action="/save" method="post">
            <input type="text" name="memberEmail" placeholder="이메일" id="Email" class="form-control" onblur="EmailCk()"><br>
            <h5 id="emailCk"></h5>
            <input type="text" name="memberPassword" placeholder="비밀번호" id="Pass" class="form-control" onblur="PasswordCK()"><br>
            <h5 id="passwordCk"></h5>
            <input type="text" name="memberName" placeholder="이름" class="form-control"><br>
            <input type="text" name="memberAge" placeholder="나이" class="form-control"><br>
            <input type="text" name="memberMobile" placeholder="전화번호" class="form-control"><br>
            <input type="submit" class="btn btn-primary" value="회원 가입">
    </div>
    </form>
</body>
<script>
    const PasswordCK = () =>{
        const Password = document.getElementById("Pass").value;
        const exp = /^(?=.*[a-z])(?=.*\d)(?=.*[-_!@])[A-Z a-z\d-_!@]{5,10}$/;
        if(Password.match(exp)){
            passwordCk.innerHTML="올바른 비밀번호 입니다."
            passwordCk.style.color="green"
        }else if(Password.length==0){
            passwordCk.innerHTML="필수 입력 항목입니다."
            passwordCk.style.color="red"
        }else {
            passwordCk.innerHTML="비밀번호 형식을 확인해주세요."
            passwordCk.style.color="red"
        }
    }
    const EmailCk = () =>{
        const Email = document.getElementById("Email").value;
        if(Email.length != 0){
            emailCk.innerHTML="가능한 이메일입니다."
            emailCk.style.color="green"
        }else if(Email.length==0){
            emailCk.innerHTML="필수 입력 항목입니다."
            emailCk.style.color="red"
        }
    }
</script>
</html>
