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
public class AdminReportLog {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int reportLogNo;
	
	@Column(nullable = false)
	public int userNo;
	
	@Column(nullable = false,length = 100)
	private String reportLogTitle;

	@Column(nullable = false,length = 2048)
	private String reportLogContent;
	
	@CreationTimestamp
	private Timestamp reportLogDate;
	
	@ColumnDefault("1")
	@Column(nullable = false)
	private int reportLogIsclear;
	
	
	@Column
	private Timestamp reportLogCleardate;
	
}
