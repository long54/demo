package com.hero.service.impl;

import com.hero.dao.UserDao;
import com.hero.domain.Cust;
import com.hero.domain.User;
import com.hero.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public User findByNameAndPwd(User user) {

        return userDao.findByNameAndPwd(user);
    }

    public List<Cust> findAllCust() {

        return userDao.findAllCust();
    }

    public int addCust(Cust cust) {

        return userDao.addCust(cust);
    }
}
