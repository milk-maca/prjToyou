package com.toyou.project.service.community;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.toyou.project.dto.CountDTO;
import com.toyou.project.model.Community;
import com.toyou.project.model.CommunityUserInfo;

public interface CommunityService {
	public List<Community> SelectAllCommunitybyCommunityTitle(String communityTitle);

	public List<Community> SelectAllCommunitybyCommunityHostno(int communityHostno);
	
	public void communityJoin(Community community);
	
	public Page<Community> cmTotlaList(Pageable pageable);
	
	public int countByUserInfo(int communityNo);
	
	public List<CountDTO> findByCountCommunityUserInfo();

	public Community findById(int communityNo);
	
	public List<CountDTO> findByCountCommunityBoard();
	
	public void modifyCommuity(int communityNo, Community temp);
	
	public void deleteCommunity(int communityNo);
	
	public void signUpCm(int userNo, int communityNo);
	
	public CommunityUserInfo findByUserInfoAndCommunityNo(int userNo,int communityNo);
	
	public List<CommunityUserInfo> findByCommunityNo(int communityNo);
	
	public void modifyCmUserInfo(int communityNo,int userNo,CommunityUserInfo tmp);
	
	public void deleteCmUserInfo(int communityNo,int userNo);
	
//	public CommunityUserInfo findByUserInfo(int userNo);
	
	public List<CommunityUserInfo> findByUserInfoAll(int userNo);
}
