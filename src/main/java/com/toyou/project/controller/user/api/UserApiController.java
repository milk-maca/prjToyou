package com.toyou.project.controller.user.api;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.toyou.project.dto.ResponseDTO;
import com.toyou.project.model.RoleType;
import com.toyou.project.model.User;
import com.toyou.project.service.user.UserService;

@RestController
public class UserApiController {

	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	
	// 아이디 중복체크
	@PostMapping("/auth/user/idCheck")
	public String idCheck(String userId) {
		System.out.println("중복체크 확인");
//		String userId = request.getParameter("userId");
		int result = 0; 
		if(userService.userFind(userId).getUserId() != null) {
			result = 1;
		}
		return Integer.toString(result);
	}
	

	
	// 회원가입
	@PostMapping("/auth/user/joinProc")
	public ResponseDTO<Integer> save(@RequestBody User user) { // username, password, email
		
		if(user.getUserChannelName()==""||user.getUserChannelName()==null) {
			user.setUserChannelName(null);
		}
		if(user.getUserChannelLink()==""||user.getUserChannelLink()==null) {
			user.setUserChannelLink(null);
		}
		if(user.getUserChannelImg()==""||user.getUserChannelImg()==null) {
			user.setUserChannelImg(null);
		}
		if(user.getUserChannelCategory()=="" || user.getUserChannelCategory()==null) {
			user.setUserChannelCategory(null);
		}
		if(user.getUserRolemodelLink()=="" || user.getUserRolemodelLink()==null) {
			user.setUserRolemodelLink(null);
		}
		if(user.getUserSubscriber()==""|| user.getUserSubscriber()==null) {
			user.setUserSubscriber(null);
		}
		
		user.setUserRole(RoleType.USER);
		userService.userJoin(user);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1); // 자바오브젝트를 JSON으로 변환해서 리턴 (Jackson)
	}
	
	

	
	@GetMapping("/auth/user/searchChannel")
	public String[] channelSearch(String keyword, Model model) {
		String[] contents = null;
		try (Socket client = new Socket()) {
			
			// 소켓에 접속하기 위한 접속 정보를 선언한다.
			InetSocketAddress ipep = new InetSocketAddress("13.125.219.2", 9999);
			// 소켓 접속!
			
			client.connect(ipep);
			System.out.println("채널 검색 시작");

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
				// 데이터를 받을 버퍼를 선언한다.v
				data = new byte[length];
				// 데이터를 받는다.
				receiver.read(data, 0, length);
				// byte형식의 데이터를 string형식으로 변환한다.
				msg = new String(data, "UTF-8");
				// 콘솔에 출력한다.
//				System.out.println(msg);

				try {
					contents = msg.split("#@!");
					
						
				}catch(Throwable e){
					
				}		
				System.out.println("end");
			}
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		return contents;
	}
	
	
}
