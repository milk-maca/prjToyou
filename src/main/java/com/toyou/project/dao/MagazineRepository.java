package com.toyou.project.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.toyou.project.model.Magazine;

@Repository
public interface MagazineRepository extends JpaRepository<Magazine, Integer>{
	
	@Query(value = "SELECT mag FROM Magazine mag WHERE mag.magazineSc = :magazineSc")
	List<Magazine> findByMagazineScAll(@Param("magazineSc") String magazineSc);

}
