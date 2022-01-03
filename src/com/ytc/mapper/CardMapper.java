package com.ytc.mapper;

import java.util.List;


import com.ytc.model.*;

import org.apache.ibatis.annotations.*;
import org.mybatis.spring.annotation.MapperScan;

public interface CardMapper {

    int getTotalRows(@Param("page") Page page,@Param("card") Card card);

    List<Card> getAll(@Param("page") Page page,@Param("card") Card card);

    // @Select("select c_password from t_card where c_number = #{number}")
    // String getPassword(String number, String password);

	// @Insert(value={
	// 	"insert into t_card "+
	// 	"(c_number,c_password) values (#{number},#{password});"
    // })
    // @SelectKey(keyProperty = "id",keyColumn = "c_id",before = false,resultType = Integer.class, statement = "select last_insert_id()")
    // public void add(Card company);


}
