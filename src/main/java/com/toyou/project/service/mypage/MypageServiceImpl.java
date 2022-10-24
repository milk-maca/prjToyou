package com.toyou.project.service.mypage;

import java.util.List;

//import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toyou.project.dao.mypage.MypageRepository;
import com.toyou.project.dao.user.UserRepository;
import com.toyou.project.dto.ResponseDTO;
import com.toyou.project.model.ChannelOwner;
import com.toyou.project.model.RoleType;
import com.toyou.project.model.User;

@Service
public class MypageServiceImpl implements MypageService {

	@Value("${toyou.key}")
	private String toyouKey;

	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	private MypageRepository mypageRepository;

	@Autowired
	private UserRepository userRepository;

	// 정보수정
	@Transactional
	public void userUpdate(User user) {
		// 수정시에는 영속성 컨텍스트 User 오브젝트를 영속화시키고, 영속화 된 User 오브젝트를 수정
		// select 해서 User오브젝트를 DB로부터 가져오는 이유는 영속화를 하기 위해
		// 영속화된 오브젝트를 변경하면 자동으로 DB에 update문을 날려줌
		User persistance = userRepository.findById(user.getUserNo()).orElseThrow(() -> {
			return new IllegalArgumentException("회원찾기 실패");
		});

		if (persistance.getOauth() == null || persistance.getOauth().equals("")) {
			String rawPassword = user.getUserPassword();
			String encPassword = encoder.encode(rawPassword);
			persistance.setUserPassword(encPassword);

		} else {
			String rawPassword = toyouKey;
			String encPassword = encoder.encode(rawPassword);
			persistance.setUserPassword(encPassword);
		}

		
		if (user.getUserChannelName() != null) {		
			persistance.setUserChannelName(user.getUserChannelName());
		}
		
		if (user.getUserChannelLink() != null) {		
			persistance.setUserChannelLink(user.getUserChannelLink());
		}

		if (user.getUserChannelCategory() != null) {
			persistance.setUserChannelCategory(user.getUserChannelCategory());
		}


		if (user.getUserRolemodelLink() != null) {
			persistance.setUserRolemodelLink(user.getUserRolemodelLink());
		}

		
		
		persistance.setUserName(user.getUserName());
		persistance.setUserChannelName(user.getUserChannelName());
//		persistance.setUserRolemodelLink(user.getUserRolemodelLink());
		persistance.setUserEmail(user.getUserEmail());
		persistance.setUserChannelCategory(user.getUserChannelCategory());

//		회원수정 함수 종료 = 서비스 종료 = 트랜젝션 종료 = commit이 자동실행
//		영속화 된 persistance객체의 변화가 감지되면 더티체킹이 되어 update문을 날려줌

	}

	@Override
	public void deleteUser(User user) {
		userRepository.delete(user);
	}
	
	public List<ChannelOwner> channelOwner(){
		List<ChannelOwner> channelOwnerList = mypageRepository.findAll();
		return channelOwnerList;
	}
	
	public ChannelOwner findMyChannel(int userNo) {
		ChannelOwner channelOwner = mypageRepository.findByChannelOwnerUserNoAll(userNo);
		return channelOwner;
	}

}