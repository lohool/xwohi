package com.lohool.sms.increment;

import com.lohool.jsms.DeviceInfo;
import java.util.*;

/**
 * <p>短信发送器</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */
public interface SMSDispatcher
{

    /**
     * 连接短信发送设备，连接成功返回true,否则返回false
     * @return
     */
    public boolean connect();

    public boolean isConnected();

    /**
     * 发送短信，返回是否发送成功状态
     * @param phone
     * @param msg
     * @return
     */
    public boolean send(String phone, String msg);

    /**
     * 向号码组群发短信，返回发送失败的号码数组
     * @param phone
     * @param msg
     * @return
     */
    public String[] send(String[] phone, String msg);

    /**
     * 读取SMS设备短信信息
     * @return
     */
    public List read();

    /**
    删除指定序号的短信
     */
    public void delete(int index);

    /**
    删除所有短信
     */
    public void delete();

    /**
     * 断开与发送设备的连接
     */
    public void close();

    public DeviceInfo getDeviceInfo();
}
