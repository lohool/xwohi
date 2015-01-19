package com.lohool.jproject.xwohi.po;

import com.lohool.jproject.xwohi.operator.po.Operator;
import javax.persistence.*;
/**
  * @hibernate.class  table="t_WorkFlowProcess"  dynamic-update="true"  dynamic-insert="true"
  * <p>Copyright: Copyright (c) 2013</p>
  * <p>Company: lohool.com</p>
  * <p>mail:lohool@hotmail.com</p>
  * @author Xing BaoHui
  * @version 1.0
  * 
  */
@Entity
@Table(name="t_WorkFlowProcess")
public class WorkFlowProcess
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    //@SequenceGenerator(name = "SEQ_WorkFlowProcess_ID", allocationSize = 1, initialValue = 1, sequenceName = "SEQ_WorkFlowProcess_ID")
    //@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_WorkFlowProcess_ID")
        
	private int id;
	@ManyToOne(fetch = FetchType.LAZY)
	private WorkOrder workOrder;
	@ManyToOne(fetch = FetchType.LAZY)
	private WorkFlowProcessType processType;
	/*
	 * 主处理人
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	private Operator operator;
        
        /**
         * 当前过程记录操作人
         */
        @ManyToOne(fetch = FetchType.LAZY)
	private Operator processor;
	private java.sql.Timestamp processTime;
        
	/*
	 * 处理内容
	 */
        @Column(length=4000)
	private String content;
	private int taskFlowStep;
	/*
	 * 助理人
	 */
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "T_wop_assistants",
	joinColumns ={@JoinColumn(name = "WorkFlowProcess_id", referencedColumnName = "id", nullable = false)},
	inverseJoinColumns ={@JoinColumn(name = "Operator_id", referencedColumnName = "id", nullable = false)}
	)
	private java.util.Set<Operator> assistants;
	private int state;
	private int taskFlowType;
        /**
         * 1--通过，2--驳回
         */
        private int checkResult;
        
        /**
         * was exported to the protocol table. 0-- is not exported,1--was exported
         */
        private int isExported;
        private java.sql.Timestamp exportTime;
        private String dealerCode;
        
        /**
         * 0,1--system generated,2--manual processed
         */
        @Column(name="gen_type")
        private int genType;

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
	public void setWorkOrder(WorkOrder workOrder)
	{
		this.workOrder = workOrder;
	}
	/**
	* @hibernate.many-to-one
	*       class="WorkOrder"
	*       name="workOrder"
	*       column="workOrder"
	*       cascade="none"
	*       lazy="false"
	*       outer-join="false"
	 */
	public WorkOrder getWorkOrder( )
	{
		return this.workOrder;
	}
	public void setProcessType(WorkFlowProcessType processType)
	{
		this.processType = processType;
	}
	/**
	* @hibernate.many-to-one
	*       class="WorkFlowProcessType"
	*       name="processType"
	*       column="processType"
	*       cascade="none"
	*       lazy="false"
	*       outer-join="false"
	 */
	public WorkFlowProcessType getProcessType( )
	{
		return this.processType;
	}
	public void setOperator(Operator operator)
	{
		this.operator = operator;
	}
	/**
	* @hibernate.many-to-one
	*       class="Operator"
	*       name="processor"
	*       column="processor"
	*       cascade="none"
	*       lazy="false"
	*       outer-join="false"
	 */
	public Operator getOperator( )
	{
		return this.operator;
	}
	public void setProcessTime(java.sql.Timestamp processTime)
	{
		this.processTime = processTime;
	}
	/**
	  * @hibernate.property column="processTime"
	 */
	public java.sql.Timestamp getProcessTime( )
	{
		return this.processTime;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	/**
	  * @hibernate.property column="content"
	 */
	public String getContent( )
	{
		return this.content;
	}
	public void setTaskFlowStep(int taskFlowStep)
	{
		this.taskFlowStep = taskFlowStep;
	}
	/**
	  * @hibernate.property column=""
	 */
	public int getTaskFlowStep( )
	{
		return this.taskFlowStep;
	}
	public void setAssistants(java.util.Set<Operator> assistants)
	{
		this.assistants = assistants;
	}
	/**
	 */
	public java.util.Set<Operator> getAssistants( )
	{
		return this.assistants;
	}
	public void setState(int state)
	{
		this.state = state;
	}
	/**
	  * @hibernate.property column="state"
	 */
	public int getState( )
	{
		return this.state;
	}
	public void setTaskFlowType(int taskFlowType)
	{
		this.taskFlowType = taskFlowType;
	}
	/**
	  * @hibernate.property column="taskFlowType"
	 */
	public int getTaskFlowType( )
	{
		return this.taskFlowType;
	}

    /**
     * @return the checkResult
     */
    public int getCheckResult() {
        return checkResult;
    }

    /**
     * @param checkResult the checkResult to set
     */
    public void setCheckResult(int checkResult) {
        this.checkResult = checkResult;
    }

    /**
     * @return the genType
     */
    public int getGenType() {
        return genType;
    }

    /**
     * @param genType the genType to set
     */
    public void setGenType(int genType) {
        this.genType = genType;
    }

    /**
     * @return the processor
     */
    public Operator getProcessor()
    {
        return processor;
    }

    /**
     * @param processor the processor to set
     */
    public void setProcessor(Operator processor)
    {
        this.processor = processor;
    }

    /**
     * @return the isExported
     */
    public int getIsExported()
    {
        return isExported;
    }

    /**
     * @param isExported the isExported to set
     */
    public void setIsExported(int isExported)
    {
        this.isExported = isExported;
    }

    /**
     * @return the exportTime
     */
    public java.sql.Timestamp getExportTime()
    {
        return exportTime;
    }

    /**
     * @param exportTime the exportTime to set
     */
    public void setExportTime(java.sql.Timestamp exportTime)
    {
        this.exportTime = exportTime;
    }
	/**
	 * @return the dealerCode
	 */
	public String getDealerCode() {
		return dealerCode;
	}
	/**
	 * @param dealerCode the dealerCode to set
	 */
	public void setDealerCode(String dealerCode) {
		this.dealerCode = dealerCode;
	}
}
