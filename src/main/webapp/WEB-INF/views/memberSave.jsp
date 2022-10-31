
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberSave.jsp</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="/resources/js/jquery.js"></script>
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
        <form action="/save" method="post" name="saveForm">
            <input type="text" name="memberEmail" placeholder="이메일" id="Email" class="form-control" onblur="EmailCk()"> <br>
            <span id="emailCk"></span>
            <input type="text" name="memberPassword" placeholder="비밀번호" id="Pass" class="form-control" onblur="PasswordCK()"><br>
            <span id="passwordCk"></span>
            <input type="text" name="memberName" placeholder="이름" class="form-control"><br>
            <input type="text" name="memberAge" placeholder="나이" class="form-control"><br>
            <input type="text" name="memberMobile" placeholder="전화번호" class="form-control"><br>
<%--            <input type="submit" class="btn btn-primary" value="회원 가입">--%>
            <input type="button" value="회원가입" onclick="save()" class="btn btn-primary">
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
    // const EmailCk = () =>{
    //     const Email = document.getElementById("Email").value;
    //     if(Email.length != 0){
    //         emailCk.innerHTML="가능한 이메일입니다."
    //         emailCk.style.color="green"
    //     }else if(Email.length==0){
    //         emailCk.innerHTML="필수 입력 항목입니다."
    //         emailCk.style.color="red"
    //     }
    // }
    const save = () => {
      if(document.saveForm.memberEmail.value == ""){
          // alert("이메일을 입력해 주세요")
          emailCk.innerHTML="이메일을 입력해주세요."
          emailCk.style.color = "red"
          return false;
      }else if(document.saveForm.memberPassword.value == "") {
          alert("비밀번호를 입력해주세요")
          return false;
      }else if (document.saveForm.memberName.value == ""){
          return false;
      }
      alert("회원가입이 완료되었습니다.")
      document.saveForm.submit();
    }
    const EmailCk = () => {
        const Email = document.getElementById("Email").value;
        const EmailCK1 = document.getElementById("emailCk");

      $.ajax({
          type: "post",
          url: "/duplicate-check",
          data : { Email: Email},
          dataType:"text",
          success: function (result){
              if(result == "ok"){
                  console.log("EmailCk:", result);
                  EmailCK1.innerHTML="사용할수 있는 이메일입니다."
                  EmailCK1.style.color="green";
              }else if(result == "no") {
                  EmailCK1.innerHTML = "이미 사용중인 이메일입니다."
                  EmailCK1.style.color S= "red";
              }
          },
          error: function () {
          }
      });
    }
</script>
</html>
