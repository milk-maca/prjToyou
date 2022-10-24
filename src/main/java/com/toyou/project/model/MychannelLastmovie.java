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
public class MychannelLastmovie {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int mychannelLastmovieNo;
	
	@Column(nullable = false)
	private int mychannelNo;
	
	@Column(nullable = false, length = 200)
	private String mychannelLastmovieTitle;
	
	@Column(nullable = false, length = 300)
	private String mychannelLastmovieThumnail;
	
	@Column(nullable = false, length = 50)
	private String mychannelLastmovieView;
	
	@Column(nullable = false, length = 50)
	private String mychannelLastmovieUpload;
	
	@Column(nullable = false, length = 20)
	private String mychannelLastmovieTime;
	
	@Column(nullable = false, length = 50)
	private String mychannelLastmovieComment;
	


}
