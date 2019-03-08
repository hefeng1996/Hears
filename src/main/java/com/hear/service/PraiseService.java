package com.hear.service;

import com.github.pagehelper.PageInfo;
import com.hear.entity.*;

import java.util.List;
import java.util.Map;

public interface PraiseService {
    public List<Praise> getPraise(Integer mid);
    public boolean insertPraise(Praise praise);
    public boolean deletePraise(Integer pid);


}
