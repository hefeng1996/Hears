package com.hear.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hear.dao.AllMapper;
import com.hear.dao.PraiseMapper;
import com.hear.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PraiseServiceImpl implements PraiseService {
@Autowired
private PraiseMapper praiseMapper;
    @Override
    public List<Praise> getPraise(Integer mid) {
        return praiseMapper.getPraise(mid);
    }
    @Override
    public boolean insertPraise(Praise praise) {
        return praiseMapper.insertPraise(praise);
    }
    @Override
    public boolean deletePraise(Integer pid) {
        return praiseMapper.deletePraise(pid);
    }
}
