package com.toyou.project.dao.mypage;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.toyou.project.model.ChannelOwner;

@Repository
public interface MypageRepository extends JpaRepository<ChannelOwner, Integer>{
	@Query(value = "SELECT cha FROM ChannelOwner cha WHERE cha.userNo = :userNo")
	ChannelOwner findByChannelOwnerUserNoAll(@Param("userNo") int userNo);
	
	
}