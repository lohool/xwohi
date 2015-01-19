package com.lohool.jproject.vrmall.po;

/**
  * @hibernate.class  table="t_shop"  dynamic-update="true"  dynamic-insert="true"
*/
public class Shop{
	private int id;
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
