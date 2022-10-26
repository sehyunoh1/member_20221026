package com.its.member.controller;

import com.its.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.its.member.dto.MemberDTO;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

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

    @PostMapping("/login")
    public String login(@RequestParam("memberEmail") String memberEmail,
                        @RequestParam("memberPassword") String memberPassword, Model model){

        boolean loginResult = memberService.login(memberEmail,memberPassword);
        model.addAttribute("member",loginResult);
        if(loginResult){
            return "memberMain";

        }else{
            return "index";
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
    @GetMapping("/delete") // 회원 탈퇴
    public String delete(@RequestParam("memberId") Long memberId) {
        boolean delete = memberService.delete(memberId);
        if(delete){
            return "memberDelete";
        }else {
            return "memberList";
        }
    }
}
