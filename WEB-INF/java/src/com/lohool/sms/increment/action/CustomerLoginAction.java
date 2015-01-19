package com.lohool.sms.increment.action;
/**
 * <p>�û���¼ϵͳ��֤</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */
import com.opensymphony.xwork2.*;
import com.lohool.sms.increment.po.*;
import com.xwohi.framework.common.dao.OperationManagementImpl;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.struts2.ServletActionContext;


public class CustomerLoginAction
    extends ActionSupport
{
    public CustomerLoginAction()
    {
    }
    private String account;
    private String password;
    public String execute() throws Exception
    {
        Customer user = null;
        user = authorize(account, password);
        System.out .println(user);
        if (user != null)
        {
            if(user.getState() !=1)
            {
                super.addActionError("���û��ѱ�����ʱ����ʹ�ã�����ϵϵͳ����Ա") ;
                return INPUT;
            }
            else
            {
                HttpServletRequest request = 
                    ServletActionContext.getRequest();
                HttpSession session = request.getSession();
                //web session
                session.setAttribute("end_user", user);

                return SUCCESS;
            }
        }
        else
        {
            super.addActionError("�û�����������") ;
            return INPUT;
        }
    }
    /**
     * ��֤�û��ĺϷ���
     * @param name - �û���
     * @param pwd - �û�����
     * @return �û��Ƿ�Ϸ�������Ϊnullʱ��ʾ���û�Ϊ�Ƿ��û������ط�nullʱ��ʾΪ
     * �Ϸ��û��ҷ���ֵΪ���û���ʵ�����
     * @roseuid 41328DA70014
     */
    public Customer authorize(String name, String pwd)throws Exception
    {
//        OperationManagementImpl om = new OperationManagementImpl(Customer.class);
        OperationManagementImpl omi = OperationManagementImpl.createInstance();
        String sql="select op from Customer op where op.account=? and op.password=?";
        Object obj = null;
//            Query query = om.getSession().createQuery(sql);
//            query.setString(0, name);
//            query.setString(1, pwd);
//            obj = query.uniqueResult();
//            om.close() ;
        obj=omi.find(sql,new Object[]{name,pwd});
        if (obj == null)
        {
            return null;
        }
        else
        {
            return (Customer) obj;
        }
    }

    public String getAccount()
    {
        return account;
    }

    public void setAccount(String account)
    {
        this.account = account;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }
}
