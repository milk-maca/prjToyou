package com.toyou.project.dao.community;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.toyou.project.model.CommunityBoard;
import com.toyou.project.model.CommunityBoardReply;

public interface CommunityBoardReplyRepository extends JpaRepository<CommunityBoardReply, Integer>{

// 	게시판 페이징 처리 된 전체 댓글 리스트
	@Query(value="SELECT boardReply FROM CommunityBoardReply boardReply WHERE boardReply.communityBoardNo = :communityBoardNo")
	public Page<CommunityBoardReply> findAllByCommunityBoardNo(@Param("communityBoardNo") int communityBoardNo,Pageable pageable);
//	게시글번호로 게시글 리스트 조회
	@Query(value="SELECT boardReply FROM CommunityBoardReply boardReply WHERE boardReply.communityBoardNo = :communityBoardNo")
	public List<CommunityBoardReply> findAllByCommunityBoardNo(@Param("communityBoardNo") int communityBoardNo);
	
	
	
	
// 	커뮤니티 안의 게시판 전체 삭제 == 커뮤니티 삭제시 커뮤니티 내 전체 게시글 삭제
	@Modifying
	@Query(value = "DELETE FROM CommunityBoardReply boardReply WHERE boardReply.communityBoardNo = :communityBoardNo")
	public void deleteByCommunityBoardNo(@Param("communityBoardNo") int communityBoardNo);
}
