package com.toyou.project.controller;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.toyou.project.model.CategoryAsmr;
import com.toyou.project.model.CategoryBeauti;
import com.toyou.project.model.CategoryCar;
import com.toyou.project.model.CategoryFitness;
import com.toyou.project.model.CategoryGame;
import com.toyou.project.model.CategoryMukbang;
import com.toyou.project.model.CategoryUser;
import com.toyou.project.model.ChannelOwner;
import com.toyou.project.model.Community;
import com.toyou.project.model.CommunityUserInfo;
import com.toyou.project.model.Magazine;
import com.toyou.project.model.Product;
import com.toyou.project.model.ProductBuyLog;
import com.toyou.project.model.User;
import com.toyou.project.model.keywordGoogle;
import com.toyou.project.model.keywordTiktok;
import com.toyou.project.model.keywordTwitch;
import com.toyou.project.model.keywordTwitter;
import com.toyou.project.service.admin.AdminService;
import com.toyou.project.service.community.CommunityService;
import com.toyou.project.service.loginmain.category.CategoryAsmrService;
import com.toyou.project.service.loginmain.category.CategoryBeautiService;
import com.toyou.project.service.loginmain.category.CategoryCarService;
import com.toyou.project.service.loginmain.category.CategoryFitnessService;
import com.toyou.project.service.loginmain.category.CategoryGameService;
import com.toyou.project.service.loginmain.category.CategoryMukbangService;
import com.toyou.project.service.loginmain.keyword.KeywordGoogleService;
import com.toyou.project.service.loginmain.keyword.KeywordTiktokService;
import com.toyou.project.service.loginmain.keyword.KeywordTwitchService;
import com.toyou.project.service.loginmain.keyword.KeywordTwitterService;
import com.toyou.project.service.loginmain.newjoin.NewjoinService;
import com.toyou.project.service.magazine.MagazineService;
import com.toyou.project.service.mypage.MypageService;
import com.toyou.project.service.pay.PayService;
import com.toyou.project.service.user.UserService;


@Controller
public class MainController {
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private UserService userService;
	@Autowired
	private KeywordGoogleService keywordGoogleService;
	@Autowired
	private KeywordTiktokService keywordTiktokService;
	@Autowired
	private KeywordTwitchService keywordTwitchService;
	@Autowired
	private KeywordTwitterService keywordTwitterService;
	@Autowired
	private CategoryAsmrService categoryAsmrService;
	@Autowired
	private CategoryBeautiService categoryBeautiService;
	@Autowired
	private CategoryCarService categoryCarService;
	@Autowired
	private CategoryFitnessService categoryFitnessService;
	@Autowired
	private CategoryGameService categoryGameService;
	@Autowired
	private CategoryMukbangService categoryMukbangService;
	@Autowired
	private PayService payService;
	@Autowired
	private MypageService mypageService;
	@Autowired
	private MagazineService magazineService;
	@Autowired
	private NewjoinService newjoinService;
	@Autowired
	private AdminService adminService;
	
	
	// 
	@GetMapping({"/",""})
	public String home(Model model) {
		//--------------------------------------------------------------------
		// 성연추가) 구독정보
		List<Product> productList = payService.SelectAllProductList();
		model.addAttribute("Price1", productList.get(0).getProductPrice());
		model.addAttribute("Price2", productList.get(1).getProductPrice());
		model.addAttribute("Price3", productList.get(2).getProductPrice());
		// 성연추가) 전체회원수
		List<User> userList = adminService.SelectAllUserList();
	    int allUserNum = userList.size();
	    model.addAttribute("allUserNum", allUserNum);
		//--------------------------------------------------------------------
		return "index";
	}
	
	
	@GetMapping("/auth/searchChannel")
	public String searchChannel() {
		return "index";
	}

	

	
	@GetMapping("/auth/trend")
	public String magazine(Model model,Authentication authentication) {
		
//		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
//	    String username = userDetails.getUsername();
//	    User user = userService.userFind(username);

		if(authentication != null && authentication.getPrincipal() != null) {
			
			UserDetails userDetails = (UserDetails)authentication.getPrincipal();
			
			String username = userDetails.getUsername();
			
			User user = userService.userFind(username);
			
			
			
			List<CategoryUser> CategoryList2 = userService.userFindCategory(user.getUserChannelCategory());
			model.addAttribute("CategoryList2",CategoryList2);
		}else {
			String CategoryList2 = null;
			model.addAttribute("CategoryList2",CategoryList2);
			
			
		}
	    
	    
	    
		List<keywordGoogle> googleList = keywordGoogleService.SelectAllKeywordGoogle();
		List<keywordTiktok> tiktokList = keywordTiktokService.SelectAllKeywordTiktok();
		List<keywordTwitch> twitchList = keywordTwitchService.SelectAllKeywordTwitch();
		List<keywordTwitter> twitterList = keywordTwitterService.SelectAllKeywordTwitter();
		
		List<keywordTwitter> twitterTotalList = keywordTwitterService.SelectAllKeywordTwitterKind("total");
		List<keywordTwitter> twitterFamousList = keywordTwitterService.SelectAllKeywordTwitterKind("famous");
		List<keywordTwitter> twitterDurationList = keywordTwitterService.SelectAllKeywordTwitterKind("duration");
		
		
		List<CategoryAsmr> AsmrList = categoryAsmrService.SelectAllCategoryAsmr();
		List<CategoryBeauti> BeautiList = categoryBeautiService.SelectAllCategoryBeauti();
		List<CategoryCar> CarList = categoryCarService.SelectAllCategoryCar();
		List<CategoryFitness> FitnessList = categoryFitnessService.SelectAllCategoryFitness();
		List<CategoryGame> GameList = categoryGameService.SelectAllCategoryGame();
		List<CategoryMukbang> MukbangList = categoryMukbangService.SelectAllCategoryMukbang();
		
		List<User> NewUserList = newjoinService.SelectAllUser();
		
//		List<CategoryUser> CategoryList2 = userService.userFindCategory(user.getUserChannelCategory());
		
		model.addAttribute("googleList", googleList);
		model.addAttribute("tiktokList", tiktokList);
		model.addAttribute("twitchList", twitchList);
		model.addAttribute("twitterList", twitterList);
		
		model.addAttribute("twitterTotalList", twitterTotalList);
		model.addAttribute("twitterFamousList", twitterFamousList);
		model.addAttribute("twitterDurationList", twitterDurationList);
		
		model.addAttribute("NewUserList",NewUserList);
		// 난수 4개 추출 1~6
		Set<Integer> set = new HashSet<>(); 
		while (set.size() < 4) { 
			Double d = Math.random() * 6 + 1; 
			set.add(d.intValue()); 
			} 
		List<Integer> list = new ArrayList<>(set); 
		//System.out.println(list);
		
		if(list.contains(1)) {
			model.addAttribute("AsmrList", AsmrList);
		}
		if(list.contains(2)) {
			model.addAttribute("BeautiList", BeautiList);
		}
		if(list.contains(3)) {
			model.addAttribute("FitnessList", FitnessList);
		}
		if(list.contains(4)) {
			model.addAttribute("GameList", GameList);
		}
		if(list.contains(5)) {
			model.addAttribute("MukbangList", MukbangList);
		}
		if(list.contains(6)) {
			model.addAttribute("CarList", CarList);
		}
		else {
			return "trend";
		}
		
//		model.addAttribute("BeautiList",BeautiList);
//		model.addAttribute("CarList",CarList);
//		model.addAttribute("FitnessList",FitnessList);
//		model.addAttribute("GameList",GameList);
//		model.addAttribute("MukbangList",MukbangList);
		
	
		
		
		
		return "trend";
	}


	

	@GetMapping("/auth/magazine")
	public String testmagazine(Model model) {
		List<Magazine> EnterNews = magazineService.SelectMagazineListBySc("최신 뉴스");
		model.addAttribute("EnterNews", EnterNews);
		
		List<Magazine> EnterMovie = magazineService.SelectMagazineListBySc("영화");
		model.addAttribute("EnterMovie", EnterMovie);
		
		List<Magazine> EnterMusic = magazineService.SelectMagazineListBySc("음악");
		model.addAttribute("EnterMusic", EnterMusic);
		
		List<Magazine> EnterTV = magazineService.SelectMagazineListBySc("TV");
		model.addAttribute("EnterTV", EnterTV);
		
		List<Magazine> EnterBook = magazineService.SelectMagazineListBySc("도서");
		model.addAttribute("EnterBook", EnterBook);
		
		List<Magazine> EnterArt = magazineService.SelectMagazineListBySc("예술");
		model.addAttribute("EnterArt", EnterArt);
		
		List<Magazine> EnterIdol = magazineService.SelectMagazineListBySc("연예");
		model.addAttribute("EnterIdol", EnterIdol);
		
		List<Magazine> Health = magazineService.SelectMagazineListBySc("건강");
		model.addAttribute("Health", Health);
		
		List<Magazine> Science = magazineService.SelectMagazineListBySc("과학기술");
		model.addAttribute("Science", Science);
		
		List<Magazine> Business = magazineService.SelectMagazineListBySc("비지니스");
		model.addAttribute("Business", Business);
		
		List<Magazine> World = magazineService.SelectMagazineListBySc("세계");
		model.addAttribute("World", World);
		
	
		return "magazine";
	}
	
	@GetMapping("/mypageLoading")
	public String mypageLoading() {
		return "mypageLoading";
	}
	
	
	// 개발 마무리 단계에서 /auth 삭제할 예정
	@GetMapping("/mypage")
	public String myPage(ProductBuyLog productBuyLog, Authentication authentication, Model model) {
		System.out.println("ㅎㅇ");
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
	    String username = userDetails.getUsername();
	    User user = userService.userFind(username);
	    int userNo = user.getUserNo();	    
	    
	    if(user.getUserChannelLink() != null) {
	    	String checkChannel = user.getUserChannelLink();
	    	model.addAttribute("checkChannel", checkChannel);
	    }
	    
	    //--------------------------------------------------------------------
	    // 인철 마이페이지 시작
	    // ▼ 채널정보 불러오는 부분
	   
		try {
		String userNos = Integer.toString(user.getUserNo());
		String userChannelCategory = user.getUserChannelCategory();
		String userChannelImg = user.getUserChannelImg();
		String userChannelLink = user.getUserChannelLink();
		String userChannelName = user.getUserChannelName();
		String userEmail = user.getUserEmail();
		String userId = user.getUserId();
		String userIspayment = Integer.toString(user.getUserIspayment());
		String userJoindate = user.getUserJoindate().toString();
		String userName = user.getUserName();
		String userRolemodelLink = user.getUserRolemodelLink();
		String userSubscriber = user.getUserSubscriber();
		
		
		int Hostno = user.getUserNo();
		
		ChannelOwner userInfo = mypageService.findMyChannel(Hostno);
		System.out.println(userInfo.getChExplain());
		model.addAttribute("userInfo", userInfo);
		
		
		String[] snsList = userInfo.getChSns().split("#@!");
		ArrayList<String> iconLinkList = new ArrayList<String>();
		ArrayList<String> snsLinkList = new ArrayList<String>();
		// sns 스플릿
		for(int i=0;i<snsList.length;i++) {
			try {
			String[] temp = snsList[i].split("!@#");
			iconLinkList.add(temp[1]);
			snsLinkList.add(temp[0]);
			}
			catch(Exception e){
				
			}
		}
		model.addAttribute("iconLinkList", iconLinkList);
		model.addAttribute("snsLinkList", snsLinkList);
		
		String[] lastmovieList = userInfo.getChLastmovie().split("#@!");
		ArrayList<String> lastmovieTitle = new ArrayList<String>();
		ArrayList<String> lastmovieThumnail = new ArrayList<String>();
		ArrayList<String> lastmovieView = new ArrayList<String>();
		ArrayList<String> lastmovieLink = new ArrayList<String>();
		ArrayList<String> lastmovieTime = new ArrayList<String>();
		ArrayList<String> lastmovieDuration = new ArrayList<String>();
		ArrayList<Integer> lastmovieCommentAnalysis = new ArrayList<Integer>();
		String tempLink ="";
		for(int i=0;i<lastmovieList.length;i++) {
			try {
			String[] temp = lastmovieList[i].split("!@#");
			
				lastmovieTitle.add(temp[0]);
				lastmovieThumnail.add(temp[1]);
				lastmovieView.add(temp[2]);
				System.out.println("링크 테스트1 " +temp[3]);
				
				tempLink = temp[3].replaceAll("\\?", "");
				tempLink = tempLink.replaceAll("watchv=", "embed/");
				System.out.println("링크 테스트2 " +tempLink);
				lastmovieLink.add(tempLink);
				lastmovieTime.add(temp[4]);
				lastmovieDuration.add(temp[5]);
				
				float tempComment = Float.parseFloat(temp[6]);
				int tmp = Math.round(tempComment);
				lastmovieCommentAnalysis.add(tmp);
			}
			
			
			catch(Exception e){
				
			}
		}
		model.addAttribute("lastmovieTitle", lastmovieTitle);
		model.addAttribute("lastmovieThumnail", lastmovieThumnail);
		model.addAttribute("lastmovieView", lastmovieView);
		model.addAttribute("lastmovieLink", lastmovieLink);
		model.addAttribute("lastmovieTime", lastmovieTime);
		model.addAttribute("lastmovieDuration", lastmovieDuration);
		model.addAttribute("lastmovieCommentAnalysis", lastmovieCommentAnalysis);
		///////////////////////////
		
		String[] famousmovieList = userInfo.getChFamousmovie().split("#@!");
		ArrayList<String> famousmovieTitle = new ArrayList<String>();
		ArrayList<String> famousmovieThumnail = new ArrayList<String>();
		ArrayList<String> famousmovieView = new ArrayList<String>();
		ArrayList<String> famousmovieLink = new ArrayList<String>();
		ArrayList<String> famousmovieTime = new ArrayList<String>();
		ArrayList<String> famousmovieDuration = new ArrayList<String>();
		ArrayList<Integer> famousmovieCommentAnalysis = new ArrayList<Integer>();
		tempLink ="";
		for(int i=0;i<famousmovieList.length;i++) {
			try {
			String[] temp = famousmovieList[i].split("!@#");
			
				famousmovieTitle.add(temp[0]);
				famousmovieThumnail.add(temp[1]);
				famousmovieView.add(temp[2]);
				System.out.println("링크 테스트1 " +temp[3]);
				
				tempLink = temp[3].replaceAll("\\?", "");
				tempLink = tempLink.replaceAll("watchv=", "embed/");
				System.out.println("링크 테스트2 " +tempLink);
				famousmovieLink.add(tempLink);
				famousmovieTime.add(temp[4]);
				famousmovieDuration.add(temp[5]);
				
				float tempComment = Float.parseFloat(temp[6]);
				int tmp = Math.round(tempComment);
				famousmovieCommentAnalysis.add(tmp);
			}
			
			
			catch(Exception e){
				
			}
		}
		model.addAttribute("famousmovieTitle", famousmovieTitle);
		model.addAttribute("famousmovieThumnail", famousmovieThumnail);
		model.addAttribute("famousmovieView", famousmovieView);
		model.addAttribute("famousmovieLink", famousmovieLink);
		model.addAttribute("famousmovieTime", famousmovieTime);
		model.addAttribute("famousmovieDuration", famousmovieDuration);
		model.addAttribute("famousmovieCommentAnalysis", famousmovieCommentAnalysis);
		
		
		
		
		List<Community> communityList = communityService.SelectAllCommunitybyCommunityHostno(Hostno);
		
		model.addAttribute("userNo",userNo);
		model.addAttribute("userChannelCategory",userChannelCategory);
		model.addAttribute("userChannelImg",userChannelImg);
		model.addAttribute("userChannelLink",userChannelLink);
		model.addAttribute("userChannelName",userChannelName);
		model.addAttribute("userEmail",userEmail);
		model.addAttribute("userId",userId);
		model.addAttribute("userIspayment",userIspayment);
		model.addAttribute("userJoindate",userJoindate);
		model.addAttribute("userName",userName);
		model.addAttribute("userRolemodelLink",userRolemodelLink);
		model.addAttribute("userSubscriber",userSubscriber);
		
		
		model.addAttribute("communityList",communityList);
		}
		catch(Exception e) {
			
		}
		
		if(communityService.SelectAllCommunitybyCommunityHostno(user.getUserNo()) != null) {
			List<Community> myCommunity = communityService.SelectAllCommunitybyCommunityHostno(user.getUserNo());
			ArrayList<Integer> countCommunity = new ArrayList<Integer>();
			ArrayList<String> bannerCommunity = new ArrayList<String>();
			ArrayList<ArrayList<String>> tagCommunityList = new ArrayList<ArrayList<String>>();
			
			for(int i=0;i<myCommunity.size();i++) {
				int communityNo = myCommunity.get(i).getCommunityNo();
				int count = communityService.countByUserInfo(communityNo);
				ArrayList<String> tagCommunity = new ArrayList<String>();
				String banner = mypageService.findMyChannel(userNo).getChBanner();
				countCommunity.add(count);
				bannerCommunity.add(banner);
				
				String[] temp  = communityService.findById(communityNo).getCommunityTag().split(",");
				for(int k=0;k<temp.length;k++) {
					tagCommunity.add(temp[k]);
				}
				tagCommunityList.add(tagCommunity);
			}
			model.addAttribute("countCommunity", countCommunity);
			model.addAttribute("myCommunity", myCommunity);
			model.addAttribute("bannerCommunity", bannerCommunity);
			model.addAttribute("tagCommunityList", tagCommunityList);
			
		}
		List<CommunityUserInfo> communityUserInfoList = communityService.findByUserInfoAll(userNo);
		ArrayList<Community> otherCommunityList = new ArrayList<Community>();
		ArrayList<ChannelOwner> otherCommunityHostList = new ArrayList<ChannelOwner>();
		ArrayList<Integer> countOtherCommunity = new ArrayList<Integer>();
		ArrayList<ArrayList<String>> tagOtherCommunityList = new ArrayList<ArrayList<String>>();
		for(int i=0;i<communityUserInfoList.size();i++) {
			int communityNo = communityUserInfoList.get(i).getCommunityNo();
			Community otherCommunity = communityService.findById(communityNo); 
			otherCommunityList.add(otherCommunity);
			ArrayList<String> tagOthrerCommunity = new ArrayList<String>();
			int hostNo = otherCommunity.getCommunityHostno();
			ChannelOwner hostInfo = mypageService.findMyChannel(hostNo);
			otherCommunityHostList.add(hostInfo);		
			
			int count = communityService.countByUserInfo(communityNo);	
			countOtherCommunity.add(count);
			// 여기서 에러가 나는데
			System.out.println("여기서 나는지 확인");
			String[] temp  = communityService.findById(communityNo).getCommunityTag().split(",");
			for(int k=0;k<temp.length;k++) {
				tagOthrerCommunity.add(temp[k]);
			}
			tagOtherCommunityList.add(tagOthrerCommunity);
		}
		
		model.addAttribute("otherCommunityList", otherCommunityList);
		model.addAttribute("otherCommunityHostList", otherCommunityHostList);
		model.addAttribute("countOtherCommunity", countOtherCommunity);
		model.addAttribute("tagOtherCommunityList", tagOtherCommunityList);
		
		
	    // 인철 마이페이지 종료
	 	//--------------------------------------------------------------------
	    
	    //--------------------------------------------------------------------
	    // 성연 마이페이지 시작
	    // ▼ 결제정보 불러오는 부분
	    List<ProductBuyLog> productBuyLogList = payService.SelectAllProductBuyLogUserNo(userNo);		
	    model.addAttribute("payInfo", user.getUserIspayment());
		model.addAttribute("productBuyLogList", productBuyLogList);
		List<Product> productList = payService.SelectAllProductList();
		model.addAttribute("Name1", productList.get(0).getProductName());
		model.addAttribute("Name2", productList.get(1).getProductName());
		model.addAttribute("Name3", productList.get(2).getProductName());
		model.addAttribute("Price1", productList.get(0).getProductPrice());
		model.addAttribute("Price2", productList.get(1).getProductPrice());
		model.addAttribute("Price3", productList.get(2).getProductPrice());
		// 성연 마이페이지 종료
		//--------------------------------------------------------------------
		
		return "mypage";
	}
	
	@RequestMapping(value = "/auth/getUser",method = RequestMethod.GET)
	@ResponseBody
	public String getUser(@RequestParam String userNo) {

		ChannelOwner channelOwner = mypageService.findMyChannel(Integer.parseInt(userNo));
		String chProfile = channelOwner.getChProfile();
		
		return chProfile;
	}
    
	
	
	@GetMapping("/auth/channelSearch")
	public String channelSearch(String keyword, Model model) {
		System.out.println("시작");
		try (Socket client = new Socket()) {
			
			// 소켓에 접속하기 위한 접속 정보를 선언한다.
			InetSocketAddress ipep = new InetSocketAddress("15.164.170.187", 9999);
			// 소켓 접속!
			
			client.connect(ipep);
			

			// 소켓이 접속이 완료되면 inputstream과 outputstream을 받는다.
			try (OutputStream sender = client.getOutputStream(); InputStream receiver = client.getInputStream();) {
				// 메시지는 for 문을 통해 10번 메시지를 전송한다.
				String msg = keyword;
				// string을 byte배열 형식으로 변환한다.
				byte[] data = msg.getBytes();
				// ByteBuffer를 통해 데이터 길이를 byte형식으로 변환한다.
				ByteBuffer b = ByteBuffer.allocate(4);
				// byte포멧은 little 엔디언이다.
				b.order(ByteOrder.LITTLE_ENDIAN);
				b.putInt(data.length);
				// 데이터 길이 전송
				sender.write(b.array(), 0, 4);
				// 데이터 전송
				sender.write(data);

				data = new byte[4];
		
				// 데이터 길이를 받는다.
				receiver.read(data, 0, 4);
				
				// ByteBuffer를 통해 little 엔디언 형식으로 데이터 길이를 구한다.
				b = ByteBuffer.wrap(data);
				b.order(ByteOrder.LITTLE_ENDIAN);
				int length = b.getInt();
				// 데이터를 받을 버퍼를 선언한다.
				data = new byte[length];
				// 데이터를 받는다.
				receiver.read(data, 0, length);
				// byte형식의 데이터를 string형식으로 변환한다.
				msg = new String(data, "UTF-8");
				// 콘솔에 출력한다.
				System.out.println(msg);
				try {
					String[] info = msg.split("!@#");
					
					model.addAttribute("title",info[0]);
					model.addAttribute("movie",info[1]);
					model.addAttribute("link",info[2]);
					model.addAttribute("banner",info[3]);
					model.addAttribute("profile",info[4]);
					model.addAttribute("explain",info[5]);
					model.addAttribute("birth",info[6]);
					model.addAttribute("sub",info[7]);
				}catch(Throwable e){
					
				}		
				System.out.println("end");
			}
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		return "channelSearch";
	}
	
	
}
