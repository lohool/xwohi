package com.lohool.jproject.xwohi.mail.action;

import com.xbreeze.framework.xwohi.common.action.AbstractAction;




/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class DeleteMailAction extends AbstractAction
{
    String mailID;
    public DeleteMailAction()
    {
    }
    public String doExecute() throws java.lang.Exception
    {
        mailID=mailID.trim();
        System.out .println(mailID) ;
           if(mailID.startsWith(","))mailID=mailID.substring(1) ;
           String[] mailIDs = mailID .split(",");

           int[] iUsersID = new int[mailIDs.length];
           for (int i = 0; i < mailIDs.length; i++)
           {
               iUsersID[i] = Integer.parseInt(mailIDs[i].trim());
           }
           String sql="insert into t_trashBox select * from t_inBox where id in("+mailID+")";
           String delSql="delete from t_inBox where id in("+mailID+")";
//           OperationManagementImpl omi = new OperationManagementImpl(InBox.class);
//           omi.executeUpdate(delSql);
//           omi.executeUpdate(sql);

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

}