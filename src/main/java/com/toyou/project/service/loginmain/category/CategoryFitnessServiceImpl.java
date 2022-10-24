package com.toyou.project.service.loginmain.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toyou.project.dao.loginmain.Category.CategoryFitnessRepository;
import com.toyou.project.model.CategoryFitness;

@Service
public class CategoryFitnessServiceImpl implements CategoryFitnessService{
	@Autowired
	private CategoryFitnessRepository categoryFitnessRepository;
	
	@Override
	@Transactional(readOnly=true)
	public List<CategoryFitness> SelectAllCategoryFitness() {
		List<CategoryFitness> CategoryfitnessList = categoryFitnessRepository.findAll();
		return CategoryfitnessList;
	}

}
