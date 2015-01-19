package com.lohool.jproject.xwohi.po;

/**
  * @hibernate.class  table="t_jokeclass"  dynamic-update="true"  dynamic-insert="true"
*/
public class JokeClass{
	private long id;
	private String name;

	public void setId(long id)
	{
		this.id = id;
	}
	/**
	 * @hibernate.id  generator-class="native" column="id"
	 */
	public long getId( )
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
