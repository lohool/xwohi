package com.lohool.sms.increment.po;

/**
  * @hibernate.class  table="t_ReceivedSMS"  dynamic-update="true"  dynamic-insert="true"
*/
public class ReceivedSMS{
	private long id;
	private String sender;
	private String mobile;
	private String recipient;
	private String content;
	private java.util.Date sendTime;

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
	public void setMobile(String mobile)
	{
		this.mobile = mobile;
	}
	/**
	  * @hibernate.property column="mobile"
	 */
	public String getMobile( )
	{
		return this.mobile;
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
	public void setSendTime(java.util.Date sendTime)
	{
		this.sendTime = sendTime;
	}
	/**
	  * @hibernate.property column="sendTime"
	 */
	public java.util.Date getSendTime( )
	{
		return this.sendTime;
	}
}
