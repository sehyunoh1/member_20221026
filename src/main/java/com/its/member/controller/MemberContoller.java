package com.its.member.controller;

import com.its.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.its.member.dto.MemberDTO;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
import java.util.List;

@Controller
public class MemberContoller {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save") // 회원가입
    public String saveform (){ return "memberSave";}

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO){
    boolean saveResult = memberService.save(memberDTO);
    if(saveResult){
        return "memberLogin";
    }else {
        return "saveFail";
    }
    }

    @GetMapping("/login") // 로그인
    public String loginform(){return "memberLogin";}

//    @PostMapping("/login")
//    public String login(@RequestParam("memberEmail") String memberEmail,
//                        @RequestParam("memberPassword") String memberPassword, Model model){
//
//        boolean loginResult = memberService.login(memberEmail,memberPassword);
//        model.addAttribute("member",loginResult);
//        if(loginResult){
//            return "memberMain";
//
//        }else{
//            return "index";
//        }
//    }
    @PostMapping("login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model){
        boolean loginResult = memberService.login(memberDTO);
      if(loginResult){
           // 세션에 로그인한 사용자의 이메일을 저장
          session.setAttribute("loginEmail", memberDTO.getMemberEmail());
          model.addAttribute("modelEmail", memberDTO.getMemberEmail());
          return "memberMain";

       }else{
           return "memberLogin";
       }
    }

    @GetMapping("/members") // 회원 목록
    public String findAll (Model model){
        List<MemberDTO> memberList =memberService.findAll();
        model.addAttribute("memberList",memberList);
        return "memberList";
    }
    @GetMapping("/member") // 상세 회원 조회
    public String findMember(@RequestParam ("memberId") Long memberId, Model model){
        MemberDTO findResult = memberService.findById(memberId);
        model.addAttribute("member" ,findResult);
        return "memberDetail";
    }
    @GetMapping ("/delete") // 회원 탈퇴
    public String delete(@RequestParam("memberId") Long memberId) {
       memberService.delete(memberId);
       // 1. 삭제후 목록을 DB에서 가져오고 memberList.jsp로 출력
//        List<MemberDTO> memberDTOList = memberService.findAll();
//        model.addAttribute("memberList",memberDTOList);
//        return "memberList";

        // 2. redirect 방식을 이용하여 /members 주소 요청
        return "redirect:/members";
    }

    @GetMapping("/update")
    public String updateform(HttpSession session, Model model){
        // session 값을 가져오기
        // session.getAttribute의 리턴타입이 object이기 때문에 강제형변환
       String memberEmail= (String) session.getAttribute("loginEmail");
       MemberDTO updateDTO= memberService.findbyEmail(memberEmail);
       model.addAttribute("member",updateDTO);
        return "memberUpdate";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO ){
       boolean result =  memberService.update(memberDTO);
      if(result){
          //로그인 회원의 memberDetail.jsp
          return "redirect:/member?memberId="+memberDTO.getMemberId();
      }else {
          return "index";
      }
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
        }
    @GetMapping("/ajax-ex")
    public String ajaxEx(){
        return "ajaxEx";
    }

    @GetMapping("/ajax1")
    public @ResponseBody String ajax1(){
        System.out.println("MemberContoller.ajax1");
        return "ok";
    }
    @PostMapping("/ajax2")
    public @ResponseBody String ajax2(){
        System.out.println("MemberContoller.ajax2");
        return "ok2";
    }
    @GetMapping("/ajax3")
    public @ResponseBody String ajax3(@RequestParam ("value1") String value1,
                                      @RequestParam ("value2") String value2){
        System.out.println("MemberContoller.ajax3");
        System.out.println("value1,  = " + value1 + "" +",value2 = " + value2);
        return "vvv;";
    }
    @PostMapping("/ajax4")
    public @ResponseBody String ajax4(@RequestParam ("value1") String value1,
                                      @RequestParam ("value2") String value2){
        System.out.println("MemberContoller.ajax4");
        System.out.println("value1 = " + value1 + ",value2 = " + value2);
        String value3 = "hello";
        return value3;
    }
    @PostMapping("/ajax5")
    public @ResponseBody MemberDTO ajax5(@RequestParam ("value1") String value1,
                                      @RequestParam ("value2") String value2){
        System.out.println("MemberContoller.ajax5");
        System.out.println("value1 = " + value1 + ",value2 = " + value2);
        String value3 = "hello";
        MemberDTO memberDTO= memberService.findById(1L);
        return memberDTO; // memberDTO 객체 리턴
    }

    @PostMapping("/ajax6")
    public @ResponseBody List<MemberDTO> ajax6(@RequestParam ("value1") String value1,
                                         @RequestParam ("value2") String value2){
        System.out.println("MemberContoller.ajax5");
        System.out.println("value1 = " + value1 + ",value2 = " + value2);
        String value3 = "hello";
        List<MemberDTO> memberDTOList= memberService.findAll();
        return memberDTOList; // memberDTO 객체 리턴
    }
    @PostMapping("/duplicate-check")
    public @ResponseBody String EmailCk(@RequestParam ("Email") String Email){
        System.out.println("Email = " + Email);
        return memberService.EmailCk(Email);
    }
}
