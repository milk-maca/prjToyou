package com.toyou.project.service.mypage;

import java.util.List;

import com.toyou.project.model.ChannelOwner;
import com.toyou.project.model.User;

public interface MypageService {

	public void userUpdate(User user);
	
	public void deleteUser(User user);
	
	public List<ChannelOwner> channelOwner();
	
	public ChannelOwner findMyChannel(int userNo);
}
