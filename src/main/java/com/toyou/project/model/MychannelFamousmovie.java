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
public class MychannelFamousmovie {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int mychannelFamousmovieNo;
	
	@Column(nullable = false)
	private int mychannelNo;
	
	@Column(nullable = false, length = 200)
	private String mychannelFamousmovieTitle;
	
	@Column(nullable = false, length = 300)
	private String mychannelFamousmovieThumnail;
	
	@Column(nullable = false, length = 50)
	private String mychannelFamousmovieView;
	
	@Column(nullable = false, length = 50)
	private String mychannelFamousmovieUpload;
	
	@Column(nullable = false, length = 20)
	private String mychannelFamousmovieTime;
	
	@Column(nullable = false, length = 50)
	private String mychannelFamousmovieComment;
	


}
