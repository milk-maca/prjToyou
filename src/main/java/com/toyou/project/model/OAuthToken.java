package com.toyou.project.model;

import lombok.Data;

// kakao login 시 받아오는 정보를 담는 vo
@Data
public class OAuthToken {
	private String token_type;
	private String access_token;
	private int expires_in;
	private String refresh_token;
	private int refresh_token_expires_in;
	private String scope;
	
}
