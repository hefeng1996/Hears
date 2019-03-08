package com.hear.service;

import com.hear.dao.AdminMapper;
import com.hear.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public Admin adminLogin(String name) {
        return adminMapper.adminLogin(name);
    }
}
