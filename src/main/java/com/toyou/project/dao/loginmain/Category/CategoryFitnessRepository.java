package com.toyou.project.dao.loginmain.Category;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.toyou.project.model.CategoryFitness;

@Repository
public interface CategoryFitnessRepository extends JpaRepository<CategoryFitness, Integer>{
	
}
