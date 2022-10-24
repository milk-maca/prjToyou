package com.toyou.project.controller.community;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.toyou.project.dto.CountDTO;
import com.toyou.project.model.ChannelOwner;
import com.toyou.project.model.Community;
import com.toyou.project.model.CommunityBoard;
import com.toyou.project.model.CommunityBoardReply;
import com.toyou.project.model.CommunityUserInfo;
import com.toyou.project.model.User;
import com.toyou.project.service.community.CommunityBoardService;
import com.toyou.project.service.community.CommunityService;
import com.toyou.project.service.mypage.MypageService;
import com.toyou.project.service.user.UserService;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;
	@Autowired
	private CommunityBoardService boardService;
	@Autowired
	private UserService userService;
	@Autowired
	private MypageService myPageService;
	
	
//	커뮤니티 수정폼 이동
	@RequestMapping("/community/cmModifyForm")
	public String cmModifyForm(HttpServletRequest request, Model model) {
		String communityNo = request.getParameter("communityNo");
		Community community = communityService.findById(Integer.parseInt(communityNo));
		User user = userService.userfindById(community.getCommunityHostno());
		ChannelOwner channelInfo = myPageService.findMyChannel(user.getUserNo());
		model.addAttribute("channelInfo", channelInfo);
		model.addAttribute("community", community);
//		
		return "community/cmModifyForm";
	}
	
	
	
	
//	게시글 작성폼 이동
	@GetMapping("/community/cmBoardWriteForm")
	public String communityForm(HttpServletRequest request, Model model) {
		String communityNo = request.getParameter("communityNo");
		Community community = communityService.findById(Integer.parseInt(communityNo));
		User user = userService.userfindById(community.getCommunityHostno());
		ChannelOwner channelInfo = myPageService.findMyChannel(user.getUserNo());
		model.addAttribute("channelInfo", channelInfo);
		model.addAttribute("communityNo", communityNo);
//		
		return "community/cmBoardWriteForm";
		
	}
	
//	게시글 수정폼 이동
	@GetMapping("/community/boardModifyForm")
	public String boardModifyForm(HttpServletRequest request, Model model) {
		String boardNo = request.getParameter("communityBoardNo");
		CommunityBoard board = boardService.findById(Integer.parseInt(boardNo));
		Community community = communityService.findById(board.getCommunityNo());
		User user = userService.userfindById(community.getCommunityHostno());
		ChannelOwner channelInfo = myPageService.findMyChannel(user.getUserNo());
		
		model.addAttribute("channelInfo",channelInfo);
		model.addAttribute("board", board);
		model.addAttribute("community", community);
		
		return "community/boardModifyForm";
	}
	
	
	
//  커뮤니티 상세보기 페이지 이동	
	@RequestMapping("/auth/community/community")
	public String community(HttpServletRequest request, Model model,
							@PageableDefault(size = 10, sort = "communityBoardNo", direction = Sort.Direction.DESC) Pageable pageable){
		// ==================================================================================
		// 커뮤니티 호스트 정보 
		String communityNoSt = request.getParameter("communityNo"); 
		int communityNo = Integer.parseInt(communityNoSt); 
		int JoinCnt = communityService.countByUserInfo(communityNo); // 채널 가입자 카운트
		Community community = communityService.findById(communityNo); // 커뮤니티 정보 조회
		// 커뮤니티 회원정보 리스트
		List<CommunityUserInfo> userInfoList = communityService.findByCommunityNo(communityNo); // 가입자 리스트 출력 
		System.out.println(userInfoList.size());
		ChannelOwner channelInfo = myPageService.findMyChannel(community.getCommunityHostno());
		ArrayList<ChannelOwner> joinChannels = new ArrayList<ChannelOwner>();
		for(CommunityUserInfo userInfo : userInfoList) {
			if(myPageService.findMyChannel(userInfo.getUserNo())!=null){
				ChannelOwner joinChannel = myPageService.findMyChannel(userInfo.getUserNo());
				if(joinChannel != null) {
					joinChannels.add(joinChannel);
				}
			}
		}
		System.out.println("가입채널 수 :" +joinChannels.size());
		model.addAttribute("joinChannels", joinChannels);
		model.addAttribute("channelInfo", channelInfo);
		model.addAttribute("userInfoList", userInfoList);
		model.addAttribute("community", community);
		model.addAttribute("JoinCnt", JoinCnt);
		//====================================================================================
		// 커뮤니티 게시판 정보
		Page<CommunityBoard> boardsP = boardService.findByCmNo(communityNo,pageable);
//		System.out.println("게시글 가져오는지 확인 : "+boardsP.getContent().get(0).getCommunityBoardContent());
		List<CommunityBoard> boards = boardsP.getContent();
//		System.out.println("보드 사이즈 확인"+boards.size());
		List<User> boardWriter = new ArrayList<User>();
		for(int i = 0; i<boards.size();i++ ) {
//			System.out.println("게시글 내용 반복문 출력 : "+boards.get(i).getCommunityBoardContent());
			if(boards.get(i).getCommunityBoardContent() != null) {
				if(boards.get(i).getUserNo()!=0) {
					int userNo = boards.get(i).getUserNo();
//					System.out.println("게시글 작성한 유저 번호 : "+userNo);
					User userB = userService.userfindById(userNo);
					boardWriter.add(userB);
//					System.out.println(userB.getUserId());
				}
			}	
		}
		model.addAttribute("boards", boards);
		model.addAttribute("boardWriter", boardWriter);
		return "/community/community";
	}

	
//	커뮤니티 종합 페이지 이동
	@RequestMapping("/auth/communityTotal")
	public String cmTotalList(Model model,@PageableDefault(size = 4, sort = "communityNo", direction = Sort.Direction.DESC) Pageable pageable) {		

		// **************************************************************************************************
		// big 커뮤니티 리스트
		List<String> bigcommunityNo = new ArrayList<String>();
		List<String> bigcmTitle = new ArrayList<String>();
		List<String> bigchannelName = new ArrayList<String>();
		List<String> bigchannelImg = new ArrayList<String>();
		List<String> bigcmDescription = new ArrayList<String>();
		List<String> biguserJoinCnt = new ArrayList<String>();
		List<CountDTO> cntUserInfo = communityService.findByCountCommunityUserInfo();
		if(cntUserInfo.size() > 0 && cntUserInfo.size() < 4) {
//			System.out.println("전체 커뮤니티 리스트 받아옴 : " + cmTotalList.getSize());
			// 설명 ,채널명, 채널이미지, 가입자 수 
			for(int i=0; i<cntUserInfo.size(); i++) {
				System.out.println("big커뮤니티 리스트 조회 시작");
				bigcommunityNo.add(Integer.toString(cntUserInfo.get(i).getCommunityNo()));
				biguserJoinCnt.add(Integer.toString(cntUserInfo.get(i).getCnt()));
				Community community = communityService.findById(cntUserInfo.get(i).getCommunityNo());
				bigcmTitle.add(community.getCommunityTitle());
				bigcmDescription.add(community.getCommunityDescription());
				User user = userService.userfindById(community.getCommunityHostno());
				bigchannelName.add(user.getUserChannelName());
//				System.out.println("4 :"+user.getUserChannelName());
				bigchannelImg.add(user.getUserChannelImg());
			}
			// 총 페이지수
			model.addAttribute("bigcommunityNo", bigcommunityNo);
			model.addAttribute("bigchannelName", bigchannelName);
			model.addAttribute("bigchannelImg", bigchannelImg);
			model.addAttribute("bigcmTitle", bigcmTitle);
			model.addAttribute("bigcmDescription", bigcmDescription);
			model.addAttribute("biguserJoinCnt", biguserJoinCnt);
			
		}else if(cntUserInfo.size() > 4) {
			for(int i=0; i<4; i++) {
				System.out.println("big커뮤니티 리스트 조회 시작");
				bigcommunityNo.add(Integer.toString(cntUserInfo.get(i).getCommunityNo()));
				biguserJoinCnt.add(Integer.toString(cntUserInfo.get(i).getCnt()));
				Community community = communityService.findById(cntUserInfo.get(i).getCommunityNo());
				bigcmTitle.add(community.getCommunityTitle());
				bigcmDescription.add(community.getCommunityDescription());
				User user = userService.userfindById(community.getCommunityHostno());
				bigchannelName.add(user.getUserChannelName());
//				System.out.println("4 :"+user.getUserChannelName());
				bigchannelImg.add(user.getUserChannelImg());
			}
			// 총 페이지수
			model.addAttribute("bigcommunityNo", bigcommunityNo);
			model.addAttribute("bigchannelName", bigchannelName);
			model.addAttribute("bigchannelImg", bigchannelImg);
			model.addAttribute("bigcmTitle", bigcmTitle);
			model.addAttribute("bigcmDescription", bigcmDescription);
			model.addAttribute("biguserJoinCnt", biguserJoinCnt);
		}
		// **************************************************************************************************
		// hot 커뮤니티 리스트
		List<String> hotcommunityNo = new ArrayList<String>();
		List<String> hotcmTitle = new ArrayList<String>();
		List<String> hotchannelName = new ArrayList<String>();
		List<String> hotchannelImg = new ArrayList<String>();
		List<String> hotcmDescription = new ArrayList<String>();
		List<String> hotuserJoinCnt = new ArrayList<String>();
		// 게시판 cmNo별 카운트+리스트
		List<CountDTO> cntBoard = communityService.findByCountCommunityBoard();
		if(cntBoard.size() > 0) {
			System.out.println("핫커뮤니티 리스트 조회 시작");
			// 설명 ,채널명, 채널이미지, 가입자 수 
			for(int i=0; i<cntBoard.size(); i++) {
				hotcommunityNo.add(Integer.toString(cntBoard.get(i).getCommunityNo()));
//				hotuserJoinCnt.add(Integer.toString(cntBoard.get(i).getCnt()));
				Community community = communityService.findById(cntBoard.get(i).getCommunityNo());
				int joinCnt = communityService.countByUserInfo(community.getCommunityNo());
				hotuserJoinCnt.add(Integer.toString(joinCnt));
				hotcmTitle.add(community.getCommunityTitle());
				hotcmDescription.add(community.getCommunityDescription());
				User user = userService.userfindById(community.getCommunityHostno());
				hotchannelName.add(user.getUserChannelName());
				hotchannelImg.add(user.getUserChannelImg());
			}
			// 총 페이지수
			model.addAttribute("hotcommunityNo", hotcommunityNo);
			model.addAttribute("hotchannelName", hotchannelName);
			model.addAttribute("hotchannelImg", hotchannelImg);
			model.addAttribute("hotcmTitle", hotcmTitle);
			model.addAttribute("hotcmDescription", hotcmDescription);
			model.addAttribute("hotuserJoinCnt", hotuserJoinCnt);
			
		}else if(cntBoard.size() <= 4) {
			for(int i=0; i<cntBoard.size(); i++) {
				hotcommunityNo.add(Integer.toString(cntBoard.get(i).getCommunityNo()));
				hotuserJoinCnt.add(Integer.toString(cntBoard.get(i).getCnt()));
				Community community = communityService.findById(cntBoard.get(i).getCommunityNo());
				hotcmTitle.add(community.getCommunityTitle());
				hotcmDescription.add(community.getCommunityDescription());
				User user = userService.userfindById(community.getCommunityHostno());
				hotchannelName.add(user.getUserChannelName());
				hotchannelImg.add(user.getUserChannelImg());
			}
			// 총 페이지수
			model.addAttribute("hotcommunityNo", hotcommunityNo);
			model.addAttribute("hotchannelName", hotchannelName);
			model.addAttribute("hotchannelImg", hotchannelImg);
			model.addAttribute("hotcmTitle", hotcmTitle);
			model.addAttribute("hotcmDescription", hotcmDescription);
			model.addAttribute("hotuserJoinCnt", hotuserJoinCnt);
		}
		
		
		
		// **************************************************************************************************
		// 전체 커뮤니티 리스트 
			List<String> communityNo = new ArrayList<String>();
			List<String> cmTitle = new ArrayList<String>();
			List<String> channelName = new ArrayList<String>();
			List<String> channelImg = new ArrayList<String>();
			List<String> cmDescription = new ArrayList<String>();
			List<String> userJoinCnt = new ArrayList<String>();
			Page<Community> cmTotalList = communityService.cmTotlaList(pageable);
			List<Community> community = cmTotalList.getContent();
			if(community.size() > 0) {
				System.out.println("new 커뮤니티 리스트 조회 시작");
				// 설명 ,채널명, 채널이미지, 가입자 수 
				for(int i=0; i<community.size(); i++) {
					Community tmpCm = community.get(i);
					communityNo.add(Integer.toString(tmpCm.getCommunityNo()));
					cmDescription.add(tmpCm.getCommunityDescription());
					cmTitle.add(tmpCm.getCommunityTitle());
					User user = userService.userfindById(tmpCm.getCommunityHostno());
					channelName.add(user.getUserChannelName());
					channelImg.add(user.getUserChannelImg());
					int cmUserInfo = communityService.countByUserInfo(tmpCm.getCommunityNo());
					if(cmUserInfo==0) {
						userJoinCnt.add("0");
					}else {
						userJoinCnt.add(Integer.toString(cmUserInfo));
					}
				}
				// 총 페이지수
				model.addAttribute("communityNo", communityNo);
				model.addAttribute("channelName", channelName);
				model.addAttribute("cmTitle", cmTitle);
				model.addAttribute("channelImg", channelImg);
				model.addAttribute("cmDescription", cmDescription);
				model.addAttribute("userJoinCnt", userJoinCnt);
				model.addAttribute("cmTotalList", cmTotalList);
			}
		return "communityTotal";
	}
	
	
	// 커뮤니티 게시판 상세보기
	@RequestMapping("/auth/community/boardView")
	public String boardView(HttpServletRequest request, Model model, @PageableDefault(size = 2, sort = "communityBoardNo", direction = Sort.Direction.DESC) Pageable pageable){
		// 게시판 리스트 가져오기
		String communityBoardNo = request.getParameter("communityBoardNo");
		String communityNo = request.getParameter("communityNo");
		List<CommunityUserInfo> userInfoList = communityService.findByCommunityNo(Integer.parseInt(communityNo));
		Community community = communityService.findById(Integer.parseInt(communityNo));
		CommunityBoard board =  boardService.findById(Integer.parseInt(communityBoardNo));
		boardService.updateByboardViewCnt(board.getCommunityBoardNo());
		User user = userService.userfindById(board.getUserNo());
		ChannelOwner channelInfo = myPageService.findMyChannel(user.getUserNo());
		
		model.addAttribute("userInfoList",userInfoList);
		model.addAttribute("channelInfo",channelInfo);
		model.addAttribute("community",community);
		model.addAttribute("board",board);
		model.addAttribute("user",user);

		// 댓글 리스트 가져오기
		Page<CommunityBoardReply> boardReplyPage = boardService.findReplyAll(Integer.parseInt(communityBoardNo),pageable);
		List<User> replyWriter = new ArrayList<User>();
		List<String> times = new ArrayList<String>();
		List<String> profiles = new ArrayList<String>();
		for(int i = 0; i<boardReplyPage.getContent().size();i++ ) {
			if(boardReplyPage.getContent().get(i).getCommunityBoardReplyContent()!=null) {
				if(boardReplyPage.getContent().get(i).getUserNo()!=0) {
					SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm", Locale.KOREA );
					String time = sdf.format(boardReplyPage.getContent().get(i).getCommunityBoardReplyWritedate());
					times.add(time);
					int userNo = boardReplyPage.getContent().get(i).getUserNo();
					User userB = userService.userfindById(userNo);
					replyWriter.add(userB);
					// 유저 프로필 가져오기
					if(myPageService.findMyChannel(userNo)!=null) {
						String profile = myPageService.findMyChannel(userNo).getChProfile();
						profiles.add(profile);
					}else {
						String profile = "https://i.imgur.com/hczKIze.jpg";
						profiles.add(profile);
					}
				}
			}
		}
		model.addAttribute("times", times);
		model.addAttribute("replyWriter", replyWriter);
		model.addAttribute("profiles", profiles);
		model.addAttribute("boardReplyPage", boardReplyPage);
		
		return "community/boardView";
	}

	// 커뮤니티 멤버 관리폼 이동
	@RequestMapping("/community/cmUserInfoModifyForm")
	public String cmUserInfoModifyForm(HttpServletRequest request, Model model) {
		int communityNo = Integer.parseInt(request.getParameter("communityNo"));
		Community community = communityService.findById(communityNo);
		User Hostuser = userService.userfindById(community.getCommunityHostno());
		ChannelOwner channelInfo = myPageService.findMyChannel(Hostuser.getUserNo());
		List<CommunityUserInfo> cmUserInfo = communityService.findByCommunityNo(communityNo);
		ArrayList<User> userList= new ArrayList<User>();
		for(CommunityUserInfo cmUserInfoTmp : cmUserInfo) {
			User user = userService.userfindById(cmUserInfoTmp.getUserNo());
			userList.add(user);
		}
		model.addAttribute("userList",userList);
		model.addAttribute("community",community);
		model.addAttribute("cmUserInfo",cmUserInfo);
		model.addAttribute("channelInfo",channelInfo);
		
		return "community/cmUserInfoModifyForm";
	}
	
}
