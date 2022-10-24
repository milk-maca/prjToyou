package com.toyou.project.dao.pay;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;

import com.toyou.project.model.Product;
import com.toyou.project.model.ProductBuyLog;

@Controller
public interface PayRepository extends JpaRepository<ProductBuyLog, Integer>{

	
	@Query(value = "SELECT com FROM Product com")
	List<Product> productList();
	
	@Query(value = "SELECT com FROM ProductBuyLog com WHERE com.userNo = :userNo ORDER BY com.productBuyLogNo DESC" )
	List<ProductBuyLog> findByProductBuyLogUserNo(@Param("userNo") int userNo);
	
	
}
