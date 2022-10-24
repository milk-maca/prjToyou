package com.toyou.project.controller.administrator;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.toyou.project.model.AdminReportLog;
import com.toyou.project.model.Community;
import com.toyou.project.model.CommunityBoard;
import com.toyou.project.model.ProductBuyLog;
import com.toyou.project.model.User;
import com.toyou.project.service.admin.AdminService;

@Controller
public class AdminController {


	@Autowired
	private AdminService adminService;
	
	
	//-----------------------------------------
	// 관리자 메인페이지 시작
	@GetMapping("/admin_index")
	public String admin_index(Model model) {
		
	    List<ProductBuyLog> productBuyLogList = adminService.SelectAllProductBuyLogList();
	    List<Community> communityList = adminService.SelectAllCommunityList();
	    List<CommunityBoard> communityBoardList = adminService.SelectAllCommunityBoardList();
	    List<User> userList = adminService.SelectAllUserList();

	    // 오늘 날짜 가져오기
	    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    String dayday = dateFormat.format(new Date());
	    model.addAttribute("dayday", dayday);
	    System.out.println("*" + dayday);

 
	    //-----------------------------------------
	    // 오늘 구독 결제 수 시작
	    // 오늘 구독 결제 수 담을 변수 생성
	    int sumOfTodayBuy = 0;
	    // 구매내역 리스트 길이만큼 반복문
	    for (int i=0; i<productBuyLogList.size(); i++) {
	    	// 구매내역에서 날짜만 가져오기
	    	String buyDate = productBuyLogList.get(i).getProductBuyLogDate().toString().substring(0, 10);
	    	// 구매내역의 날짜와 오늘의 날짜가 같다면 sumOftodayBuy++;	 
	    	if ( buyDate.equals(dayday)) {
	    		sumOfTodayBuy++;
	    	}
	    }
	    model.addAttribute("sumOfTodayBuy", sumOfTodayBuy);
	    // 오늘 구독 결제 수 종료
	    //-----------------------------------------

    	
	    //-----------------------------------------
	    // 오늘 생성 커뮤니티 수 시작
	    // 오늘 생성 커뮤니티 수 담을 변수 생성
	    int sumOfTodayCommunity = 0;
	    // 커뮤니티 리스트 길이만큼 반복문
	    for (int i=0; i<communityList.size(); i++) {
	    	// 커뮤니티에서 날짜만 가져오기
	    	String createDate = communityList.get(i).getCommunityCreatedate().toString().substring(0, 10);
	    	// 커뮤니티의 날짜와 오늘의 날짜가 같다면 sumOfTodayCommunity++;
	    	if ( createDate.equals(dayday)) {
	    		sumOfTodayCommunity++;
	    	}
	    }
	    model.addAttribute("sumOfTodayCommunity", sumOfTodayCommunity);
	    // 오늘 생성 커뮤니티 수 종료
	    //-----------------------------------------
	   
	    //-----------------------------------------
	    // 오늘 가입자 수 시작
	    // 오늘 가입자 수 담을 변수 생성
	    int sumOfTodayJoin = 0;
	    // 유저 리스트 길이만큼 반복문
	    for (int i=0; i<userList.size(); i++) {
	    	// 유저의 가입날짜만 가져오기
	    	String createDate = userList.get(i).getUserJoindate().toString().substring(0, 10);
	    	// 유저의 가입날짜와 오늘의 날짜가 같다면 sumOfTodayCommunity++;
	    	if ( createDate.equals(dayday)) {
	    		sumOfTodayJoin++;
	    	}
	    }
	    model.addAttribute("sumOfTodayJoin", sumOfTodayJoin);
	    // 오늘 생성 커뮤니티 수 종료
	    //-----------------------------------------	    
	    
	    //-----------------------------------------
	    // 전체 회원수 시작
	    int allUserNum = userList.size();
	    model.addAttribute("allUserNum", allUserNum);
	    // 전체 회원수 종료
	    //-----------------------------------------
	    
	    //-----------------------------------------
	    // 전체 회원 중 구독가입률 시작
	    // 중복금지, 정렬 하지 않는 HashSet 사용
	    HashSet<Integer> setSubNum = new HashSet<Integer>();
	    for (int i=0; i<productBuyLogList.size();i++) {	    	
	    	setSubNum.add(productBuyLogList.get(i).getUserNo());
	    }
	    // 구독중인 회원의 수
	    int subUserNum = setSubNum.size();
	    // 구독회원 / 전체회원
	    double subPercentage = Math.round((double)subUserNum/allUserNum*100);
	    model.addAttribute("subPercentage", subPercentage);
	    // 전체 회원 중 구독가입률 종료
	    //-----------------------------------------
	    
	    //-----------------------------------------
	    // 전체 회원 중 커뮤니티 생성률 시작
	    HashSet<Integer> setCommNum = new HashSet<Integer>();
	    for (int i=0; i<communityList.size();i++) {	    	
	    	setCommNum.add(communityList.get(i).getCommunityHostno());
	    }
	    // 커뮤니티생성회원의 수
	    int commUserNum = setCommNum.size();
	    // 커뮤니티생성회원 / 전체회원
	    double commPercentage = Math.round((double)commUserNum/allUserNum*100);
	    model.addAttribute("commPercentage", commPercentage);	    
	    // 전체 회원 중 커뮤니티 생성률 종료	    
	    //-----------------------------------------

	    //-----------------------------------------
	    // 전체 커뮤니티 중 게시판 생성률 시작
	    HashSet<Integer> setCommBoardNum = new HashSet<Integer>();
	    for (int i=0; i<communityBoardList.size();i++) {	    	
	    	setCommBoardNum.add(communityBoardList.get(i).getCommunityNo());
	    }
	    // 게시판생성회원의 수
	    int commBoardUserNum = setCommBoardNum.size();
	    // 게시판생성회원 / 커뮤니티생성회원
	    double commBoardPercentage = Math.round((double)commBoardUserNum/commUserNum*100);
	    model.addAttribute("commBoardPercentage", commBoardPercentage);	    
	    // 전체 커뮤니티 중 게시판 생성률 종료	    
	    //-----------------------------------------
	    
	    //-----------------------------------------
	    // 채널보유회원률 시작
	    int doesUserHaveChannel = 0;
	    // 채널보유회원 수 구하기
	    for (int i=0; i<userList.size(); i++) {
	    	if(userList.get(i).getUserChannelLink() != null) {
	    		doesUserHaveChannel++;
	    	}
	    // 채널보유회원 / 전체회원
	    double haveChannel = Math.round((double)doesUserHaveChannel/allUserNum*100);
	    model.addAttribute("haveChannel", haveChannel);
	    }
	    // 채널보유회원률 종료
	    //-----------------------------------------
	    
	    
	    
		return "administrator/admin_index";
	}
	// 관리자 메인페이지 종료
	//-----------------------------------------

	
	
	@GetMapping("/admin_chart")
	public String admin_chart() {
		return "administrator/admin_chart";
	}

	
	
	@GetMapping("/admin_empty")
	public String admin_empty() {
		return "administrator/admin_empty";
	}

	
	
	@GetMapping("/admin_form")
	public String admin_form() {
		return "administrator/admin_form";
	}

	
	
	@GetMapping("/admin_tab-panel")
	public String admin_tab_panel() {
		return "administrator/admin_tab-panel";
	}

	
	
	
	//-----------------------------------------
	// 관리자 사이트관리페이지 시작
	  //회원목록조회
	@GetMapping("/admin_table")
	public String admin_table(Model model) {
	    List<User> userList = adminService.SelectAllUserList();
		model.addAttribute("userList", userList);

		return "administrator/admin_table";
	}
	
	// 관리자 사이트관리페이지 종료
	//-----------------------------------------

	
	//-----------------------------------------
	// 관리자 메모 페이지 시작
	@GetMapping("/admin_ui-elements")
	public String admin_ui_elements(Model model) {

		List<AdminReportLog> logList = adminService.SelectAllAdminReportLog();
		model.addAttribute("reportLogContent", logList);
	
		return "administrator/admin_ui-elements";		
	}
	
	
	@PostMapping("/memo")
	public String memo(Model model ,String reportLogContent, String reportLogTitle, String userNo, AdminReportLog adminReportLog) {
		
		List<AdminReportLog> logList = adminService.SelectAllAdminReportLog();
		model.addAttribute("reportLogContent", logList);
		
		System.out.println("1 : " + reportLogContent);
		System.out.println("2 : " + reportLogTitle);
		System.out.println("3 : " + userNo);
		
		
		
		if(!reportLogContent.equals("")) {
			adminService.memo(adminReportLog);				
		}
		return "administrator/admin_ui-elements";	
		
		
		
	}
	
	// 관리자 메모페이지 종료
	//-----------------------------------------

}
