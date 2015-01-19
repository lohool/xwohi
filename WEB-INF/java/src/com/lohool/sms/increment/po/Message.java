package com.lohool.sms.increment.po;

/**
  * @hibernate.class  table="t_message"  dynamic-update="true"  dynamic-insert="true"
*/

public class Message{
	private int id;
	private String content;
	private com.lohool.sms.increment.po.MessageGroup group;

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
	public void setGroup(com.lohool.sms.increment.po.MessageGroup group)
	{
		this.group = group;
	}
	/**
	* @hibernate.many-to-one
	*       class="com.lohool.sms.increment.po.MessageGroup"
	*       name="group"
	*       column="groupid"
	*       cascade="none"
	*       lazy="false"
	*       outer-join="true"
	 */
	public com.lohool.sms.increment.po.MessageGroup getGroup( )
	{
		return this.group;
	}
}
