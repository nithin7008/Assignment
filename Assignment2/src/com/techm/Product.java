package com.techm;

import java.io.Serializable;

public class Product implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 466948226599858669L;
	public Product(Long productId,String productName)
    {      
        this.setProductId(productId);
        this.setProductName(productName);
            }
	
	public Product() {
		
	}

	private Long productId;
    private String productName;
	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + "]";
	}

  
}

