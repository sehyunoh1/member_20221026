package com.its.member.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
    private Long MemberId;
    private  String MemberEmail;
    private String MemberPassword;
    private String MemberName;
    private int MemberAge;
    private String MemberMobile;
}
