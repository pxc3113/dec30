/** 
 * <pre>项目名称:java2021-12-28-x 
 * 文件名称:BookServiceImpl.java 
 * 包名:com.ytc.service.impl 
 * 创建日期:2021年12月28日下午2:05:46 
 * Copyright (c) 2021,  All Rights Reserved.</pre> 
 */  
package com.ytc.service.impl;

import java.util.List;

import com.ytc.mapper.BankMapper;
import com.ytc.model.*;
import com.ytc.service.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/** 
 * <pre>项目名称：java2021-12-28-x    
 * 类名称：BookServiceImpl    
 * 类描述：    
 * 创建人：zyl   
 * 创建时间：2021年12月28日 下午2:05:46    
 * 修改人：zyl 
 * 修改时间：2021年12月28日 下午2:05:46    
 * 修改备注：       
 * @version </pre>    
 */
@Service
public class BankServiceImpl implements BankService {

	@Autowired
	private BankMapper bankMapper;
	
	/* (non-Javadoc)    
	 * @see com.ytc.service.BookService#queryPageList()    
	 */
	@Override
	public List<Bank> getAll() {
		return bankMapper.getAll();
	}

}
