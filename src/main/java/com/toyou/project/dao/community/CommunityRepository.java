package com.toyou.project.dao.community;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.toyou.project.model.Community;

@Repository
public interface CommunityRepository extends JpaRepository<Community, Integer>{
	
	@Query(value = "SELECT com FROM Community com WHERE com.communityTitle = :communityTitle")
	List<Community> findByCommunityTitleAll(@Param("communityTitle") String communityTitle);
	
	@Query(value = "SELECT com FROM Community com WHERE com.communityHostno = :communityHostno")
	List<Community> findByCommunityHostNoAll(@Param("communityHostno") int communityHostno);

	
	



	
}
