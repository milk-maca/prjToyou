package com.toyou.project.service.loginmain.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toyou.project.dao.loginmain.Category.CategoryMukbangRepository;
import com.toyou.project.model.CategoryMukbang;

@Service
public class CategoryMukbangServiceImpl implements CategoryMukbangService{
	@Autowired
	private CategoryMukbangRepository categoryMukbangRepository;
	@Override
	@Transactional(readOnly=true)
	public List<CategoryMukbang> SelectAllCategoryMukbang() {
		List<CategoryMukbang> categorymukbang = categoryMukbangRepository.findAll();
		return categorymukbang;
	}

}
