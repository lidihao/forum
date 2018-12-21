package com.hao.forum.entity.dto;

import java.util.List;

public class ImgResultDto {
    private int  errno;//错误代码

    private List<String> data;//存放数据
    public ImgResultDto(){
    }

    public int getErrno() {
        return errno;
    }

    public void setErrno(int errno) {
        this.errno = errno;
    }

    public List<String> getData() {
        return data;
    }

    public void setData(List<String> data) {
        this.data = data;
    }
}
