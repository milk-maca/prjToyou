package com.toyou.project.service.admin;

import java.util.List;

import com.toyou.project.model.AdminReportLog;
import com.toyou.project.model.Community;
import com.toyou.project.model.CommunityBoard;
import com.toyou.project.model.ProductBuyLog;
import com.toyou.project.model.User;

public interface AdminService {

	public List<ProductBuyLog> SelectAllProductBuyLogList();
	public List<Community> SelectAllCommunityList();
	public List<CommunityBoard> SelectAllCommunityBoardList();
	public List<User> SelectAllUserList();
	public List<AdminReportLog> SelectAllAdminReportLog();
	public void memo(AdminReportLog adminReportLog);
	
}
