
package com.lohool.jproject.xwohi.operator;

import java.util.*;

import com.lohool.jproject.xwohi.operator.po.Privilege;
import com.xwohi.framework.common.dao.OperationManagementImpl;

/**
 *
 * <p>后台系统操作安全判定</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: lohool.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */
public class Security implements com.xwohi.framework.common.security.Security
{

    public static List ACTION_URLS;
    /**
     * @roseuid 412E930700AE
     */
    public Security()
    {

    }

    /**
     * 验证用户是否有使用系统功能的权限
     * @param userID - 用户ID
     * @param limitCode - 欲验证的系统功能权限编码
     * @return boolean
     * @roseuid 412E889D0371
     */
    public boolean isAccess(int userID, String limitCode)
    {
        return true;
    }

    /**
     * 验证用户是否有使用系统功能的权限
     * @param userID - 用户ID
     * @param limitCodes - 欲验证的用户的多个权限代码数组
     * @return boolean
     * @roseuid 412E89A302A5
     */
    public boolean isAccess(int userID, String[] limitCodes)
    {
        return true;
    }
/*
    public static boolean isAccess(Operator operator, String resURL)
    {
        Object[] roles=operator.getRoles().toArray()  ;
        for(int i=0;i<roles.length ;i++)
        {
            Role role= (Role)roles[i];
            if(role.hasPrivilege(resURL) )return true;
        }
        return false;
    }
*/
    /**
     * 验证用户的合法性
     * @param name - 用户名
     * @param pwd - 用户密码
     * @return 用户是否合法，返回为null时表示该用户为非法用户，返回非null时表示为
     * 合法用户且返回值为该用户的实例对象
     * @roseuid 41328DA70014
     */
    /*
    public Operator isAccess(String name, String pwd)throws Exception
    {
        OperatorManagement om =new OperatorManagement();
        return om.authorize(name,pwd) ;
    }
*/

    /**
     * 列出系统中的所有权限
     * @return Collection
     * @roseuid 412E8A9202D1
     */
    public Collection listLimits()
    {
        return null;
    }

    /**
     * 列出指定用户所具有的所有系统权限
     * @param userID - 用户ID
     * @return Collection
     * @roseuid 412E8AD901F7
     */
    public Collection userLimits(int userID)
    {
        return null;
    }

    public boolean isSecurityURL(String url)
    {
        if(ACTION_URLS==null)
        {
            try
            {
//                OperationManagementImpl omi = new OperationManagementImpl(Privilege.class);
                OperationManagementImpl omi = OperationManagementImpl.createInstance();
                ACTION_URLS = omi.findAll(Privilege.class);
                omi.close();
            }
            catch (Exception ex)
            {
            }
        }
        for(int i=0;i<ACTION_URLS.size() ;i++)
        {
            Privilege privilege=(Privilege)ACTION_URLS.get(i) ;
            if(privilege.getUrl() .trim() .equals(url.trim() ))return true;
        }
        return false;
    }

}
