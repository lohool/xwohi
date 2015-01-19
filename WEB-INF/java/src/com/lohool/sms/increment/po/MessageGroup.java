package com.lohool.sms.increment.po;

/**
  * @hibernate.class  table="t_MessageGroup"  dynamic-update="true"  dynamic-insert="true"
*/

public class MessageGroup{
	private int id;
	private String title;
	private java.util.Set smses;

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
	public void setTitle(String title)
	{
		this.title = title;
	}
	/**
	  * @hibernate.property column="title"
	 */
	public String getTitle( )
	{
		return this.title;
	}
	public void setSmses(java.util.Set smses)
	{
		this.smses = smses;
	}

	/**
	* @hibernate.set name="smses" cascade="all" inverse="false" lazy="true"
	* @hibernate.collection-key column="groupid"
	* @hibernate.collection-one-to-many
	*       class="com.lohool.sms.increment.po.Message"
	*       outer-join="false"
	 */
	public java.util.Set getSmses( )
	{
		return this.smses;
	}
}
