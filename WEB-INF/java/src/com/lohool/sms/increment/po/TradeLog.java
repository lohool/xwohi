package com.lohool.sms.increment.po;

/**
  * @hibernate.class  table="t_tradelog"  dynamic-update="true"  dynamic-insert="true"
*/
public class TradeLog{
	private int id;
	private String projectName;
	private int quantity;
	private com.lohool.sms.increment.po.Product product;
	private java.sql.Date tradeTime;
	private String projectAddress;
	private com.lohool.sms.increment.po.Customer customer;
	private String tradeSeq;

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
	public void setProjectName(String projectName)
	{
		this.projectName = projectName;
	}
	/**
	  * @hibernate.property column="projectName"
	 */
	public String getProjectName( )
	{
		return this.projectName;
	}
	public void setQuantity(int quantity)
	{
		this.quantity = quantity;
	}
	/**
	  * @hibernate.property column="quantity"
	 */
	public int getQuantity( )
	{
		return this.quantity;
	}
	public void setProduct(com.lohool.sms.increment.po.Product product)
	{
		this.product = product;
	}
	/**
	* @hibernate.many-to-one
	*       class="com.lohool.sms.increment.po.Product"
	*       name="product"
	*       column="productID"
	*       cascade="none"
	*       lazy="false"
	*       outer-join="true"
	 */
	public com.lohool.sms.increment.po.Product getProduct( )
	{
		return this.product;
	}
	public void setTradeTime(java.sql.Date tradeTime)
	{
		this.tradeTime = tradeTime;
	}
	/**
	  * @hibernate.property column="tradeTime"
	 */
	public java.sql.Date getTradeTime( )
	{
		return this.tradeTime;
	}
	public void setProjectAddress(String projectAddress)
	{
		this.projectAddress = projectAddress;
	}
	/**
	  * @hibernate.property column="projectAddress"
	 */
	public String getProjectAddress( )
	{
		return this.projectAddress;
	}
	public void setCustomer(com.lohool.sms.increment.po.Customer customer)
	{
		this.customer = customer;
	}
	/**
	* @hibernate.many-to-one
	*       class="com.lohool.sms.increment.po.Customer"
	*       name="customer"
	*       column="customerID"
	*       cascade="none"
	*       lazy="false"
	*       outer-join="true"
	 */
	public com.lohool.sms.increment.po.Customer getCustomer( )
	{
		return this.customer;
	}
	public void setTradeSeq(String tradeSeq)
	{
		this.tradeSeq = tradeSeq;
	}
	/**
	  * @hibernate.property column="tradeSeq"
	 */
	public String getTradeSeq( )
	{
		return this.tradeSeq;
	}
}
