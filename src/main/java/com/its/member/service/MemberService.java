package com.its.member.service;

import com.its.member.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.its.member.dto.MemberDTO;

import java.lang.reflect.Member;
import java.util.List;


@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public boolean save (MemberDTO memberDTO){
    int result = memberRepository.save(memberDTO);
    if(result>0){
        return true;
    }else {
        return false;
    }
    }
    public boolean login(String memberEmail, String memberPassword){
    boolean loginResult = memberRepository.login(memberEmail,memberPassword);
    if(loginResult){
        return true;
    }else {
        return false;
    }
    }
    public boolean login(MemberDTO memberDTO) { // 메소드 오버로딩: 매개변수가 다름.
        MemberDTO member = memberRepository.login(memberDTO);
        if (member != null) {
            return true;
        } else {
            return false;
        }
    }
    public List<MemberDTO> findAll(){ return memberRepository.findAll();}

    public MemberDTO findById(Long memberId){ return memberRepository.findById(memberId);}

    public void delete(Long memberId) {memberRepository.delete(memberId);

    }
    public MemberDTO findbyEmail(String memberEmail){ return memberRepository.findbyEmail(memberEmail);}

    public boolean update(MemberDTO memberDTO){
        int result = memberRepository.update(memberDTO);
        if(result >0) {
            return true;
        }else {
            return false;
        }
    }
    public  String EmailCk(String Email) {
        String EmailCk = memberRepository.EmailCk(Email);
        System.out.println("EmailCk = " + EmailCk);
        if(EmailCk == null){
            return "ok";
        }else {
            return "no";
        }
    }
}
