package com.toyou.project.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.toyou.project.model.KakaoProfile;
import com.toyou.project.model.OAuthToken;
import com.toyou.project.model.RoleType;
import com.toyou.project.model.User;
import com.toyou.project.service.user.UserService;


//인증이 안된 사용자들이 출입할 수 있는 경로는 /auth/* 으로만 설정함
//그냥 주소가 / 이면 index.jsp 까지 허용
//static 이하에 있는 /js/*, /css/* , /image/* 허용
@Controller
public class UserController {
	
	@Value("${toyou.key}")
	private String toyouKey;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@GetMapping("/auth/joinForm")
	public String joinForm() {	
		return "login/joinForm";
	}
	
	
	@GetMapping("/auth/loginForm")
	public String loginForm() {	
		return "login/loginForm";
	}
	

	
	// 카카오 로그인 구현
	@GetMapping("/auth/kakao/callback")
	public  String kakaoCallback(String code, Model model) { // DATA를 리턴해주는 컨트롤러
		// 토큰 가져오기 ==========================================================
		// POST 방식으로 key=value 데이터를 요청 (카카오서버로)
		// 1. Retrofit2
		// 2. OkHttp
		// 3. RestTemplate
		RestTemplate rt = new RestTemplate();
		
		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code"); // 고정 
		params.add("client_id", "9678b56f9afb8f96a880f7b1bdaee036"); // 클라이언트 키( 앱 키 )
		params.add("redirect_uri", "http://localhost:8003/auth/kakao/callback"); // 응답받을 url
		params.add("code", code);  // 로그인 누르면 받는 코드(파라매터)
		
		// HttpHeader와 HttpBody를 하나의 오브젝트에 담는다.
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params,headers);
		// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답받음
		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token",HttpMethod.POST,kakaoTokenRequest,String.class);
		
		// json 타입을 OAuthToken 오브젝트에 담는다.
		// Gson,Json Simple, ObjectMapper <= 라이브러리 종류
		OAuthToken authToken = null;
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			 authToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		System.out.println("json타입 => 오브젝트 확인 :"+authToken.getAccess_token());
		
		// 위에서 응답받은 토큰을 사용해 사용자 정보 가져오기==========================================================
		RestTemplate rt2 = new RestTemplate();
		
		// HttpHeader 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		// headervalue에 들어갈 Bearer 에 한칸 띄고!!!!!
		headers2.add("Authorization", "Bearer "+authToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		
		// HttpHeader와 HttpBody를 하나의 오브젝트에 담는다.
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = new HttpEntity<>(headers2);
		// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답받음
		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me",HttpMethod.POST,kakaoProfileRequest,String.class);
		
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile = null;
		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

//	    인증받은 카카오 유저 정보를 User(import 조심 VO로 임포트해야함)에 저장 
		String kakaoLoginId = "kakao"+kakaoProfile.getId().toString();
		
		User kakaoUser = User.builder()
				.userId(kakaoLoginId) // 아이디는 email+kakaoID
				.userName(kakaoProfile.getKakao_account().getProfile().getNickname()) // 이름은 카카오 이름
				.userPassword(toyouKey) // 패스워드는 yml파일에서 설정해준 고유 값
				.userEmail(kakaoProfile.getKakao_account().getEmail())
				.oauth("kakao")
				.userRole(RoleType.USER)
				.build();
		
//		카카오유저의 아이디로 회원가입정보 조회
		User originUser = userService.userFind(kakaoUser.getUserId());
//		가입이안되어 있다면 카카오 유저 정보로 회원가입 진행
		if(originUser.getUserId() == null) {
			model.addAttribute("kakaoUser", kakaoUser);
			
//			userService.userJoin(kakaoUser);
//			System.out.println("신규회원 자동 로그인 진행");
//			Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(kakaoUser.getUserId(),toyouKey));
//			SecurityContextHolder.getContext().setAuthentication(authentication);
			// 모델에 들어간 객체는 리다리렉트하면 없어집니다.
			return "/login/joinForm";

		}else {
			System.out.println("기존회원 자동 로그인 진행");
//			기존 회원이라면 가져온 회원정보로 로그인 처리
			Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(originUser.getUserId(), toyouKey));
			SecurityContextHolder.getContext().setAuthentication(authentication);

			return "redirect:/";
		}
	}
	
	// 카카오 로그아웃
	@GetMapping("kakao/logout/callback")
	public String kakaoLogoutCallBack( ) {
		
		return "redirect:/logout";
	}
	

	
	
	
	@GetMapping("/user/mypageForm")
	public String mypageForm() {
		return "/user/mypageForm";
	}
}
