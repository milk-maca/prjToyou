package com.toyou.project.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


import org.hibernate.annotations.ColumnDefault;
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
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userNo;
	
	@Column(nullable = false, length = 30, unique=true)
	private String userId;
	
	@Column(nullable = false, length = 100) // 암호화예정이라 길게 설정
	private String userPassword;

	@Column(nullable = false,length = 50)
	private String userEmail;
	
	@Column(nullable = false, length = 20)
	private String userName;
	
	@Column(length = 100)
	private String userChannelName;
	
	
	@Column(length = 200)
	private String userChannelLink;
	
	@Column(length = 400)
	private String userChannelCategory;
	
	@Column(length=400)
	private String userChannelImg;
	

	private String oauth; // 로그인 방식 ( 카카오 구글 )
	
	@CreationTimestamp
	private Timestamp userJoindate;
	
	
	// 초기 구독자 수
	@Column(length=50)
	private String userSubscriber;
	
	
	@Column(length = 200)
	private String userRolemodelLink;
	
	
	@ColumnDefault("0")
	@Column(nullable = false)
	private int userIspayment;
	
	@Enumerated(EnumType.STRING)
	private RoleType userRole;
	
	
}
