package com.toyou.project.service.pay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toyou.project.dao.pay.PayRepository;
import com.toyou.project.dao.user.UserRepository;
import com.toyou.project.model.Product;
import com.toyou.project.model.ProductBuyLog;
import com.toyou.project.model.User;

@Service
public class PayServiceImpl implements PayService {

	@Autowired
	private PayRepository payRepository;
	@Autowired
	private UserRepository userRepository;
	
	
	public List<Product> SelectAllProductList(){
		List<Product> SelectAllProductList = payRepository.productList();
		return SelectAllProductList;
	};
	
	
	public List<ProductBuyLog> SelectAllProductBuyLogUserNo(int userNo){
		List<ProductBuyLog> productBuyLogList = payRepository.findByProductBuyLogUserNo(userNo);
		return productBuyLogList;
	};
	
	
	@Transactional
	public void paySuccess(ProductBuyLog productBuyLog, User user) {
		
		payRepository.save(productBuyLog);
		
		User persistance = userRepository.findById(user.getUserNo()).orElseThrow(()->{
			return new IllegalArgumentException("회원찾기 실패");
		});
		persistance.setUserIspayment(productBuyLog.getProductNo());
	}

}
