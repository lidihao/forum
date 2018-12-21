package com.hao.forum.service;

import com.hao.forum.common.SysConstant;
import com.hao.forum.entity.dto.ImgResultDto;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ResourceUploadService {
    public ImgResultDto doUploadService(MultipartFile[] imgs,String contentPath){
        ImgResultDto dto = new ImgResultDto();
        List<String> urlData = new ArrayList<>(imgs.length);
        int index=0;
        for (MultipartFile img:imgs){
            String fileName = img.getOriginalFilename();
            String finalPath = contentPath + SysConstant.IMG_RES;
            String finalFileName = (new Date().getTime()) + Math.round(Math.random() * 1000) + fileName;
            File newFile = new File(finalPath + finalFileName);
            try {
                img.transferTo(newFile);
            } catch (IOException e) {
                e.printStackTrace();
                dto.setErrno(0);
            }
            urlData.add(SysConstant.Server_url+SysConstant.IMG_RES+finalFileName);
        }
        dto.setData(urlData);
        return dto;
    }
}
