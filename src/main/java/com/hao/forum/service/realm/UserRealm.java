package com.hao.forum.service.realm;

import com.hao.forum.dao.rdbms.UserDao;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.Set;


public class UserRealm extends AuthorizingRealm {
    @Autowired
    private UserDao userDao;
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken upToken = (UsernamePasswordToken)token;
        String[] userInfo =userDao.queryPwByUserName(upToken.getUsername());
        if(userInfo==null){
            throw new UnknownAccountException("该帐号不存在");
        }
        if(Integer.valueOf(userInfo[2])==1){
            throw new LockedAccountException("该帐号被锁定");
        }
        Object principal=upToken.getUsername();
        ByteSource credentialsSalt=ByteSource.Util.bytes(userInfo[1]);
        Object credential=userInfo[0];
        SimpleAuthenticationInfo authenInfo = new SimpleAuthenticationInfo(principal,credential,credentialsSalt,getName());
        return authenInfo;
    }

    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        Object principal = principals.getPrimaryPrincipal();
        Set<String> roles = new HashSet<>();
        roles.add("user");
        int userType = userDao.queryRoleByUserName((String) principal);
        switch (userType){
            case 2:roles.add("boarduser");break;
            case 3:roles.add("admin");break;
            default:
        }
        return new SimpleAuthorizationInfo(roles);
    }
}
