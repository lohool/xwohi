package com.lohool.jproject.xwohi.po;
import com.lohool.jproject.xwohi.operator.po.*;
import com.xwohi.framework.common.security.po.LoginUser;
import java.sql.Timestamp;
/**
 * @hibernate.class  table="T_Document"  dynamic-update="true"  dynamic-insert="true"
 * <p>������ת</p>
 * <p>�����ϱ������� </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class Document implements LoginUser
{
    private int id;
    private String title;
    private String content;
    /**
     * ���ĸ���URL
     */
    private String file;
    /**
     * ������
     */
    private Operator taster;
    /**
     * �ϱ���
     */
    private Operator user;
    /**
     * �ϱ�ʱ��
     */
    private Timestamp createTime;
    /**
     * ����ʱ��
     */
    private Timestamp tasteTime;
    /**
     * ����״̬
     * 0--�·��ģ�����
     * 1--ת��������
     * 2--����ͨ��� ������
     * 3--����ͨ��ط�����
     */
    private int tasteState;
    /**
     * �������
     */
    private String tasteOpinion;
    /**
     * �ĵ�״̬
     * 0�����ѷ�
     * 1����������ɾ��
     * 2����������ɾ��
     */
    private int state;

    /**
     * �Ƿ�鵵���鵵״̬
     * 0--��ʼ״̬��δ��
     * 1--���鵵
     * 2--����鵵���鵵�ȴ���
     * 3--�ѹ鵵
     */
    private int pigeonhole;
    /**
     * �鵵˵��
     */
    private String pigeonholeDescription;
    /**
     * ������ת��־
     */
    private String workflowLog;

    public Document()
    {
    }
    /**
     * @hibernate.id  generator-class="native" length="8"
     * @return
     */

    public int getId()
    {
        return id;
    }
    public void setId(int id)
    {
        this.id = id;
    }
    /**
     * @hibernate.property length="255"
     * @return
     */

    public String getContent()
    {
        return content;
    }
    public void setContent(String content)
    {
        this.content = content;
    }
    /**
     * @hibernate.property
     * @return
     */

    public Timestamp getCreateTime()
    {
        return createTime;
    }
    public void setCreateTime(Timestamp createTime)
    {
        this.createTime = createTime;
    }
    /**
     * @hibernate.property length="50"
     * @return
     */

    public String getFile()
    {
        return file;
    }
    public void setFile(String file)
    {
        this.file = file;
    }
    /**
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.operator.po.Operator"
     *       name="user"
     *       column="tasterID"
     *       cascade="none"
     *       lazy="true"
     *       outer-join="false"
     */
    public Operator getTaster()
    {
        return taster;
    }
    public void setTaster(Operator taster)
    {
        this.taster = taster;
    }
    /**
     * @hibernate.property
     * @return
     */

    public Timestamp getTasteTime()
    {
        return tasteTime;
    }
    public void setTasteTime(Timestamp tasteTime)
    {
        this.tasteTime = tasteTime;
    }
    /**
     * @hibernate.property length="50"
     * @return
     */

    public String getTitle()
    {
        return title;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }
    /**
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.operator.po.Operator"
     *       name="user"
     *       column="userID"
     *       cascade="none"
     *       lazy="true"
     *       outer-join="false"
     */
    public Operator getUser()
    {
        return user;
    }
    public void setUser(Operator user)
    {
        this.user = user;
    }
    public void setUser(com.xwohi.framework.common.security.po.Operator user)
    {
        this.user = (Operator)user;
    }
    /**
     * @hibernate.property length="2" default-value="0"
     * @return
     */
    public int getState()
    {
        return state;
    }
    public void setState(int state)
    {
        this.state = state;
    }
    /**
     * @hibernate.property length="2" default-value="0"
     * @return
     */

    public int getPigeonhole()
    {
        return pigeonhole;
    }
    public void setPigeonhole(int pigeonhole)
    {
        this.pigeonhole = pigeonhole;
    }
    /**
     * @hibernate.property length="500"
     * @return
     */

    public String getPigeonholeDescription()
    {
        return pigeonholeDescription;
    }
    public void setPigeonholeDescription(String pigeonholeDescription)
    {
        this.pigeonholeDescription = pigeonholeDescription;
    }
    /**
     * @hibernate.property length="500"
     * @return
     */

    public String getWorkflowLog()
    {
        return workflowLog;
    }
    public void setWorkflowLog(String workflowLog)
    {
        this.workflowLog = workflowLog;
    }
    /**
     * @hibernate.property length="500"
     * @return
     */

    public String getTasteOpinion()
    {
        return tasteOpinion;
    }
    public void setTasteOpinion(String tasteOpinion)
    {
        this.tasteOpinion = tasteOpinion;
    }
    /**
     * @hibernate.property
     * @return
     */

    public int getTasteState()
    {
        return tasteState;
    }
    public void setTasteState(int tasteState)
    {
        this.tasteState = tasteState;
    }

}