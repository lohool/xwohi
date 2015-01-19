package com.lohool.jproject.vrmall.po;

/**
  * @hibernate.class  table="t_shoppinglog"  dynamic-update="true"  dynamic-insert="true"
*/
public class ShoppingLog{
	private int id;

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
}
