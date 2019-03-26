package com.hear.dao;

import com.hear.entity.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PraiseMapper {
   List<Praise> getPraise(Integer mid);
   boolean insertPraise(Praise praise);
   boolean deletePraise(Integer pid);
}
