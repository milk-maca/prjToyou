package com.toyou.project.service.loginmain.keyword;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toyou.project.dao.loginmain.keyword.KeywordTwitterRepository;
import com.toyou.project.model.keywordTwitter;

@Service
public class KeywordTwitterServiceImpl implements KeywordTwitterService {

	@Autowired
	private KeywordTwitterRepository keywordTwitterRepository;
	
	@Transactional(readOnly=true)
	public List<keywordTwitter> SelectAllKeywordTwitter(){
		List<keywordTwitter> keywordTwitterList = keywordTwitterRepository.findAll();
		return keywordTwitterList;
		
	}
	
	
	@Transactional(readOnly=true)
	public List<keywordTwitter> SelectAllKeywordTwitterKind(String keywordTwitterKind){
		List<keywordTwitter> keywordTwitterList = keywordTwitterRepository.findBykeywordTwitterKindAll(keywordTwitterKind);
		return keywordTwitterList;
	}
	
	
}
