package com.hero.service;

import com.hero.domain.Cust;
import com.hero.domain.User;

import java.util.List;

public interface UserService {

    public User findByNameAndPwd(User user);
    public List<Cust> findAllCust();
    public int addCust(Cust cust);
}
