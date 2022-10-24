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
public class keywordTwitch {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int keywordTwitchNo;
	
	@Column(nullable = false, length = 50)
	private String keywordTwitchName;
	
	@Column(length = 50)
	private String keywordTwitchCategory;
	
	@Column(length = 300)
	private String keywordTwitchLink;
	
	@Column(length = 300)
	private String keywordTwitchImage;



}
