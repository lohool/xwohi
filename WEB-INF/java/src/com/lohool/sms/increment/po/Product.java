package com.lohool.sms.increment.po;

/**
  * @hibernate.class  table="t_Product"  dynamic-update="true"  dynamic-insert="true"
*/
public class Product{
	private int id;
	private String name;

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
}
