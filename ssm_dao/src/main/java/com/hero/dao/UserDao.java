package com.hero.dao;

import com.hero.domain.Cust;
import com.hero.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface UserDao {

    @Select("select * from s_user where username=#{username} and password=#{password}")
    User findByNameAndPwd(User user);

    @Select("select * from s_cust")
    List<Cust> findAllCust();

    @Insert("insert into s_cust values (null,#{cust_name},#{cust_type},#{cust_phone},#{cust_address},#{cust_link_user})")
    int addCust(Cust cust);



}
