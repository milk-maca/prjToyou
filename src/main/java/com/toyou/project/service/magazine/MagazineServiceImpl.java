package com.toyou.project.service.magazine;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toyou.project.dao.MagazineRepository;
import com.toyou.project.model.Magazine;

@Service
public class MagazineServiceImpl implements MagazineService {
	
	@Autowired
	private MagazineRepository magazineRepository;
	
	public List<Magazine> SelectMagazineListBySc(String magazineSc){
		return magazineRepository.findByMagazineScAll(magazineSc);
	}
}
