package com.toyou.project.dao.loginmain.keyword;




import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;


import com.toyou.project.model.keywordTiktok;

@Repository
public interface KeywordTiktokRepository extends JpaRepository<keywordTiktok, Integer>{
	
	// SELECT * FROM user WHERE user_id  = ?;
	// SELECT * FROM user WHERE userNo = ?;
//	@Query(value = "SELECT * FROM ")
	//Optional<keywordTiktok> findByUserId(String userId);
	

	
	
	
}
