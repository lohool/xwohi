package com.lohool.jproject.vrmall.po;

/**
  * @hibernate.class  table="t_showcase"  dynamic-update="true"  dynamic-insert="true"
*/
public class Showcase{
	private int id;
	private com.lohool.jproject.vrmall.po.Goods goods;
	private String rotation;
	private float xSize;
	private float ySize;
	private float zSize;
	private double x;
	private double y;
	private double z;
	private com.lohool.jproject.vrmall.po.Shelf shelf;

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
	public void setRotation(String rotation)
	{
		this.rotation = rotation;
	}
	/**
	  * @hibernate.property column="rotation"
	 */
	public String getRotation( )
	{
		return this.rotation;
	}
	public void setXSize(float xSize)
	{
		this.xSize = xSize;
	}
	/**
	  * @hibernate.property column="xSize"
	 */
	public float getXSize( )
	{
		return this.xSize;
	}
	public void setYSize(float ySize)
	{
		this.ySize = ySize;
	}
	/**
	  * @hibernate.property column="ySize"
	 */
	public float getYSize( )
	{
		return this.ySize;
	}
	public void setZSize(float zSize)
	{
		this.zSize = zSize;
	}
	/**
	  * @hibernate.property column="zSize"
	 */
	public float getZSize( )
	{
		return this.zSize;
	}
	public void setX(double x)
	{
		this.x = x;
	}
	/**
	  * @hibernate.property column="x"
	 */
	public double getX( )
	{
		return this.x;
	}
	public void setY(double y)
	{
		this.y = y;
	}
	/**
	  * @hibernate.property column="y"
	 */
	public double getY( )
	{
		return this.y;
	}
	public void setZ(double z)
	{
		this.z = z;
	}
	/**
	  * @hibernate.property column="z"
	 */
	public double getZ( )
	{
		return this.z;
	}
	public void setShelf(com.lohool.jproject.vrmall.po.Shelf shelf)
	{
		this.shelf = shelf;
	}
	/**
	* @hibernate.many-to-one
	*       class="com.lohool.jproject.vrmall.po.Shelf"
	*       name="shelf"
	*       column="shelfId"
	*       cascade="none"
	*       lazy="false"
	*       outer-join="false"
	 */
	public com.lohool.jproject.vrmall.po.Shelf getShelf( )
	{
		return this.shelf;
	}
}
