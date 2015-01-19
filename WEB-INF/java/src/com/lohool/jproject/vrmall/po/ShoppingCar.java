package com.lohool.jproject.vrmall.po;

import com.xwohi.framework.common.security.po.LoginUser;
import com.xwohi.framework.common.security.po.Operator;

/**
  * @hibernate.class  table="t_shoppingcar"  dynamic-update="true"  dynamic-insert="true"
*/
public class ShoppingCar implements LoginUser{
	private int id;
	private com.lohool.jproject.vrmall.po.Goods goods;
	private com.lohool.sms.increment.po.Customer user;
	private int quantity;

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
	public void setGoods(com.lohool.jproject.vrmall.po.Goods goods)
	{
		this.goods = goods;
	}
	/**
	* @hibernate.many-to-one
	*       class="com.lohool.jproject.vrmall.po.Goods"
	*       name="goods"
	*       column="goods"
	*       cascade="none"
	*       lazy="false"
	*       outer-join="false"
	 */
	public com.lohool.jproject.vrmall.po.Goods getGoods( )
	{
		return this.goods;
	}
	public void setUser(com.lohool.sms.increment.po.Customer user)
	{
		this.user = user;
	}
    public void setUser(Operator user)
    {
        this.user = (com.lohool.sms.increment.po.Customer)user;
    }
	/**
	* @hibernate.many-to-one
	*       class="com.lohool.sms.increment.po.Customer"
	*       name="user"
	*       column="customer"
	*       cascade="none"
	*       lazy="false"
	*       outer-join="false"
	 */
	public com.lohool.sms.increment.po.Customer getUser( )
	{
		return this.user;
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
}
