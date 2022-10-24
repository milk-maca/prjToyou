package com.toyou.project.model;

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
public class Magazine {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int magazineNo;
	
	@Column(length = 30)
	private String magazineBc;
	
	@Column(length = 30)
	private String magazineSc;
	
	@Column(length = 200)
	private String magazineTitle;
	
	@Column(length = 50)
	private String magazineWriter;
	
	@Column(length = 100)
	private String magazineTime;
	
	@Column(length = 300)
	private String magazineImage;
	
	@Column(length = 300)
	private String magazineLink;

	
}
