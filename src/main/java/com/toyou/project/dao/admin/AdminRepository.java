package com.toyou.project.dao.admin;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.toyou.project.model.AdminReportLog;
import com.toyou.project.model.Community;
import com.toyou.project.model.CommunityBoard;
import com.toyou.project.model.ProductBuyLog;
import com.toyou.project.model.User;

@Repository
public interface AdminRepository extends JpaRepository<AdminReportLog, Integer> {

	
	@Query(value = "SELECT com FROM ProductBuyLog com" )
	List<ProductBuyLog> productBuyLogList();

	@Query(value = "SELECT com FROM Community com" )
	List<Community> communityList();
	
	@Query(value = "SELECT com FROM CommunityBoard com" )
	List<CommunityBoard> communityBoardList();
	
	@Query(value = "SELECT com FROM User com" )
	List<User> userList();
	
	@Query(value = "SELECT com FROM AdminReportLog com ORDER BY com.reportLogNo DESC" )
	List<AdminReportLog> adminReportLogList();

	
}