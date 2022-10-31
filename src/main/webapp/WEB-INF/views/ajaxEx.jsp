<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-28
  Time: 오후 1:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ajaxEx</title>
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
    <button onclick="ajax1()">ajax 요청1</button>
    <button onclick="ajax2()">ajax 요청2</button>
    <button onclick="ajax3()">ajax 요청3</button>
    <button onclick="ajax4()">ajax 요청4</button>
    <button onclick="ajax5()">ajax 요청5</button>
    <button onclick="ajax6()">ajax 요청6</button>
</body>
<script>
    const ajax1 = () => {
      console.log("ajax 호출");
      // ajax를 이용하여 /ajax1라는 주소로 get 요청
      $.ajax({
         type: "get", // http request method
          url:"/ajax1",
          success : function () { // 요청이 성공하고 서버로부터 받는 응답
             console.log("성공");S
          },
          error: function (){ // 요청이 실패하는 경우 실행됨.
             console.log("실패");
          }
        });
  }
    const ajax2 = () => {
        console.log("ajax2 호출");
        // ajax2 주소로 post 요청을 하고 controller 메서드도 정의
        $.ajax({
            type: "post",
            url : "/ajax2",
            success: function (){
                console.log("성공")
            },
            error : function (){
                console.log("실패");
            }

        })
    }
    const ajax3 = () => {
      console.log("ajax3 호출");
      const param1 = "hello";
      $.ajax({
          type:"get",
          url:"/ajax3",
          data: {
              value1: param1,
              value2: "world"
          },
          success: function (){
              console.log("성공")
          },
          error: function (){
              console.log("실패")
          }
      });
    }
    const param1 = "hello";
    const param2 = "friday";
    const ajax4 = () => {
      console.log("ajax4 호출")
        $.ajax({
           type:"post",
            url:"/ajax4",
            data:{
               value1: param1 ,
               value2: param2
            },
            dataType:"text", // 리턴받을 데이터 형식
            success: function (result){
               console.log("성공");
               console.log(result);
            },
            error: function () {
                console.log("실패");
            }
        });
    }
    const ajax5 = () => {
        $.ajax({
            type:"post",
            url:"/ajax5",
            data:{
                value1: param1,
                value2: param2
            },
            dataType: "json", //리턴을 객체로 받을수 있음 json 형식
            success: function (result){
                console.log("성공");
                console.log(result);
            },
            error: function (){
                console.log("실패");
            }
        })
    }
    const ajax6 = () => {
        $.ajax({
            type:"post",
            url:"/ajax6",
            data:{
                value1: param1,
                value2: param2
            },
            dataType: "json",
            success: function (result){
                console.log("성공");
                console.log(result);
            },
            error: function (){
                console.log("실패");
            }
        })
    }
</script>
</html>
