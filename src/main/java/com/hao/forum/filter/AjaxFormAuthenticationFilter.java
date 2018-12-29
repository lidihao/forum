package com.hao.forum.filter;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.hao.forum.common.Msg;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.util.StringUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxFormAuthenticationFilter extends FormAuthenticationFilter {
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        String requestedWith = httpServletRequest.getHeader("X-Requested-With");
        if (!StringUtils.isEmpty(requestedWith) &&"XMLHttpRequest".equals(requestedWith)){
            httpServletResponse.setCharacterEncoding("UTF-8");
            httpServletResponse.setContentType("application/json");
            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(Msg.denied("未登录"));
            httpServletResponse.getWriter().write(json);
            return false;
        }else {
            return super.onAccessDenied(request,response);
        }
    }
}
