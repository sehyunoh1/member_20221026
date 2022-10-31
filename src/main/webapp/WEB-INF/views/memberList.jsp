
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
    <script src="/resources/js/jquery.js"></script>
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
        #findmember {
            margin-top: 50px;
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
                <th>조회(ajax)</th>
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
                <td>
                    <button class="btn btn-primary" onclick="findMember('${member.memberId}')">조회</button>
                </td>

            </tr>
        </c:forEach>
        </table>

<%--          <table id="findmember">--%>
<%--              <tr>--%>
<%--                  <td id="findName">이름 </td>--%>
<%--                  <td id="findEmail">이메일 </td>--%>
<%--                  <td id="findPassword">비밀번호 </td>--%>
<%--                  <td id="findAge">나이 </td>--%>
<%--              </tr>--%>
<%--          </table>--%>
      </div>
    <div id="detail-area">

    </div>
</body>
<script>
    const deleteMember = (clickedId) => {
      <%--  console.log('${memberList}');--%>
      //   console.log("클릭한 id값:", clickedId);
        location.href="/delete?memberId="+clickedId;
    }
    const findMember = (findId) => {
        console.log("findId:", findId)
        const detailArea = document.getElementById("detail-area");
        $.ajax({
           type: "post",
           url:"/detail-ajax",
           data:{findId,findId},
           dataType: "json",
           success: function (member){
               // console.log(result);
            // document.getElementById("findName").innerHTML =result.MemberName;
            // document.getElementById("findEmail").innerHTML=result.MemberEmail;
            // document.getElementById("findPassword").innerHTML=result.MemberPassword;
            // document.getElementById("findAge").innerHTML=result.MemberAge;
               let result =
                   "        <table class=\"table table-striped\">\n" +
                   "            <tr>\n" +
                   "                <th>id</th>\n" +
                   "                <td>"+ member.MemberId+"</td>\n" +
                   "            </tr>\n" +
                   "            <tr>\n" +
                   "                <th>email</th>\n" +
                   "                <td>" + member.MemberEmail + "</td>\n" +
                   "            </tr>\n" +
                   "            <tr>\n" +
                   "                <th>password</th>\n" +
                   "                <td>" + member.MemberPassword + "</td>\n" +
                   "            </tr>\n" +
                   "            <tr>\n" +
                   "                <th>name</th>\n" +
                   "                <td> " + member.MemberName + "</td>\n" +
                   "            </tr>\n" +
                   "            <tr>\n" +
                   "                <th>age</th>\n" +
                   "                <td>" + member.MemberAge + "</td>\n" +
                   "            </tr>\n" +
                   "        </table> "  ;
               detailArea.innerHTML = result;
           }
        });

    }
</script>
</html>
