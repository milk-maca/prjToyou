package com.toyou.project.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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
public class CommunityBoardReply {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int communityBoardReplyNo;
	
	@Column(nullable = false)
	public int communityBoardNo;
	
	@Column(nullable = false)
	public int userNo;
	
	@Column(nullable = false,length = 2048)
	public String communityBoardReplyContent;

	@CreationTimestamp
	private Timestamp communityBoardReplyWritedate;
	
}
