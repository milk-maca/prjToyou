package com.toyou.project.service.community;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.toyou.project.model.Community;
import com.toyou.project.model.CommunityBoard;
import com.toyou.project.model.CommunityBoardReply;

public interface CommunityBoardService {

	public void boardWrite(CommunityBoard board);
	
	public void modifyBoard(int communityBoardNo,CommunityBoard temp);

	public void boardDelete(int communityBoardNo);
	
	public Page<CommunityBoard> findByCmNo(int communityNo,Pageable pageable);
	
	public CommunityBoard findById(int boardNo);
	
	public void updateByboardViewCnt(int boardNo);
	
	public void boardDeleteAll(int communityNo);
	
	public void boardReplyWrite(CommunityBoardReply boardReply);
	
	public Page<CommunityBoardReply> findReplyAll(int communityBoardNo,Pageable pageable);
	
	public void replyModify(int communityBoardReplyNo, CommunityBoardReply temp);
	
	public void deleteModify(int communityBoardReplyNo);
	
	
	
	
}



