package com.hao.forum.controller;

import com.hao.forum.entity.dto.ImgResultDto;
import com.hao.forum.service.ResourceUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ResoureController {
    @Autowired
    private ResourceUploadService uploadService;


    @RequestMapping("/img/upload")
    @ResponseBody
    public ImgResultDto uploadImg(@RequestParam("img")MultipartFile[] imgList, HttpServletRequest request){
        String contextPath = request.getServletContext().getRealPath("");
        return uploadService.doUploadService(imgList,contextPath);
    }
}
