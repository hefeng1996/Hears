package com.hear.service;

import com.hear.dao.TagMapper;
import com.hear.entity.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class TagServiceImpl implements TagService {
    @Autowired
    private TagMapper tagMapper;
    @Override
    public List<Tag> selectSonglistTagById(int id) {
        return tagMapper.selectSonglistTagById(id);
    }
    @Override
    public List<Tag> selectAllTag() {
        return tagMapper.selectAllTag();
    }
}
