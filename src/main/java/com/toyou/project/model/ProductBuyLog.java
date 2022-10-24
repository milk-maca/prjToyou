package com.toyou.project.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
@Entity
public class ProductBuyLog {

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int productBuyLogNo;

@Column(nullable = false)
private int productNo;	// fk => product.productNo

@CreationTimestamp
private Timestamp productBuyLogDate; // 상품 결제일 !

@Column(nullable = false)
private int userNo;
}