package com.toyou.project.dao.loginmain.keyword;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.toyou.project.model.keywordGoogle;

@Repository
public interface KeywordGoogleRepository extends JpaRepository<keywordGoogle, Integer>{

}
