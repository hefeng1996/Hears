package com.hear.service;

import com.hear.dao.WarningMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WarningServiceImpl implements WarningService{
    @Autowired
    private WarningMapper warningMapper;
    @Override
    public String getNullInfoWaring() {
        return "Sorry，无此类信息";
    }
}
