package com.lohool.jproject.xwohi.po;

/**
  * @hibernate.class  table="t_sysparam"  dynamic-update="true"  dynamic-insert="true"
*/
public class SysParam{
	private int id;
	private String name;
	private String sign;
	private String value;

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
	public void setSign(String sign)
	{
		this.sign = sign;
	}
	/**
	  * @hibernate.property column="sign"
	 */
	public String getSign( )
	{
		return this.sign;
	}
	public void setValue(String value)
	{
		this.value = value;
	}
	/**
	  * @hibernate.property column="value"
	 */
	public String getValue( )
	{
		return this.value;
	}
}
