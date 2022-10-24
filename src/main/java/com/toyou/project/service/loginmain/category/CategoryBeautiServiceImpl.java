package com.toyou.project.service.loginmain.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toyou.project.dao.loginmain.Category.CategoryBeautiRepository;
import com.toyou.project.model.CategoryBeauti;

@Service
public class CategoryBeautiServiceImpl implements CategoryBeautiService{
	@Autowired
	private CategoryBeautiRepository categoryBeautiRepository;

	@Override
	@Transactional(readOnly=true)
	public List<CategoryBeauti> SelectAllCategoryBeauti() {
		List<CategoryBeauti> CategorybeautiList = categoryBeautiRepository.findAll();
		return CategorybeautiList;
	}

}
