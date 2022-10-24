package com.toyou.project.service.loginmain.newjoin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import com.toyou.project.dao.user.UserRepository;
import com.toyou.project.model.User;

@Service
public class NewjoinServiceImpl implements NewjoinService{
	@Autowired
	private UserRepository userRepository;

	@Override
	public List<User> SelectAllUser(){
		List<User> UserList = userRepository.findByuserChannelLink();
		return UserList;	
	}
	
	

}
