package com.lohool.jproject.xwohi.mail.action;


import com.lohool.jproject.xwohi.mail.po.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import java.io.*;
import com.lohool.jproject.mailserver.message.*;
import at.jps.mailserver.*;
import com.xbreeze.framework.xwohi.common.action.PageListAbstractAction;
import com.xwohi.framework.common.security.po.Operator;
/**
 * <p>Title: </p>
 * <p>list maildir model mails</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class ListMailAction extends PageListAbstractAction
{
    private Object vo;

   //action's hibernate PO object instance
    private Collection objList=new ArrayList();

    String mailBox;
    public ListMailAction()
    {
    }
    public String doExecute() throws java.lang.Exception
    {
        Operator user=this.getUser() ;
        int currentPage=getPage();
        System.out.println(mailBox+currentPage);
        if(mailBox.equals("inbox")){
        ConfigurationManager configurationManager = ConfigurationManager.getDefaultInstance() ;

        MessageHandlerFile handle=new MessageHandlerFile(configurationManager);
        MailMessage[] mails=handle.getMessages(user.getAccount() ) ;

        this.setResultSize(mails.length ) ;
        int page=getPage();
        System.out .println(getPage()) ;
        System.out .println(getPageSize()) ;
        for(int i=page*getPageSize();i<(page+1)*getPageSize() && i<mails.length ;i++)
        {
            FileInputStream in = new FileInputStream(mails[i].getID().toString() );
            Session mailsession = Session.getInstance(System.getProperties(), null);
            MimeMessage mail = new MimeMessage(mailsession, in);

            InBox box = new InBox();
            box.setTitle(mail.getSubject());
            com.lohool.jproject.xwohi.operator.po.Operator op = new com.
                lohool.jproject.xwohi.operator.po.Operator();
            op.setAccount(mail.getFrom()[0].toString());
            box.setSender(op);
            box.setCreateTime(new java.sql.Timestamp(mail.getSentDate().
                getTime()));
            box.setIsRead(1);
            objList.add(box);
        }

        }
          return SUCCESS;

    }
    public String getMailBox()
    {
        return mailBox;
    }
    public void setMailBox(String mailBox)
    {
        this.mailBox = mailBox;
    }
    public Collection getObjList()
    {
        return objList;
    }
    public void setObjList(Collection objList)
    {
        this.objList = objList;
    }
    public Object getVo()
    {
        return vo;
    }
    public void setVo(Object vo)
    {
        this.vo = vo;
    }

}