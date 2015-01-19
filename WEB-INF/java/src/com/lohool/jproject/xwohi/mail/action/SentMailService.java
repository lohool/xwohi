/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lohool.jproject.xwohi.mail.action;



import java.io.File;

import com.lohool.jproject.xwohi.mail.po.*;
import com.lohool.jproject.xwohi.operator.po.Operator;
import com.xwohi.framework.common.XWohiConfigration;
import com.xwohi.framework.common.dao.OperationManagement;
import com.xwohi.framework.common.service.Service;
import com.xwohi.framework.util.FileUtil;
//import com.lohool.jproject.util.*;
/**
 *
 * @author wzvb9m
 */
public class SentMailService implements Service
{
    private OperationManagement dao;
 public void execute(File file,InBox vo,Operator user,int receiverID) throws Exception
 {
     String receiveFileName=null;
            if (file != null)
            {
                String sentFileName=XWohiConfigration.TEMP_FILE_PATH +"mail_"+
                                   System.currentTimeMillis() + "_" +
                                   file.getName();
            File newFile=new File(sentFileName);
            file.renameTo(newFile);
            vo.setAttachFile(newFile.getName() ) ;
            receiveFileName="mail_sent_"+
                                   System.currentTimeMillis() + "_" +
                                   file.getName();
            FileUtil .copy(sentFileName, XWohiConfigration.TEMP_FILE_PATH +receiveFileName) ;
            }
            vo.setSender(user) ;

            Operator receiver=(Operator)getDao().load(Operator.class, receiverID);

            vo.setUser(receiver) ;

            vo.setCreateTime(new java.sql.Timestamp(System.currentTimeMillis() )) ;
            getDao().add(vo) ;

           OutBox outbox=new OutBox();
           outbox.setAttachFile(receiveFileName) ;
           outbox.setContent(vo.getContent() ) ;
           outbox.setCreateTime(vo.getCreateTime() ) ;
           outbox.setReceiver(vo.getUser() ) ;
           outbox.setTitle(vo.getTitle() ) ;
           outbox.setUser(vo.getSender() ) ;
           getDao().add(outbox) ;
           

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
