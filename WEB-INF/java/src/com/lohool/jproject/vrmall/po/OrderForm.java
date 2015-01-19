package com.lohool.jproject.vrmall.po;

import com.xwohi.framework.common.security.po.LoginUser;
import com.xwohi.framework.common.security.po.Operator;


/**
  * @hibernate.class  table="t_orderform"  dynamic-update="true"  dynamic-insert="true"
*/
public class OrderForm  implements LoginUser{
	private int id;
	private com.lohool.jproject.vrmall.po.Goods goods;
	private com.lohool.sms.increment.po.Customer user;
	private int quantity;
	private double price;
	private String orderFormNumber;
    /**
     * ����״̬��0--�����¶���;1--�ѷ�������;2--���տ�;8--�˶�����
     */
    private int state;

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
    public void setUser(Operator user)
    {
        this.user = (com.lohool.sms.increment.po.Customer)user;
    }
	public void setUser(com.lohool.sms.increment.po.Customer user)
	{
		this.user = user;
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
	public void setPrice(double price)
	{
		this.price = price;
	}
	/**
	  * @hibernate.property column="price"
	 */
	public double getPrice( )
	{
		return this.price;
	}
	public void setOrderFormNumber(String orderFormNumber)
	{
		this.orderFormNumber = orderFormNumber;
	}
	/**
	  * @hibernate.property column="orderFormNumber"
	 */
	public String getOrderFormNumber( )
	{
		return this.orderFormNumber;
	}
    /**
      * @hibernate.property column="state"
     */
    public int getState()
    {
        return state;
    }
    public void setState(int state)
    {
        this.state = state;
    }
}
