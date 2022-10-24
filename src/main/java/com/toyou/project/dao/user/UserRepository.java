package com.toyou.project.dao.user;


import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.toyou.project.model.CategoryUser;
import com.toyou.project.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{
	
	Optional<User> findByUserId(String userId);

	@Query(value = "SELECT c FROM CategoryUser c WHERE c.userChannelCategory = :CategoryNum")
	List<CategoryUser> findByAll(String CategoryNum);
	
	@Query(value ="SELECT u FROM User u WHERE NOT u.userChannelLink is NULL ORDER BY u.userNo DESC")
	List<User> findByuserChannelLink();
	
	
}
