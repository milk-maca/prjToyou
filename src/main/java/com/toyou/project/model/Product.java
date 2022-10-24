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

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
@Entity
public class Product {

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int productNo;

@Column(nullable = false, length = 100)
private String productName;

@Column(nullable = false)
private int productPrice;

@Column(length = 1000)
private String productInfo;
}