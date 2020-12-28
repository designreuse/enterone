package com.yedam.fandemic.vo;

import lombok.Data;

@Data
public class Filter {
	
	String fil_no;
	String fil_prohibited;	//금칙어
	String fil_alternative;	//대체어
	
	String[] list;
	
}
