package com.toyou.project.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
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
public class CategoryAsmr {
	
	@Id
	@GeneratedValue
	@Column(name = "CategoryAsmrId")
	private int CategoryAsmrId;
	
	@Column(name = "CategoryAsmrName",length = 100)
	private String CategoryAsmrName;
	
	@Column(name = "CategoryAsmrSubscribe",length = 100)
	private String CategoryAsmrSubscribe;

}
