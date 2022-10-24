package com.toyou.project.service.user;

import java.util.List;

//import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toyou.project.dao.user.UserRepository;
import com.toyou.project.model.CategoryUser;
import com.toyou.project.model.User;

@Service
public class UserServiceImpl implements UserService {


	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	private UserRepository userRepository;
	
	
	public User userfindById(int id) {
//		System.out.println("userfindById로 조회할번호 :" + id);
		User user = userRepository.findById(id).orElseGet(()->{
			return new User();
		});
//		System.out.println("조회된 회원 정보 :" + user.getUserNo());
		return user;
	}
	
	
	// 회원가입
	@Transactional
	public void userJoin(User user) {
//		회원가입시 패스워드를 인코딩 하지 않으면 시큐리티 로그인을 이용할 수 없다.
		String rawPassword = user.getUserPassword();
		String encPassword = encoder.encode(rawPassword);
		user.setUserPassword(encPassword);
		userRepository.save(user);
	}
	
	// 회원 찾기
	@Transactional(readOnly=true)
	public User userFind(String userId) {
		User user = userRepository.findByUserId(userId).orElseGet(()->{
			return new User();
		});
		System.out.println("userService - userFind : "+user.getUserId());
		return user;
	}

	@Override
	public List<CategoryUser> userFindCategory(String CategoryNum) {
		List<CategoryUser> CategoryList = userRepository.findByAll(CategoryNum);
		return CategoryList;
	}
	
	
	
}