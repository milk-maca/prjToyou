package com.toyou.project.service.loginmain.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toyou.project.dao.loginmain.Category.CategoryCarRepository;
import com.toyou.project.model.CategoryCar;

@Service
public class CategoryCarServiceImpl implements CategoryCarService{
	
	@Autowired
	private CategoryCarRepository categoryCarRepository;
	
	@Override
	@Transactional(readOnly=true)
	public List<CategoryCar> SelectAllCategoryCar() {
			List<CategoryCar> CategoryCarList = categoryCarRepository.findAll();
			return CategoryCarList;
	}


}
