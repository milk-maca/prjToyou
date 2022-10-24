package com.toyou.project.service.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toyou.project.dao.community.CommunityBoardReplyRepository;
import com.toyou.project.dao.community.CommunityBoardRepository;
import com.toyou.project.model.CommunityBoard;
import com.toyou.project.model.CommunityBoardReply;


@Service
public class CommunityBoardServiceImpl implements CommunityBoardService{
	
	@Autowired
	private CommunityBoardRepository boardRepository;
	

	@Autowired
	private CommunityBoardReplyRepository boardReplyRepository;
	



	//***********************************************************************************************************
	// 게시판 리스트 조회 (페이징)
	@Override
	public Page<CommunityBoard> findByCmNo(int communityNo, Pageable pageable) {
		Page<CommunityBoard> boards = boardRepository.findAllByCommunityNo(communityNo,pageable);
		return boards;
	}
	
	// 게시판 단일 조회
	@Override
	public CommunityBoard findById(int boardNo) {

		CommunityBoard board = boardRepository.findById(boardNo).orElseGet(()->{
			return new CommunityBoard();
		});
		return board;
	}
	// 게시판 리스트 end
	//**********************************************************************************************************
	// 게시판 조회수 업데이트 
	@Override
	@Transactional
	public void updateByboardViewCnt(int boardNo) {
		boardRepository.updateByboardViewCnt(boardNo);
	}
	// 게시판 작성
	public void boardWrite(CommunityBoard board) {
		boardRepository.save(board);
	}
	// 게시판 글 수정
	@Override
	@Transactional
	public void modifyBoard(int communityBoardNo, CommunityBoard temp) {
		CommunityBoard board = boardRepository.findById(communityBoardNo).orElseThrow(()->{
			return new IllegalArgumentException("글 찾기 실패 : 게시글을 찾을 수 없습니다.");
		}); // 영속화 완료
		board.setCommunityBoardTitle(temp.getCommunityBoardTitle());
		board.setCommunityBoardContent(temp.getCommunityBoardContent());
		board.setCommunityBoardImgname(temp.getCommunityBoardImgname());
		board.setCommunityBoardIspublic(temp.getCommunityBoardIspublic());
	}
	// 게시판 글 삭제
	@Override
	@Transactional
	public void boardDelete(int communityBoardNo) {
		CommunityBoard board = boardRepository.findById(communityBoardNo).orElseThrow(()->{
			return new IllegalArgumentException("글 찾기 실패 : 게시글을 찾을 수 없습니다.");
		});
		if(board!=null) {
			boardReplyRepository.deleteByCommunityBoardNo(board.getCommunityBoardNo());
		}
		boardRepository.delete(board);
	}
	// 커뮤니티 안의 게시판 전체 삭제
	@Transactional
	public void boardDeleteAll(int communityNo) {
		List<CommunityBoard> boards = boardRepository.findAllByCommunityNo(communityNo);
		boardRepository.deleteAll(boards);
	}
	//==============================================================================================
	//게시판 서비스 시작
	// 게시판 댓글 등록
	@Transactional
	public void boardReplyWrite(CommunityBoardReply boardReply) {
		boardReplyRepository.save(boardReply);
	}
	
	// 게시판 전체 댓글 리스트 출력
	@Override
	public Page<CommunityBoardReply> findReplyAll(int communityBoardNo,Pageable pageable) {
		Page<CommunityBoardReply> boardReplyPage =  boardReplyRepository.findAllByCommunityBoardNo(communityBoardNo,pageable);
		
		return boardReplyPage;
	};
	
	// 게시판 댓글 수정
	@Transactional
	public void replyModify(int communityBoardReplyNo, CommunityBoardReply temp) {
		CommunityBoardReply reply = boardReplyRepository.findById(communityBoardReplyNo).orElseThrow(()->{
			return new IllegalArgumentException("댓글 찾기 실패 : 댓글을 찾을 수 없습니다.");
		});
		reply.setCommunityBoardReplyContent(temp.getCommunityBoardReplyContent());
	}
	
	// 게시판 댓글 삭제
	@Transactional
	public void deleteModify(int communityBoardReplyNo) {
		CommunityBoardReply reply = boardReplyRepository.findById(communityBoardReplyNo).orElseThrow(()->{
			return new IllegalArgumentException("댓글 찾기 실패 : 댓글을 찾을 수 없습니다.");
		});
		boardReplyRepository.delete(reply);
	}
	
	
	
	
	
	
}
