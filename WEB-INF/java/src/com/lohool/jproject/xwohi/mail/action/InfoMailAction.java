package com.lohool.jproject.xwohi.mail.action;

import com.lohool.jproject.xwohi.mail.po.*;
import com.lohool.jproject.mailserver.message.*;
import com.xbreeze.framework.xwohi.common.action.BasicInfoAction;
import javax.mail.*;
import javax.mail.internet.*;
import java.io.*;
import java.util.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class InfoMailAction extends BasicInfoAction
{
    private List attachs;
    public InfoMailAction()
    {
    }
    public void finished()
    {
        Mail mail=(Mail)this.getVo() ;
        try
        {
            ByteArrayInputStream in = new ByteArrayInputStream(mail.getContent().
                getBytes());
            Session mailsession = Session.getInstance(System.getProperties(), null);
            MimeMessage mimeMail = new MimeMessage(mailsession, in);
            MimeMessageParser mmp = new MimeMessageParser(mimeMail);
            attachs = mmp.getAttachMent();
            mail.setContent( (String) mmp.getMailContent() );
        }
        catch (Exception ex)
        {
            ex.printStackTrace() ;
        }

    }
}