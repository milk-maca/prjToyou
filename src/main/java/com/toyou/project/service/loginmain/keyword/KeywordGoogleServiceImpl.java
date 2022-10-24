package com.toyou.project.service.loginmain.keyword;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toyou.project.dao.loginmain.keyword.KeywordGoogleRepository;
import com.toyou.project.model.keywordGoogle;

@Service
public class KeywordGoogleServiceImpl implements KeywordGoogleService{

	@Autowired
	private KeywordGoogleRepository keywordGoogleRepository;
	
	@Transactional(readOnly=true)
	public List<keywordGoogle> SelectAllKeywordGoogle() {
		List<keywordGoogle> keywordGoogle = keywordGoogleRepository.findAll();
		return keywordGoogle;
	}
}
