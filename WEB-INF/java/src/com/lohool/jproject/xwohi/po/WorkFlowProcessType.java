package com.lohool.jproject.xwohi.po;

import com.lohool.jproject.xwohi.operator.po.Operator;
import javax.persistence.*;
/**
  * @hibernate.class  table="t_WorkOrderProcessType"  dynamic-update="true"  dynamic-insert="true"
  * <p>Copyright: Copyright (c) 2013</p>
  * <p>Company: lohool.com</p>
  * <p>mail:lohool@hotmail.com</p>
  * @author Xing BaoHui
  * @version 1.0
  * 
  */
@Entity
@Table(name="t_WorkFlowProcessType")
public class WorkFlowProcessType
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
        //@SequenceGenerator(name = "SEQ_WorkOrderProcessType_ID", allocationSize = 1, initialValue = 1, sequenceName = "SEQ_WorkOrderProcessType_ID")
        //@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_WorkOrderProcessType_ID")
	private int id;
	private String name;
	private String description;
	private java.sql.Timestamp createTime;
	@ManyToOne(fetch = FetchType.LAZY)
	private Operator creator;

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
	public void setCreateTime(java.sql.Timestamp createTime)
	{
		this.createTime = createTime;
	}
	/**
	  * @hibernate.property column="createTime"
	 */
	public java.sql.Timestamp getCreateTime( )
	{
		return this.createTime;
	}
	public void setCreator(Operator creator)
	{
		this.creator = creator;
	}
	/**
	* @hibernate.many-to-one
	*       class="com.lohool.jproject.crm.operator.po.Operator"
	*       name="creator"
	*       column="creator"
	*       cascade="none"
	*       lazy="false"
	*       outer-join="false"
	 */
	public Operator getCreator( )
	{
		return this.creator;
	}
}
