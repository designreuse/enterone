package com.yedam.fandemic.login;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.yedam.fandemic.vo.Member;

public class SocialValidator implements Validator {
	
	
	final static String emailRegExp = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
	final static String phoneRegExp = "^\\d{3}-\\d{3,4}-\\d{4}$";
	final static String notnull = "필수 입력 사항입니다.";
	final static String typemsg = "형식을 확인하세요.";
	
	private Pattern emailPattern;
	private Pattern phonePattern;
	
	
	public SocialValidator() {
		emailPattern = Pattern.compile(emailRegExp);
		phonePattern = Pattern.compile(phoneRegExp);
	}
	
	
	@Override
	public boolean supports(Class<?> clazz) {
		
		return Member.class.isAssignableFrom(clazz);
		
		
	}
	@Override
	public void validate(Object target, Errors errors) {
		
		Member member = (Member) target;
		
		// 널 값
		
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mem_name", "required", notnull);
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mem_birth", "required", notnull);
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mem_address2", "required", notnull);

		
		// 널값 and 형식
		if(member.getMem_email() == null || member.getMem_email().trim().isEmpty() ) {
			errors.rejectValue("mem_email", "required",notnull);
		} else {
			Matcher matcher = emailPattern.matcher(member.getMem_email());
			if( !matcher.matches()) {
				errors.rejectValue("mem_email", "bad", typemsg);
			}
		}
		

		if(member.getMem_phone() == null || member.getMem_phone().trim().isEmpty() ) {
			errors.rejectValue("mem_phone", "required",notnull);
		} else {
			Matcher matcher = phonePattern.matcher(member.getMem_phone());
			if( !matcher.matches()) {
				errors.rejectValue("mem_phone", "bad", typemsg);
			}
		}
		
		
		
	}
	
	
	

}
