package com.toyou.project.service.loginmain.keyword;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toyou.project.dao.loginmain.keyword.KeywordTwitchRepository;
import com.toyou.project.model.keywordTwitch;

@Service
public class KeywordTwitchServiceImpl implements KeywordTwitchService {

	@Autowired
	private KeywordTwitchRepository keywordTwitchRepository;
	
	@Transactional(readOnly=true)
	public List<keywordTwitch> SelectAllKeywordTwitch(){
		List<keywordTwitch> keywordTwitchList = keywordTwitchRepository.findAll();
		return keywordTwitchList;
	}
}
