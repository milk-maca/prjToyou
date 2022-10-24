package com.toyou.project.service.loginmain.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toyou.project.dao.loginmain.Category.CategoryAsmrRepository;
import com.toyou.project.model.CategoryAsmr;

@Service
public class CategoryAsmrServiceImpl implements CategoryAsmrService{
	@Autowired
	private CategoryAsmrRepository categoryAsmrRepository;

	@Transactional(readOnly=true)
	public List<CategoryAsmr> SelectAllCategoryAsmr() {
		List<CategoryAsmr> CategoryAsmrList = categoryAsmrRepository.findAll();
		return CategoryAsmrList;
	}

}
