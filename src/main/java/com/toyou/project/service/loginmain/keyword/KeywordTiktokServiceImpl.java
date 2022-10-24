package com.toyou.project.service.loginmain.keyword;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toyou.project.dao.loginmain.keyword.KeywordTiktokRepository;
import com.toyou.project.model.keywordTiktok;

@Service
public class KeywordTiktokServiceImpl implements KeywordTiktokService {

	@Autowired
	private KeywordTiktokRepository keywordTiktokRepository;
	
	@Transactional(readOnly=true)
	public List<keywordTiktok> SelectAllKeywordTiktok() {
		List<keywordTiktok> keywordTiktokList = keywordTiktokRepository.findAll();
		return keywordTiktokList;
	}
}
