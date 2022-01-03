package com.ytc.mapper;

import java.util.List;

import com.ytc.model.*;

import org.apache.ibatis.annotations.*;
public interface UserMapper {

    public static final String whereClause = "<where> 1=1 "+
	"<if test='book.id != \"\" and book.id != null' > and t_id = #{id}</if>"+
	"<if test='book.name != \"\" and book.name != null' > and userName like \'&{name}\'</if>"+
	"</where>";

    @Select("select * from t_user;")
    @Results(id="resultMap",value={
        @Result(property = "id",column="id"),
        @Result(property = "name",column="userName"),
        @Result(property = "password",column="userPwd"),
    })
    List<User> getAll(User user);

    @Select("select count(*) from t_user where userName = #{name}")
    @ResultMap("resultMap")
    int exists(String name);

    @Select("select userPwd from t_user where userName = #{name}")
    String getPassword(String name);

	@Insert(value={
		"insert into t_user "+
		"(userName,userPwd) values (#{name},#{password});"
    })
    @SelectKey(keyProperty = "id",keyColumn = "id",before = false,resultType = Integer.class, statement = "select last_insert_id()")
    public void add(User user);
}
