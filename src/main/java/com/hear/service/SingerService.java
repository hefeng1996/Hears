package com.hear.service;

import com.hear.entity.Singer;

import java.util.List;

public interface SingerService {
//    华语、欧美、日韩歌手分类显示
    public List<Singer> selectSinger();

    public List<Singer> selectMySinger1();

    public List<Singer> selectMySinger2();

    public List<Singer> selectChMaleSinger();

    public List<Singer> selectChFemaleSinger();

    public List<Singer> selectChBand();

    public List<Singer> selectEngMaleSinger();

    public List<Singer> selectEngFemaleSinger();

    public List<Singer> selectEngBand();

    public List<Singer> selectJkMaleSinger();

    public List<Singer> selectJkFemaleSinger();

    public List<Singer> selectJkBand();

    public Singer selectSingerhost(int id);

    public List<Singer> selectSimliarSinger(int id);

}
