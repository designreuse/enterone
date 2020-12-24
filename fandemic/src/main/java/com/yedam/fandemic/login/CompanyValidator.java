package com.yedam.fandemic.login;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.yedam.fandemic.vo.Company;
import com.yedam.fandemic.vo.Member;

public class CompanyValidator implements Validator {
	
	
	final static String emailRegExp = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
	final static String phoneRegExp = "^\\d{3}-\\d{3,4}-\\d{4}$";
	final static String notnull = "필수 입력";
	final static String typemsg = "형식 오류";
	
	private Pattern emailPattern;
	private Pattern phonePattern;
	
	
	public CompanyValidator() {
		emailPattern = Pattern.compile(emailRegExp);
		phonePattern = Pattern.compile(phoneRegExp);
	}
	
	
	@Override
	public boolean supports(Class<?> clazz) {
		
		return Company.class.isAssignableFrom(clazz);
		
		
	}
	@Override
	public void validate(Object target, Errors errors) {
		
		Company company = (Company) target;
		
		// 널 값
		
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "com_name", "required", notnull);
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "com_pw", "required", notnull);
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "com_address2", "required", notnull);

		
		// 널값 and 형식
		if(company.getCom_email() == null || company.getCom_email().trim().isEmpty() ) {
			errors.rejectValue("mem_email", "required",notnull);
		} else {
			Matcher matcher = emailPattern.matcher(company.getCom_email());
			if( !matcher.matches()) {
				errors.rejectValue("mem_email", "bad", typemsg);
			}
		}
		

		if(company.getCom_phone() == null || company.getCom_phone().trim().isEmpty() ) {
			errors.rejectValue("mem_phone", "required",notnull);
		} else {
			Matcher matcher = phonePattern.matcher(company.getCom_phone());
			if( !matcher.matches()) {
				errors.rejectValue("mem_phone", "bad", typemsg);
			}
		}
		
		
		
	}
	
	
	

}
