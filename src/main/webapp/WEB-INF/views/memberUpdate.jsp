
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberUpdate.jsp</title>
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
    <div class="container">
        <form action="/update" method="post" name="updateform">
            <input type="text" name="memberId" value="${member.memberId}" class="form-control" >
            <input type="text" name="memberName" value="${member.memberName}" class="form-control" >
            <input type="text" name="memberEmail" value="${member.memberEmail}" class="form-control"readonly>
            <input type="text" name="memberPassword" placeholder="비밀번호" id="password" class="form-control">
            <input type="text" name="memberAge" value="${member.memberAge}" class="form-control" >
            <input type="text" name="memberMobile" value="${member.memberMobile}" class="form-control">
            <input type="button" class="btn btn-primary" value="회원정보 수정" onclick="update()">
        </form>
    </div>
</body>
<script>
    const update = () => {
      const passwordDB='${member.memberPassword}'; // DB에서 가져온 비밀번호

        const passwordCk=document.getElementById("password").value;
        if(passwordCk == passwordDB){
            document.updateform.submit();
        }else {
            alert("비밀번호가 일치하지 않습니다.");

        }
    }
</script>
</html>
