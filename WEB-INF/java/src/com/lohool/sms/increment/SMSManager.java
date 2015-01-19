package com.lohool.sms.increment;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class SMSManager
{
    private static SMSDispatcher dispatcher = new SMSDispatcherStub();
    private SMSManager()
    {
    }
    /*
    public static boolean connect()
    {
        return dispatcher.connect() ;
    }
    public static void close()
    {
        dispatcher.close() ;
    }

    public boolean send(String phone,String msg)
    {
        return dispatcher.send(phone,msg) ;
    }
    */
    public static SMSDispatcher getSMSDispatcher()
    {
        return dispatcher;
    }

}