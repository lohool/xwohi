/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lohool.jproject.xwohi.operator;


import com.lohool.jproject.xwohi.operator.po.Operator;
import com.xwohi.framework.common.service.Service;
import java.util.Collection;

/**
 *
 * @author wzvb9m
 */
public interface OperatorManagement extends Service
{

    /**
     * 验证用户的合法性
     * @param name - 用户名
     * @param pwd - 用户密码
     * @return 用户是否合法，返回为null时表示该用户为非法用户，返回非null时表示为
     * 合法用户且返回值为该用户的实例对象
     * @roseuid 41328DA70014
     */
    Operator authorize(String name, String pwd) throws Exception;

    /**
     * 验证用户是否具有某系统功能的使用权限
     * @param userID - 用户ID
     * @param limit - 权限代码
     * @return boolean
     * @roseuid 41329A4300A2
     */
    boolean authorize(int userID, int limit);

    /**
     * 根据操作员账号查找操作员
     * @param account 操作员账号
     * @return 操作员对象，如果不存在该操作员，则返回为null
     * @throws HibernateException
     */
    Operator findByAccount(String account) throws Exception;

    Collection findByPage(int page, int pageSize) throws Exception;

    /**
     * 是否存在某一操作员
     * @param account 操作员账号
     * @return
     * @throws HibernateException
     */
    boolean isExitAccount(String account) throws Exception;

    Operator load(int id) throws Exception;

    /**
     * 锁定操作员，使之暂时不能现登录系统
     * @param userID - 操作员ID
     * @roseuid 41328CA50225
     */
    void lock(int userID) throws Exception;

    void modify(Operator user) throws Exception;

    /**
     * 解锁被锁定的操作员
     * @param userID - 操作员ID
     * @roseuid 41328CEC0155
     */
    void unLock(int userID) throws Exception;

    void writeLoginLog(int userId, String account, String ip, int type, boolean isAccessed);

}
