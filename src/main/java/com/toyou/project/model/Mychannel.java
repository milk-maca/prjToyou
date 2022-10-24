package com.toyou.project.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Mychannel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int mychannelNo;
	
	@Column
	private int userNo;
	
	@Column(nullable = false, length = 100)
	private String mychannelTitle;
	
	@Column(nullable = false, length = 300)
	private String mychannelLink;
	
	@Column(length = 50)
	private String mychannelSub;
	
	@Column(length = 300)
	private String mychannelBanner;
	
	@Column(length = 300)
	private String mychannelProfile;
	
	@Column(length = 4096)
	private String mychannelExplain;
	
	@Column(length = 40)
	private String mychannelBirth;
	
	@Column(length = 50)
	private String mychannelView;

}
