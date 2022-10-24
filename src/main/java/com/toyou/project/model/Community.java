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
public class Community {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int communityNo;
	
	@Column(nullable = false)
	private int communityHostno;
	
	@Column(nullable = false,length = 100)
	private String communityTitle;
	
	@Column(nullable = false,length = 2048)	
	private String communityDescription;
	
	@CreationTimestamp
	private Timestamp communityCreatedate;
	
	@ColumnDefault("1")
	@Column(nullable = false)
	private int communityIspublic;
	
	@Column
	private String communityTag;
}
