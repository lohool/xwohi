package com.lohool.jproject.xwohi.mail.action;

import com.xbreeze.framework.xwohi.common.action.AbstractAction;


//import com.lohool.jproject.util.*;


//import com.lohool.jproject.db.ConnectionBean;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class EraseMailAction extends AbstractAction
{
    String mailID;
    String mailBox;

    public String doExecute() throws java.lang.Exception
    {
//        if(mailID==null || mailID.trim() .equals("") )return SUCCESS;
//        if(mailBox==null || mailBox.trim() .equals("") )return SUCCESS;
//        Object vo=Class.forName("com.lohool.jproject.xwohi.mail.po."+mailBox) .newInstance() ;
//        mailID=mailID.trim();
//        System.out .println(mailID) ;
//        if(mailID.startsWith(","))mailID=mailID.substring(1) ;
//
//           String sql="select obj from "+mailBox+" obj where obj.id in("+mailID+")";
//
//           OperationManagementImpl omi = new OperationManagementImpl(vo.getClass() );
//           Collection list=omi.find(sql) ;
//           Object[] objs=list.toArray() ;
//           for(int i=0;i<objs.length ;i++)
//           {
//               Object mail=objs[i];
//               String attachFileName=((Mail)mail).getAttachFile();
//               if(attachFileName==null || attachFileName.trim() .equals("") )
//               {
//                   omi.delete(vo.getClass(),mail);
//               }
//               else
//               {
//                   File attarch = new File(Globals.TEMP_FILE_PATH + attachFileName);
//                   if(!attarch.exists() )omi.delete(vo.getClass(),mail);
//                   if (attarch.delete())
//                   {
//                       omi.delete(vo.getClass(),mail);
//                   }
//               }
//           }
//           omi.close() ;

        return SUCCESS;
    }
    public String getMailID()
    {
        return mailID;
    }
    public void setMailID(String mailID)
    {
        this.mailID = mailID;
    }
    public String getMailBox()
    {
        return mailBox;
    }
    public void setMailBox(String mailBox)
    {
        this.mailBox = mailBox;
    }

}
