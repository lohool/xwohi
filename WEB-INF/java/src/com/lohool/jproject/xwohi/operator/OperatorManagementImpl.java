package com.lohool.jproject.xwohi.operator;

/**
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: lohool.com</p>
 * <p>mail:lohool@hotmail.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */
import com.lohool.jproject.xwohi.operator.po.Operator;

//import com.lohool.jproject.xwohi.operator.po.SysLimit;
import com.xwohi.framework.common.dao.OperationManagement;
import java.util.*;
import java.util.logging.Level;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
//import net.sf.hibernate.*;

@Service
public class OperatorManagementImpl implements OperatorManagement
{

    private static final Class cls = Operator.class;
    @Resource
    private OperationManagement dao;
    
    Logger logger = Logger.getLogger(OperatorManagementImpl.class);

    /**
     * @roseuid 4132BD4B0133
     */
//    public OperatorManagementImpl()
//    {
////        setObjectClass(Operator.class);
//    }

    /**
     * 锁定操作员，使之暂时不能现登录系统
     * @param userID - 操作员ID
     * @roseuid 41328CA50225
     */
    public void lock(int userID) throws Exception
    {
        Operator user = (Operator) getDao().load(cls, userID);
        user.setState(2);
        getDao().modify(cls, user);
    }

    /**
     * 解锁被锁定的操作员
     * @param userID - 操作员ID
     * @roseuid 41328CEC0155
     */
    public void unLock(int userID) throws Exception
    {
        Operator user = (Operator) getDao().load(cls, userID);
        user.setState(1);
        getDao().modify(cls, user);

    }

    public void modify(Operator user) throws Exception
    {
        dao.beginTransaction();
        getDao().modify(cls, user);
        dao.endTransaction();

    }

    public Operator load(int id) throws Exception
    {
        Object obj = null;

        ArrayList parames = new ArrayList();
        parames.add(new Integer(id));
        List result = getDao().find("select op from Operator op where op.id=?", parames);
        if (result.size() > 0)
        {
            obj = result.get(0);
        }
        if (obj == null)
        {
            return null;
        } else
        {
            return (Operator) obj;
        }

    }

    /**
     * 根据操作员账号查找操作员
     * @param account 操作员账号
     * @return 操作员对象，如果不存在该操作员，则返回为null
     * @throws HibernateException
     */
    public Operator findByAccount(String account) throws Exception
    {
        Object obj = null;
//            Query query = getSession().createQuery(
//                "select op from Operator op where op.account=?");
//            query.setString(0, account);
//            obj = query.uniqueResult();
        ArrayList parames = new ArrayList();
        parames.add(account);
        List result = getDao().find("select op from Operator op where op.account=?", parames);
        if (result.size() > 0)
        {
            obj = result.get(0);
        }
        if (obj == null)
        {
            return null;
        } else
        {
            return (Operator) obj;
        }

    }

    public Collection findByPage(int page, int pageSize) throws Exception
    {
        String sql = "select op from Operator op order by id desc";
        return dao.findByPage(page, pageSize, sql);
    }

    /**
     * 是否存在某一操作员
     * @param account 操作员账号
     * @return
     * @throws HibernateException
     */
    public boolean isExitAccount(String account) throws Exception
    {
        Object user = findByAccount(account);
        if (user == null)
        {
            return false;
        } else
        {
            return true;
        }
    }

    /**
     * 验证用户的合法性
     * @param name - 用户名
     * @param pwd - 用户密码
     * @return 用户是否合法，返回为null时表示该用户为非法用户，返回非null时表示为
     * 合法用户且返回值为该用户的实例对象
     * @roseuid 41328DA70014
     */
    public Operator authorize(String name, String pwd) throws Exception
    {
        Operator user = findByAccount(name);
        if (user == null)
        {
            return null;
        }
        if (user.matchPassword(pwd))
        {
            return user;
        } else
        {
            return null;
        }

    }

    /**
     * 验证用户是否具有某系统功能的使用权限
     * @param userID - 用户ID
     * @param limit - 权限代码
     * @return boolean
     * @roseuid 41329A4300A2
     */
    public boolean authorize(int userID, int limit)
    {
        return false;
    }
    public void writeLoginLog(int userId,String account,String ip,int type,boolean isAccessed)
    {
        /*
        try
        {
            dao.beginTransaction();
        } catch (Exception ex)
        {
            ex.printStackTrace();
        }
        LoginHistory log= new LoginHistory();
        log.setAccount(account);
        log.setIp(ip);
        log.setLogTime(new java.sql.Timestamp(System.currentTimeMillis()));
        log.setType(type);
        if(userId>0)log.setOperator_id(userId);
        log.setState(isAccessed?1:0);
        try {
            dao.modify(LoginHistory.class, log);
        } catch (Exception ex) {
            ex.printStackTrace();
            
        }
        try
        {
            dao.endTransaction();
        } catch (Exception ex)
        {
            ex.printStackTrace();
        }
                */
    }

    public OperationManagement getDao()
    {
        return dao;
    }

    public void setDao(OperationManagement dao)
    {
        this.dao = dao;
    }
}
