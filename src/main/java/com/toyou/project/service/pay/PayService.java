package com.toyou.project.service.pay;

import java.util.List;

import com.toyou.project.model.Product;
import com.toyou.project.model.ProductBuyLog;
import com.toyou.project.model.User;

public interface PayService {

	public List<Product> SelectAllProductList();
	
	public List<ProductBuyLog> SelectAllProductBuyLogUserNo(int userNo);
	
	public void paySuccess(ProductBuyLog productBuyLog, User user);
	
}
