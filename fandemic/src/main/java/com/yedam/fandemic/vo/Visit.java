package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Visit {
	public String visit_id; //-기본키 , 시퀀스 달것임
	public String visit_ip; //접속자 아이피
	public String visit_time; //접속자 접속시간
	public String visit_refer; //접속자가 어느사이트를 타고 들어왔는지
	public String visit_agent; //접속자 브라우저 정보
}
