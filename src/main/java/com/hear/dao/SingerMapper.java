package com.hear.dao;

import com.hear.entity.Singer;

import java.util.List;


public interface SingerMapper {
    List<Singer> selectSinger();

    List<Singer> selectMySinger1();

    List<Singer> selectMySinger2();

    List<Singer> selectChMaleSinger();

    List<Singer> selectChFemaleSinger();

    List<Singer> selectChBand();

    List<Singer> selectEngMaleSinger();

    List<Singer> selectEngFemaleSinger();

    List<Singer> selectEngBand();

    List<Singer> selectJkMaleSinger();

    List<Singer> selectJkFemaleSinger();

    List<Singer> selectJkBand();

    Singer selectSingerhost(int id);

    List<Singer> selectSimliarSinger(int id);
}
