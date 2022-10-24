package com.toyou.project.controller.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.toyou.project.dto.ResponseDTO;
import com.toyou.project.model.Community;
import com.toyou.project.model.CommunityBoard;
import com.toyou.project.model.CommunityBoardReply;
import com.toyou.project.model.CommunityUserInfo;
import com.toyou.project.model.User;
import com.toyou.project.service.community.CommunityBoardService;
import com.toyou.project.service.community.CommunityService;
import com.toyou.project.service.mypage.MypageService;
import com.toyou.project.service.user.UserService;

@RestController
public class CommunityApiController {
	
	@Autowired
	private CommunityBoardService boardService;
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MypageService myPageService;
	
	
	// 게시판 글 등록
	@PostMapping("/community/boardWrite")
	public ResponseDTO<Integer> boardWrite(@RequestBody CommunityBoard board) { // username, password, email
		boardService.boardWrite(board);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1); // 자바오브젝트를 JSON으로 변환해서 리턴 (Jackson)
	}
	
	// 게시판 수정
	@PutMapping("/community/boardModify/{communityBoardNo}")
	public ResponseDTO<Integer> modifyBoard(@PathVariable int communityBoardNo, @RequestBody CommunityBoard temp){
		
		boardService.modifyBoard(communityBoardNo,temp);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	
	// 게시판 삭제
	@DeleteMapping("/community/boardDelete/{communityBoardNo}")
	public ResponseDTO<Integer> boardDelete(@PathVariable int communityBoardNo){
		boardService.boardDelete(communityBoardNo);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	
	
	// 커뮤니티 수정
	@PutMapping("/community/modifyCommuity/{communityNo}")
	public ResponseDTO<Integer> modifyCommuity(@PathVariable int communityNo, @RequestBody Community temp){
//			System.out.println("넘버 확인"+communityNo);
		communityService.modifyCommuity(communityNo,temp);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	
	// 커뮤니티 삭제
	@DeleteMapping("/community/deleteCommunity/{communityNo}")
	public ResponseDTO<Integer> deleteCommunity(@PathVariable int communityNo){
		communityService.deleteCommunity(communityNo);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	
	// 커뮤니티 가입 신청
	@PostMapping("/community/signUpCm")
	public String signUpCm(User user,Community community){
		int userNo = user.getUserNo();
		System.out.println("유저넘버 확인 : "+userNo);
		int communityNo = community.getCommunityNo();
		System.out.println(communityNo);
		CommunityUserInfo userInfo = communityService.findByUserInfoAndCommunityNo(userNo,communityNo);
		
		int result = 0;
		System.out.println("가입 날짜 :" +userInfo.getCommunityUserinfoJoindate() );
		if(userInfo.getCommunityUserinfoJoindate() == null) {
			System.out.println("가입진행");
			communityService.signUpCm(userNo,communityNo);
			result = 1;
		}
		return Integer.toString(result);
	}
	
	
	//커뮤니티 회원 정보 수정
	@PutMapping("/community/cmUserInfoModify/{communityNo}/{userNo}")
	public ResponseDTO<Integer> modifyCmUserInfo(@PathVariable int communityNo,@PathVariable int userNo,@RequestBody CommunityUserInfo tmp){
		communityService.modifyCmUserInfo(communityNo,userNo,tmp);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	//커뮤니티 회원  삭제
	@DeleteMapping("/community/cmUserInfoDelete/{communityNo}/{userNo}")
	public ResponseDTO<Integer> deleteCmUserInfo(@PathVariable int communityNo,@PathVariable int userNo){
		communityService.deleteCmUserInfo(communityNo,userNo);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	

	// 게시판 댓글 작성
	@PostMapping("/community/boardReplyWrite")
	public ResponseDTO<Integer> boardReplyWrite(@RequestBody CommunityBoardReply boardReply) {
		boardService.boardReplyWrite(boardReply);
		
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
		
	
	// 게시판 댓글 수정
	@PutMapping("/community/replyModify/{communityBoardReplyNo}")
	public ResponseDTO<Integer> replyModify(@PathVariable int communityBoardReplyNo, @RequestBody CommunityBoardReply temp){
		boardService.replyModify(communityBoardReplyNo,temp);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	
	// 게시판 댓글 삭제
	@DeleteMapping("/community/deleteModify/{communityBoardReplyNo}")
	public ResponseDTO<Integer> deleteModify(@PathVariable int communityBoardReplyNo){
		boardService.deleteModify(communityBoardReplyNo);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}

	
	
	
	
}

