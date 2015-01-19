package com.lohool.jproject.vrmall.po;

/**
  * @hibernate.class  table="t_adversement"  dynamic-update="true"  dynamic-insert="true"
*/
public class Advertisement{
	private int id;
	private String url;
	private String price;
	private com.lohool.jproject.vrmall.po.Shop shop;

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
	public void setUrl(String url)
	{
		this.url = url;
	}
	/**
	  * @hibernate.property column="url"
	 */
	public String getUrl( )
	{
		return this.url;
	}
	public void setPrice(String price)
	{
		this.price = price;
	}
	/**
	  * @hibernate.property column="price"
	 */
	public String getPrice( )
	{
		return this.price;
	}
	public void setShop(com.lohool.jproject.vrmall.po.Shop shop)
	{
		this.shop = shop;
	}
	/**
	* @hibernate.many-to-one
	*       class="com.lohool.jproject.vrmall.po.Shop"
	*       name="shop"
	*       column="shop"
	*       cascade="none"
	*       lazy="false"
	*       outer-join="false"
	 */
	public com.lohool.jproject.vrmall.po.Shop getShop( )
	{
		return this.shop;
	}
}
