package com.its.member.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.its.member.dto.MemberDTO;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public int save(MemberDTO memberDTO){ return sql.insert("Member.save", memberDTO);}

    public boolean login(String memberEmail, String memberPassword){
        MemberDTO loginDTO = new MemberDTO();
        loginDTO.setMemberEmail(memberEmail);
        loginDTO.setMemberPassword(memberPassword);
        sql.selectOne("Member.login", loginDTO);
        if(sql.selectOne("Member.login", loginDTO) !=null){
            return true;
        }else {
            return false;
        }
    }
    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }
    public List<MemberDTO> findAll(){ return sql.selectList("Member.findAll");}

    public MemberDTO findById(Long memberId){ return sql.selectOne("Member.findById", memberId);}

    public void delete(Long memberId){ sql.delete("Member.delete", memberId);}

    public MemberDTO findbyEmail(String memberEmail){return sql.selectOne("Member.findbyEmail",memberEmail);}

    public int update(MemberDTO memberDTO){return sql.update("Member.update",memberDTO);}
}
