package com.lohool.jproject.xwohi.po;

import javax.persistence.*;
/**
  * @hibernate.class  table="T_TaskFlow"  dynamic-update="true"  dynamic-insert="true"
  * <p>Copyright: Copyright (c) 2013</p>
  * <p>Company: lohool.com</p>
  * <p>mail:lohool@hotmail.com</p>
  * @author Xing BaoHui
  * @version 1.0
  * 
  */
@Entity
@Table(name="T_WorkFlow")
public class WorkFlow
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
        //@SequenceGenerator(name = "SEQ_TaskFlow_ID", allocationSize = 1, initialValue = 1, sequenceName = "SEQ_TaskFlow_ID")
        //@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_TaskFlow_ID")
	private int id;
	/*
	 * 节点名
	 */
	private String name;
        /*
         * 节点类型同，0--普通，1--IF分支
         */
        private int type;
	/*
	 * 节点类型
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	private WorkFlowType workFlowType;
	@Column(length=500)
	private String description;
	/*
	 * 步骤序号
	 */
	private int sequence;
	/*
	 * 如果是IF节点，批示下一节点
	 */
	private int next;
	/*
	 * 是否指定新处理人
	 */
	private int newProcessor;
        private String currentProcessor;
	/*
	 * 所属工单类别
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	private WorkOrderClass workorderClass;

	public void setId(int id)
	{
		this.id = id;
	}
	/**
	 * @hibernate.id  generator-class="native" column="id"
	 */
	public int getId( )
	{
		return this.id;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	/**
	  * @hibernate.property column="name"
	 */
	public String getName( )
	{
		return this.name;
	}
	public void setWorkFlowType(WorkFlowType WorkFlowType)
	{
		this.workFlowType = WorkFlowType;
	}
	/**
	* @hibernate.many-to-one
	*       class="WorkFlowProcessType"
	*       name="processType"
	*       column="processType"
	*       cascade="none"
	*       lazy="true"
	*       outer-join="false"
	 */
	public WorkFlowType getWorkFlowType( )
	{
		return this.workFlowType;
	}
	public void setDescription(String description)
	{
		this.description = description;
	}
	/**
	  * @hibernate.property column="description"
	 */
	public String getDescription( )
	{
		return this.description;
	}
	public void setSequence(int sequence)
	{
		this.sequence = sequence;
	}
	/**
	  * @hibernate.property column="sequence"
	 */
	public int getSequence( )
	{
		return this.sequence;
	}
	public void setNext(int next)
	{
		this.next = next;
	}
	/**
	  * @hibernate.property column="next"
	 */
	public int getNext( )
	{
		return this.next;
	}
	public void setNewProcessor(int newProcessor)
	{
		this.newProcessor = newProcessor;
	}
	/**
	  * @hibernate.property column="newProcessor"
	 */
	public int getNewProcessor( )
	{
		return this.newProcessor;
	}
	public void setWorkorderClass(WorkOrderClass workorderClass)
	{
		this.workorderClass = workorderClass;
	}
	/**
	* @hibernate.many-to-one
	*       class="WorkFlowClass"
	*       name="workorderClass"
	*       column="workorderClass"
	*       cascade="none"
	*       lazy="true"
	*       outer-join="false"
	 */
	public WorkOrderClass getWorkorderClass( )
	{
		return this.workorderClass;
	}

    /**
     * @return the type
     */
    public int getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(int type) {
        this.type = type;
    }

    /**
     * @return the currentProcessor
     */
    public String getCurrentProcessor()
    {
        return currentProcessor;
    }

    /**
     * @param currentProcessor the currentProcessor to set
     */
    public void setCurrentProcessor(String currentProcessor)
    {
        this.currentProcessor = currentProcessor;
    }
}
