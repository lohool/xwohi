package com.lohool.jproject.vrmall.po;

/**
  * @hibernate.class  table="t_goodsclass"  dynamic-update="true"  dynamic-insert="true"
*/
public class GoodsClass{
	private int id;
	private String name;
	private com.lohool.jproject.vrmall.po.GoodsClass parent;

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
	public void setParent(com.lohool.jproject.vrmall.po.GoodsClass parent)
	{
		this.parent = parent;
	}
	/**
	* @hibernate.many-to-one
	*       class="com.lohool.jproject.vrmall.po.GoodsClass"
	*       name="parent"
	*       column="parent"
	*       cascade="none"
	*       lazy="false"
	*       outer-join="false"
	 */
	public com.lohool.jproject.vrmall.po.GoodsClass getParent( )
	{
		return this.parent;
	}
}
