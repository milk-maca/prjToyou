package com.toyou.project.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class ChannelOwner {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int channelOwnerNo;
	
	@Column
	public int userNo;
	
	@Column(length = 200)
	public String chLink;
	
	@Column(length = 100)
	public String chTitle;
	
	@Column(length = 30)
	public String chSub;
	
	@Column(length = 300)
	public String chBanner;
	
	@Column(length = 2048)
	public String chSns;
	
	@Column(length = 300)
	public String chProfile;
	
	@Column(length = 2048)
	public String chExplain;
	
	@Column(length = 50)
	public String chTotalView;
	
	@Column(length = 4096)
	public String chLastmovie;
	
	@Column(length = 4096)
	public String chFamousmovie;
}