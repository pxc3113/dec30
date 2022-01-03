/** 
 * <pre>项目名称:java2021-12-28-x 
 * 文件名称:BookService.java 
 * 包名:com.ytc.service 
 * 创建日期:2021年12月28日下午2:05:16 
 * Copyright (c) 2021,  All Rights Reserved.</pre> 
 */  
package com.ytc.service;


import com.ytc.model.*;

public interface CardService {

	Page getAll(Page page, Card card);
	int getTotalRows(Page page, Card card);
}
