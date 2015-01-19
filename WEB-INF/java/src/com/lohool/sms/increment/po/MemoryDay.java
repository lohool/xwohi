package com.lohool.sms.increment.po;

/**
  * @hibernate.class  table="t_memoryday"  dynamic-update="true"  dynamic-insert="true"
*/
public class MemoryDay{
	private int id;
	private java.sql.Date memoryDay;
	private String name;
	private String description;

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
	public void setMemoryDay(java.sql.Date memoryDay)
	{
		this.memoryDay = memoryDay;
	}
	/**
	  * @hibernate.property column="memoryDay"
	 */
	public java.sql.Date getMemoryDay( )
	{
		return this.memoryDay;
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
}
