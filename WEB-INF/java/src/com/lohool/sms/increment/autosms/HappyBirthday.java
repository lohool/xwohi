package com.lohool.sms.increment.autosms;


import com.lohool.sms.increment.po.*;
import com.lohool.sms.increment.action.*;
import com.lohool.sms.increment.*;
import com.xbreeze.framework.thread.schedule.Program;
import com.xwohi.framework.common.dao.OperationManagementImpl;
import java.util.*;


/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class HappyBirthday extends Program
{
    public HappyBirthday()
    {
    }
    public void execute()
    {
        //����ݿ����г����пͻ�


//        OperationManagementImpl omi = new OperationManagementImpl(Customer.class);
        OperationManagementImpl omi = OperationManagementImpl.createInstance();
        Object[] customers = null;
        try
        {
            customers = omi.findAll(Customer.class).toArray();
        }
        catch (Exception ex)
        {
            ex.printStackTrace() ;
            return;
        }
        for(int i=0;i<customers.length ;i++)
        {
            System.out .println(i) ;
            Customer customer=(Customer)customers[i];
            Date birthday =customer.getBirthday() ;
            Calendar bcal=Calendar.getInstance() ;
            bcal.setTime(birthday) ;

            Calendar ccal=Calendar.getInstance() ;
			//�������ǿͻ����գ���������ף������
            if(bcal.get(Calendar.MONTH ) == ccal .get(Calendar.MONTH  )
              && bcal.get(Calendar.DAY_OF_MONTH) == ccal.get(Calendar.DAY_OF_MONTH )
               )
            {
                bless(customer);
            }
        }
    }
    /**
     * ��ͻ�����SMS
     * @param customer
     * @return
     */
    private boolean bless(Customer customer)
    {
        System.out .println("happy:"+new Date()) ;
        //return true;

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