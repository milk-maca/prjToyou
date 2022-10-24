package com.toyou.project.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toyou.project.dao.admin.AdminRepository;
import com.toyou.project.model.AdminReportLog;
import com.toyou.project.model.Community;
import com.toyou.project.model.CommunityBoard;
import com.toyou.project.model.ProductBuyLog;
import com.toyou.project.model.User;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminRepository adminRepository;
	
	public List<ProductBuyLog> SelectAllProductBuyLogList(){
		List<ProductBuyLog> SelectAllProductBuyLogList = adminRepository.productBuyLogList();
		return SelectAllProductBuyLogList;
	};
	
	public List<Community> SelectAllCommunityList(){
		List<Community> SelectAllCommunityList = adminRepository.communityList();
		return SelectAllCommunityList;
	};
	
	public List<CommunityBoard> SelectAllCommunityBoardList(){
		List<CommunityBoard> SelectAllCommunityBoardList = adminRepository.communityBoardList();
		return SelectAllCommunityBoardList;
	};
	
	public List<User> SelectAllUserList(){
		List<User> SelectAllUserList = adminRepository.userList();
		return SelectAllUserList;
	};
	
	public List<AdminReportLog> SelectAllAdminReportLog(){
		List<AdminReportLog> SelectAllAdminReportLog = adminRepository.adminReportLogList();
		return SelectAllAdminReportLog;
		
	};
	
	@Transactional
	public void memo(AdminReportLog adminReportLog) {
		adminRepository.save(adminReportLog);
		
	};
	
}
