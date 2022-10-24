package com.toyou.project.handler;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

import com.toyou.project.dto.ResponseDTO;

@ControllerAdvice
@RestController
public class GlobalExceptionHandler {

	
	// 에러 가져가는 핸들러
	@ExceptionHandler(value = Exception.class)
	public ResponseDTO<String> handleArgumentException(Exception e) {
		return new ResponseDTO<String>(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
	}
}
