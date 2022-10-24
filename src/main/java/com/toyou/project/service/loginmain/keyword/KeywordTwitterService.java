package com.toyou.project.service.loginmain.keyword;

import java.util.List;

import com.toyou.project.model.keywordTwitter;

public interface KeywordTwitterService {
	public List<keywordTwitter> SelectAllKeywordTwitter();
	
	public List<keywordTwitter> SelectAllKeywordTwitterKind(String keywordTwitterKind);
	
}
