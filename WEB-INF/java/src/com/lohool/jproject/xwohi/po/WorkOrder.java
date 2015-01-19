package com.lohool.jproject.xwohi.po;

import com.lohool.jproject.xwohi.operator.po.Operator;
import com.xwohi.framework.util.StringUtil;
import com.xwohi.framework.util.TimeUtil;
import javax.persistence.*;

/**
 * @hibernate.class table="t_WorkOrder" dynamic-update="true"
 * dynamic-insert="true"
 * <p>
 * Copyright: Copyright (c) 2013</p>
 * <p>
 * Company: lohool.com</p>
 * <p>
 * mail:lohool@hotmail.com</p>
 * @author Xing BaoHui
 * @version 1.0
 *
 */
@Entity
@Table(name = "t_WorkOrder")
public class WorkOrder
{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    //@SequenceGenerator(name = "SEQ_WorkOrder_ID", allocationSize = 1, initialValue = 1, sequenceName = "SEQ_WorkOrder_ID")
    //@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_WorkOrder_ID")
    private int id;
    /*
     * 工单内容　
     */
    @Column(length = 3000)
    private String content;
    @Column(length = 3000)
    private String processLog;
    private java.sql.Timestamp createTime;
    @ManyToOne(fetch = FetchType.LAZY)
    private Operator creator;
    private java.sql.Timestamp updateTime;
    @ManyToOne(fetch = FetchType.LAZY)
    private Operator updator;
    private int state;
    private java.sql.Timestamp enterTime;
    @ManyToOne(fetch = FetchType.LAZY)
    private WorkOrderClass workorderClass;
    /*
     * 满意度
     */
    private String satisfaction;
    /*
     * 工单编码
     */
    private String code;
    
    /**
     * 工单唯一编码
     */
    private String UUID;

    public void setId(int id)
    {
        this.id = id;
    }

    /**
     * @hibernate.id generator-class="native" column="id"
     */
    public int getId()
    {
        return this.id;
    }

    public void setContent(String content)
    {
        this.content = content;
    }

    /**
     * @hibernate.property column="content"
     */
    public String getContent()
    {
        return this.content;
    }

    public void setCreateTime(java.sql.Timestamp createTime)
    {
        this.createTime = createTime;
    }

    /**
     * @hibernate.property column="createTime"
     */
    public java.sql.Timestamp getCreateTime()
    {
        return this.createTime;
    }

    public void setCreator(Operator creator)
    {
        this.creator = creator;
    }

    /**
     * @hibernate.many-to-one
     * class="com.lohool.jproject.crm.operator.po.Operator" name="creator"
     * column="creator" cascade="none" lazy="false" outer-join="false"
     */
    public Operator getCreator()
    {
        return this.creator;
    }

    public void setUpdateTime(java.sql.Timestamp updateTime)
    {
        this.updateTime = updateTime;
    }

    /**
     * @hibernate.property column="updateTime"
     */
    public java.sql.Timestamp getUpdateTime()
    {
        return this.updateTime;
    }

    public void setUpdator(Operator updator)
    {
        this.updator = updator;
    }

    /**
     * @hibernate.many-to-one
     * class="com.lohool.jproject.crm.operator.po.Operator" name="updator"
     * column="updator" cascade="none" lazy="false" outer-join="false"
     */
    public Operator getUpdator()
    {
        return this.updator;
    }

    public void setState(int state)
    {
        this.state = state;
    }

    /**
     * @hibernate.property column="state"
     */
    public int getState()
    {
        return this.state;
    }

    public void setEnterTime(java.sql.Timestamp enterTime)
    {
        this.enterTime = enterTime;
    }

    /**
     * @hibernate.property column="enterTime"
     */
    public java.sql.Timestamp getEnterTime()
    {
        return this.enterTime;
    }


    public void setCode(String code)
    {
        this.code = code;
    }

    /**
     * @hibernate.property column="code"
     */
    public String getCode()
    {
        return this.code;
    }


    public void setSatisfaction(String satisfaction)
    {
        this.satisfaction = satisfaction;
    }

    /**
     * @hibernate.property column="satisfaction"
     */
    public String getSatisfaction()
    {
        return this.satisfaction;
    }


    /**
     * @return the processLog
     */
    public String getProcessLog()
    {
        return processLog;
    }

    /**
     * @param processLog the processLog to set
     */
    public void setProcessLog(String processLog)
    {
        this.processLog = processLog;
    }
    private static int sequence = 1;
    public static String day = TimeUtil.currentTime("yyyy-MM-dd");

    public static String getAutoCode()
    {
        String code = "K-";
        code += TimeUtil.currentTime("yyMMdd-HHmmss");

        String today = TimeUtil.currentTime("yyyy-MM-dd");
        if (!today.equals(day))
        {
            day = today;
            sequence=1;
        }
        code += "-";
        code += StringUtil.format(sequence, 3);
        sequence=(sequence + 1);
        return code;
    }

    /**
     * @return the UUID
     */
    public String getUUID()
    {
        return UUID;
    }

    /**
     * @param UUID the UUID to set
     */
    public void setUUID(String UUID)
    {
        this.UUID = UUID;
    }

    /**
     * @return the workorderClass
     */
    public WorkOrderClass getWorkorderClass()
    {
        return workorderClass;
    }

    /**
     * @param workorderClass the workorderClass to set
     */
    public void setWorkorderClass(WorkOrderClass workorderClass)
    {
        this.workorderClass = workorderClass;
    }

}
