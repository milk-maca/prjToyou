package com.toyou.project.config.auth;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.toyou.project.model.User;

import lombok.Getter;


// spring security가 로그인 요청을 가로채서 로그인을 진행하고 완료가 되면
// UserDetails 타입의 오브젝트를 security의 고유한 세션저장소에 저장을 해준다.
@Getter
public class PrincipalDetail implements UserDetails{
	
	private User user; // 컴포지션(객체를 품고 있는 것 / 상속과 다름)
	
	public PrincipalDetail(User user) {
		this.user=user;
	}

	@Override
	public String getPassword() {
		
		return user.getUserPassword();
	}

	@Override
	public String getUsername() {
		return user.getUserId();
	}

	// 계정이 만료되지 않았는지 리턴한다( true : 만료 안됨)
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	// 비밀번호가 만료되지 않았는지 리턴 
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	// 계정 활성화가 되어 있는지 리턴
	@Override
	public boolean isEnabled() {
		return true;
	}
	
	// 계정의 권한 리턴
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collectors = new ArrayList<>();
		collectors.add(()->{ return "ROLE_"+user.getUserRole();});
		return collectors;
	}
	
	
	
}
