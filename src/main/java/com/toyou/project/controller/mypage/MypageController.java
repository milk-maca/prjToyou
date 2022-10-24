package com.toyou.project.controller.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.toyou.project.dto.ResponseDTO;
import com.toyou.project.model.Community;
import com.toyou.project.model.User;
import com.toyou.project.service.community.CommunityService;
import com.toyou.project.service.mypage.MypageService;
import com.toyou.project.service.user.UserService;


@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@Autowired
	private UserService userService;
	

	@Autowired
	private CommunityService communityService;

	@GetMapping("/communityCreate")
	public String communityCreate() {
		return "mypageCommunityCreate";
	}

	// 커뮤니티 중복체크
	@RequestMapping(value = "/communityNameCheck",method = RequestMethod.POST)
	@ResponseBody
	public String communityNameCheck(String communityName) {
		System.out.println("중복확인 할 커뮤니티 :"+communityName);
		String result = "1"; 
		List<Community> communityList = communityService.SelectAllCommunitybyCommunityTitle(communityName);
		if(communityList.size() == 0) {
			result = "0";
		}
		System.out.println("커뮤니티 조회 결과 : "+communityList.size());
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value = "/createCommunity",method = RequestMethod.POST)
	@ResponseBody
	public ResponseDTO<Integer> createCommunity(@RequestBody Community community) {
		System.out.println("태그 검사 타이틀 : " +community.getCommunityTitle());
		System.out.println("태그 검사 : " +community.getCommunityTag());
		communityService.communityJoin(community);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}

	
	
 // 회원정보 수정
  @ResponseBody
  @PutMapping("/mypage/userUpdateProc")
  public ResponseDTO<Integer> userUpdate(@RequestBody User user){
  	
  	System.out.println(user.getUserId());
  	System.out.println("채널링크" + user.getUserChannelLink());
  	System.out.println("채널이름" + user.getUserChannelName());
  	System.out.println("롤모델링크" + user.getUserRolemodelLink());
  	System.out.println("셀렉트박스" + user.getUserChannelCategory());

  	System.out.println("마이페이지 유저아이디 확인 : "+ user.getUserNo());
  	mypageService.userUpdate(user);
//   트랜젝션 종료시점이기 때문에 DB값은 변경된 후
//   하지만 세션값 변경 X
//   세션정보도 다시 업데이트 해줘야함
//   세션 등록
     Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(user.getUserId(), user.getUserPassword()));
     SecurityContextHolder.getContext().setAuthentication(authentication);
     
     
   return new ResponseDTO<Integer>(HttpStatus.OK.value(),1);
  }

	

	
// 회원정보 탈퇴
 @ResponseBody
 @DeleteMapping("/mypage/deleteUser")
 public ResponseDTO<Integer> deleteUser(){
	 //세션값 가져오기
	 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	 //회원정보+커뮤니티삭제삭제
	 if(principal!=null) {
	    UserDetails userD = (UserDetails)principal;
	    String userId = userD.getUsername();
	         
	    User user = userService.userFind(userId);

	    List<Community> communitys = communityService.SelectAllCommunitybyCommunityHostno(user.getUserNo());
	    for(int i=0; i<communitys.size(); i++) {
	       communityService.deleteCommunity(communitys.get(i).getCommunityNo());
	    }
	         
     mypageService.deleteUser(user);          
     }
	return new ResponseDTO<Integer>(HttpStatus.OK.value(),1);
   }
	   
	   
}
