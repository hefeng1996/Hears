package com.hear.dao;

import com.hear.entity.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PraiseMapper {
   public List<Praise> getPraise(Integer mid);
   public boolean insertPraise(Praise praise);
   public boolean deletePraise(Integer pid);
}
