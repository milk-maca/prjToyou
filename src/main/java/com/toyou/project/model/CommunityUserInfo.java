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
public class CommunityUserInfo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int communityUserinfoNo;
	
	@Column(nullable = false)
	private int communityNo;
	
	@Column(nullable = false)
	private int userNo;

	@ColumnDefault("0")
	@Column(nullable = false)
	private int communityUserinfoAuthority;
	
	
	@CreationTimestamp
	private Timestamp communityUserinfoJoindate;
}
