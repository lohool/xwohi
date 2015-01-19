package com.lohool.sms.increment;


import com.lohool.sms.increment.po.*;
import com.lohool.jsms.*;
import com.lohool.jsms.Message;
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

public class SMSDispatcherStub
    implements SMSDispatcher
{
    Service srv;
    boolean connected;
    protected DeviceInfo deviceInfo;


    public SMSDispatcherStub()
    {
        srv = new Service("com3", 9600);
    }

    public boolean connect()
    {
        if(connected)return true;
        srv.initialize();

        //	Set the phonebook.
        //	srv.setPhoneBook("../misc/phonebook.xml");
        //	Connect to GSM device.
        int status = srv.connect();
        System.out .println("connect status:"+status) ;
        //	Did we connect ok?
        if (status == Service.ERR_OK)
        {
            System.out .println("connected") ;
            //	Set the operation mode to PDU - default is ASCII.
            srv.setOperationMode(Service.MODE_PDU);

            // Set the SMSC number (set to default).
            srv.setSmscNumber("");

            //	Print out GSM device info...
            deviceInfo = srv.getDeviceInfo();
            connected=true;
            return true;
        }
        else
        {
            srv.disconnect() ;
            return false;
        }

    }
    public boolean isConnected()
    {
        return connected;
    }

    /**
     * ���Ͷ��ţ������Ƿ��ͳɹ�״̬
     * @param phone
     * @param msg
     * @return
     */
    public boolean send(String phone, String msg)
    {
        OutgoingMessage out = new OutgoingMessage(phone,msg);
        out.setMessageEncoding(Message.MESSAGE_ENCODING_UNICODE);
        if (srv.sendMessage(out) == Service.ERR_OK) return true;
        else return false;
    }

    /**
     * �������Ⱥ�����ţ����ط���ʧ�ܵĺ�������
     * @param phone
     * @param msg
     * @return
     */
    public String[] send(String[] phone, String msg)
    {
        return new String[0];
    }
    public List read()
    {
        LinkedList msgList = new LinkedList();
        if(connected)
        {
            if (srv.readMessages(msgList, CIncomingMessage.CLASS_ALL) !=Service. ERR_OK)
            {
                return new ArrayList();
            }
            //Collections.sort(msgList) ;
        }
		saveReceivedSMS(msgList);
        return msgList;
    }

	private void saveReceivedSMS(List msgs)
	{
        try
        {
			
//            OperationManagementImpl cusOmi = new OperationManagementImpl(Customer.class);
            OperationManagementImpl cusOmi = OperationManagementImpl.createInstance();
            Collection cuss = cusOmi.findAll(Customer.class);
			
            cusOmi.flush();
            cusOmi.close();
			
			Customer [] cus=(Customer[])cuss.toArray(new Customer[0]);
//            OperationManagementImpl omi = new OperationManagementImpl(ReceivedSMS.class);
            OperationManagementImpl omi = OperationManagementImpl.createInstance();
			for(int i=0;i<msgs.size();i++)
			{
				CIncomingMessage msg= (CIncomingMessage)msgs.get(i);
				String originator = msg.getOriginator();
				originator = originator.replaceAll("\\+86","");
				originator = originator.replaceAll("\\+","");
				msg.setOriginator(originator);
				saveReceivedSMS(omi,msg,getOwner(cus,msg.getOriginator()));
			}
            omi.flush();
            omi.close();

        }
        catch (Exception ex)
        {
			ex.printStackTrace();
        }

	}
	private void saveReceivedSMS(OperationManagementImpl omi,CIncomingMessage msg,String originatorName)
	{

        try
        {
            ReceivedSMS sms = new ReceivedSMS();
            String mobile = msg.getOriginator();
            sms.setMobile(mobile);
            sms.setSender(originatorName);
			sms.setSendTime(msg.getDate());
            sms.setContent(new String(msg.getText().getBytes(),"iso-8859-1"));
			omi.add(sms);
			delete(msg);

        }
        catch (Exception ex)
        {
			ex.printStackTrace();
        }
	}
	private String getOwner(Customer[] cus,String mobile)throws Exception
	{
		String owner="";
		Customer customer ;
		for(int i=0;i<cus.length;i++)
		{
			customer = cus[i];
			if(customer.getMobile().equals(mobile))
			{
				owner=customer.getName();
				break;
			}
		}
		owner=new String(owner.getBytes(),"iso-8859-1");
        return owner;
	}
    public void delete(int index)
    {
        srv.deleteMessage(index) ;
    }
	public void delete(CIncomingMessage msg)
    {
        srv.deleteMessage(msg) ;
    }
    public void delete()
    {

    }
    /**
     * �Ͽ��뷢���豸������
     */
    public void close()
    {
        srv.disconnect() ;
        connected=false;
    }

    public DeviceInfo getDeviceInfo()
    {
        return deviceInfo;
    }

}