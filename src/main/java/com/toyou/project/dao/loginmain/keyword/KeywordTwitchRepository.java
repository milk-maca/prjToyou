package com.toyou.project.dao.loginmain.keyword;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.toyou.project.model.keywordTwitch;

@Repository
public interface KeywordTwitchRepository extends JpaRepository<keywordTwitch, Integer> {

}
