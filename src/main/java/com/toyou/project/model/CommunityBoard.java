package com.toyou.project.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Formula;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class CommunityBoard {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int communityBoardNo;
	
	@Column(nullable = false)
	private int communityNo;
	
	@Column(nullable = false)
	private int userNo;
	
	@Column(nullable = false,length = 100)
	private String communityBoardTitle;

	@Column(nullable = false,length = 2048)
	private String communityBoardContent;
	
	@ColumnDefault("0")
	@Column(nullable = false)
	private int communityBoardViewcnt;
	
	@CreationTimestamp
	private Timestamp communityBoardWritedate;
	
	@ColumnDefault("1")
	@Column(nullable = false)
	private int communityBoardIspublic;
	
	@Column
	private String communityBoardImgname;
	

	
	
}
