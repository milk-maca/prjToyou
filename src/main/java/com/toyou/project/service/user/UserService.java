package com.toyou.project.service.user;

import java.util.List;

import com.toyou.project.model.CategoryUser;
import com.toyou.project.model.User;

public interface UserService {
	
	
	public void userJoin(User user);
	

	public User userFind(String username);
	
	public User userfindById(int id);
	
	List<CategoryUser> userFindCategory(String CategoryNum);
}
