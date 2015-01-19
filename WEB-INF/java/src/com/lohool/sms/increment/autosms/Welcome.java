package com.lohool.sms.increment.autosms;


import com.lohool.sms.increment.po.*;
import com.lohool.sms.increment.action.*;
import com.lohool.sms.increment.*;
import com.xbreeze.framework.thread.schedule.Program;
import com.xbreeze.framework.thread.schedule.Scheduler;
import com.xwohi.framework.common.dao.OperationManagementImpl;
import com.xwohi.framework.common.event.BussinessEvent;
import com.xwohi.framework.common.listener.Listener;
import com.xwohi.framework.util.Toolkit;
import java.util.*;

/**
 * <p>Title: </p>
 * <p>���¼������ҵ��Ա����ӭ����</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class Welcome extends Program implements Listener
{
	Customer customer;
    public Welcome()
    {
    }

    public void actionPerformed(BussinessEvent e)
    {
        Object obj=e.getSource() ;
		if(obj instanceof Customer)
		{
			customer = (Customer)obj;
		}
		Program program = Scheduler.getInstanceOf("com.lohool.sms.increment.autosms.Welcome");
		Toolkit .copyVOValue(program,this,null);
		execute();
    }
    public void execute()
    {
		if(customer != null)bless(customer);
    }
    /**
     * ��ͻ�����SMS
     * @param customer
     * @return
     */
    private boolean bless(Customer customer)
    {

        SendMessageAction sma = new SendMessageAction();
        SentSMS sms = new SentSMS();
        String msg=getSms();
        msg = msg.replaceAll("\\$NAME",customer.getName());
        msg = msg.replaceAll("\\$SEX",customer.getSex() ==1?"Mr.":"Mrs.") ;
        sms.setContent( msg) ;
        //sms.setOperator() ;
        sms.setRecipient(customer.getMobile()  ) ;
        //sms.setSender() ;
        sms.setType(1) ;
        try
        {
            SMSDispatcher dispatcher = SMSManager.getSMSDispatcher() ;
            System.out .println("is connected: "+dispatcher.isConnected() ) ;
            if(dispatcher.isConnected() && dispatcher.send(sms.getRecipient() ,sms.getContent() )  )
            {
                OperationManagementImpl omi = new OperationManagementImpl(SentSMS.class);
                omi.add(sms);
                omi.close();
                return true;
            }
            else
            {
                return false;
            }
        }
        catch (Exception ex)
        {
            ex.printStackTrace() ;
            return false;
        }
    }
}
