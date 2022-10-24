package com.toyou.project.service.loginmain.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toyou.project.dao.loginmain.Category.CategoryGameRepository;
import com.toyou.project.model.CategoryGame;

@Service
public class CategoryGameServiceImpl implements CategoryGameService {
	@Autowired
	private CategoryGameRepository categoryGameRepository;
	@Override
	@Transactional(readOnly=true)
	public List<CategoryGame> SelectAllCategoryGame() {
		List<CategoryGame> categorygame = categoryGameRepository.findAll();
		return categorygame;
	}
	

}
