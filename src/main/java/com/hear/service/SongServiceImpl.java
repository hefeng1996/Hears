package com.hear.service;

import com.hear.dao.SongMapper;
import com.hear.entity.Song;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class SongServiceImpl implements SongService {
    @Autowired
    private SongMapper songMapper;
    public List<Map<String, String>> parse(String path) {
        // 存储所有歌词信息的容器
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        try {
            // String encoding = "utf-8"; // 字符编码，若与歌词文件编码不符将会出现乱码
            String encoding = "GBK";
            File file = new File(path);
            if (file.isFile() && file.exists()) { // 判断文件是否存在
                InputStreamReader read = new InputStreamReader(
                        new FileInputStream(file), encoding);
                BufferedReader bufferedReader = new BufferedReader(read);
                String regex = "\\[(\\d{1,2}):(\\d{1,2}).(\\d{1,2})\\]"; // 正则表达式
                Pattern pattern = Pattern.compile(regex); // 创建 Pattern 对象
                String lineStr = null; // 每次读取一行字符串
                while ((lineStr = bufferedReader.readLine()) != null) {
                    Matcher matcher = pattern.matcher(lineStr);
                    while (matcher.find()) {
                        // 用于存储当前时间和文字信息的容器
                        Map<String, String> map = new HashMap<String, String>();
                        // System.out.println(m.group(0)); // 例：[02:34.94]
                        // [02:34.94] ----对应---> [分钟:秒.毫秒]
                        String min = matcher.group(1); // 分钟
                        String sec = matcher.group(2); // 秒
                        String mill = matcher.group(3); // 毫秒，注意这里其实还要乘以10
//                        long time = getLongTime(min, sec, mill + "0");
                        // 获取当前时间的歌词信息
                        String time = "["+min+":"+sec+"."+mill+"]";
                        String text = lineStr.substring(matcher.end());
                        map.put(time, text); // 添加到容器中
                        list.add(map);
                    }
                }
                read.close();
                return list;
            } else {
                System.out.println("找不到指定的文件:" + path);
            }
        } catch (Exception e) {
            System.out.println("读取文件出错!");
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public long getLongTime(String min, String sec, String mill) {
        // 转成整型
        int m = Integer.parseInt(min);
        int s = Integer.parseInt(sec);
        int ms = Integer.parseInt(mill);

        if (s >= 60) {
            System.out.println("警告: 出现了一个时间不正确的项 --> [" + min + ":" + sec + "."
                    + mill.substring(0, 2) + "]");
        }
        // 组合成一个长整型表示的以毫秒为单位的时间
        long time = m * 60 * 1000 + s * 1000 + ms;
        return time;
    }


    @Override
    public String printLrc(List<Map<String, String>> list) {
        if (list == null || list.isEmpty()) {
            System.out.println("没有任何歌词信息！");
        } else {
            String s="";
            for (Map<String, String> map : list) {
                for (Map.Entry<String, String> entry : map.entrySet()) {
                    s+=entry.getValue()+"<br>";
                }

            }
            return s;
        }
        return null;
    }

    @Override
    public String printLrc2(List<Map<String, String>> list) {
        if (list == null || list.isEmpty()) {
            System.out.println("没有任何歌词信息！");
        } else {
            String s="";
            for (Map<String, String> map : list) {
                for (Map.Entry<String, String> entry : map.entrySet()) {
                    s+=entry.getKey()+entry.getValue();
                }

            }
            return s;
        }
        return null;
    }
    @Override
    public List<Song> selectSongBySingerId(int id) {
        return songMapper.selectSongBySingerId(id);
    }

    @Override
    public List<Song> selectSongBySonglistId(int id) {
        return songMapper.selectSongBySonglistId(id);
    }

    @Override
    public List<Song> selectSongByAlbumId(int id) {
        return songMapper.selectSongByAlbumId(id);
    }

    @Override
    public Song selectSongById(int id) {
        return songMapper.selectSongById(id);
    }

    @Override
    public Song selectSongByIds(int id) {
        return songMapper.selectSongByIds(id);
    }

    @Override
    public List<Song> newSong() {
        return songMapper.newSong();
    }

    @Override
    public List<Song> hotSong() {
        return songMapper.hotSong();
    }

    @Override
    public List<Song> mySong() {
        return songMapper.mySong();
    }


}
