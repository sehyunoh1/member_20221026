package com.its.member.service;

import com.its.member.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.its.member.dto.MemberDTO;

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
    public List<MemberDTO> findAll(){ return memberRepository.findAll();}

    public MemberDTO findById(Long memberId){ return memberRepository.findById(memberId);}

    public boolean delete(Long memberId) {
        int deleteResult = memberRepository.delete(memberId);
        if (deleteResult>0){
            return true;
        } else {
            return false;
        }
    }
}
