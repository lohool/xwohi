package com.lohool.sms.increment.po;

/**
  * @hibernate.class  table="t_sentSms"  dynamic-update="true"  dynamic-insert="true"
*/
public class SentSMS{
	private long id;
	private String sender;
	private String recipient;
	private String content;
	private java.sql.Date sendTime;
	private java.sql.Date sentTime;
	private com.lohool.jproject.xwohi.operator.po.Operator operator;
	private int type;

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
	public void setSender(String sender)
	{
		this.sender = sender;
	}
	/**
	  * @hibernate.property column="sender"
	 */
	public String getSender( )
	{
		return this.sender;
	}
	public void setRecipient(String recipient)
	{
		this.recipient = recipient;
	}
	/**
	  * @hibernate.property column="recipient"
	 */
	public String getRecipient( )
	{
		return this.recipient;
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
	public void setSendTime(java.sql.Date sendTime)
	{
		this.sendTime = sendTime;
	}
	/**
	  * @hibernate.property column="sendTime"
	 */
	public java.sql.Date getSendTime( )
	{
		return this.sendTime;
	}
	public void setSentTime(java.sql.Date sentTime)
	{
		this.sentTime = sentTime;
	}
	/**
	  * @hibernate.property column="sentTime"
	 */
	public java.sql.Date getSentTime( )
	{
		return this.sentTime;
	}
	public void setOperator(com.lohool.jproject.xwohi.operator.po.Operator operator)
	{
		this.operator = operator;
	}
	/**
	* @hibernate.many-to-one
	*       class="com.lohool.jproject.xwohi.operator.po.Operator"
	*       name="operator"
	*       column="operatorID"
	*       cascade="none"
	*       lazy="false"
	*       outer-join="true"
	 */
	public com.lohool.jproject.xwohi.operator.po.Operator getOperator( )
	{
		return this.operator;
	}
	public void setType(int type)
	{
		this.type = type;
	}
	/**
	  * @hibernate.property column="type"
	 */
	public int getType( )
	{
		return this.type;
	}
}
