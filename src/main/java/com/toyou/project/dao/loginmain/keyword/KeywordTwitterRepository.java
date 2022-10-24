package com.toyou.project.dao.loginmain.keyword;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.toyou.project.model.User;
import com.toyou.project.model.keywordTwitter;

@Repository
public interface KeywordTwitterRepository extends JpaRepository<keywordTwitter, Integer>{

	// SELECT * FROM user WHERE user_id  = ?;
	// SELECT * FROM user WHERE userNo = ?;
	@Query(value = "SELECT key FROM keywordTwitter key WHERE key.keywordTwitterKind = :keywordTwitterKind")
	List<keywordTwitter> findBykeywordTwitterKindAll(@Param("keywordTwitterKind") String keywordTwitterKind);
	
	
	
}
