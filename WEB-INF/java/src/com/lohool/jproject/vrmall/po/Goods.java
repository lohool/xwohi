package com.lohool.jproject.vrmall.po;

/**
  * @hibernate.class  table="t_goods"  dynamic-update="true"  dynamic-insert="true"
*/
public class Goods{
	private int id;
	private String quantity;
	private String vrmlURL;
	private float xSize;
	private float ySize;
	private float zSize;
	private com.lohool.jproject.vrmall.po.GoodsClass goodsClass;
	private String name;
	private float price;
	private String description;
	private int views;
	private int buys;
	private String pic;
	private String producer;
	private java.util.Set showcase;

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
	public void setQuantity(String quantity)
	{
		this.quantity = quantity;
	}
	/**
	  * @hibernate.property column="quantity"
	 */
	public String getQuantity( )
	{
		return this.quantity;
	}
	public void setVrmlURL(String vrmlURL)
	{
		this.vrmlURL = vrmlURL;
	}
	/**
	  * @hibernate.property column="vrmlURL"
	 */
	public String getVrmlURL( )
	{
		return this.vrmlURL;
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
	public void setGoodsClass(com.lohool.jproject.vrmall.po.GoodsClass goodsClass)
	{
		this.goodsClass = goodsClass;
	}
	/**
	* @hibernate.many-to-one
	*       class="com.lohool.jproject.vrmall.po.GoodsClass"
	*       name="goodsClass"
	*       column="goodsClass"
	*       cascade="none"
	*       lazy="false"
	*       outer-join="false"
	 */
	public com.lohool.jproject.vrmall.po.GoodsClass getGoodsClass( )
	{
		return this.goodsClass;
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
	public void setPrice(float price)
	{
		this.price = price;
	}
	/**
	  * @hibernate.property column="price"
	 */
	public float getPrice( )
	{
		return this.price;
	}
	public void setDescription(String description)
	{
		this.description = description;
	}
	/**
	  * @hibernate.property column="description"
	 */
	public String getDescription( )
	{
		return this.description;
	}
	public void setViews(int views)
	{
		this.views = views;
	}
	/**
	  * @hibernate.property column="views"
	 */
	public int getViews( )
	{
		return this.views;
	}
	public void setBuys(int buys)
	{
		this.buys = buys;
	}
	/**
	  * @hibernate.property column="buys"
	 */
	public int getBuys( )
	{
		return this.buys;
	}
	public void setPic(String pic)
	{
		this.pic = pic;
	}
	/**
	  * @hibernate.property column="pic"
	 */
	public String getPic( )
	{
		return this.pic;
	}
	public void setProducer(String producer)
	{
		this.producer = producer;
	}
	/**
	  * @hibernate.property column="producer"
	 */
	public String getProducer( )
	{
		return this.producer;
	}
	public void setShowcase(java.util.Set showcase)
	{
		this.showcase = showcase;
	}
	/**
	* @hibernate.set name="showcase" cascade="none" inverse="false" lazy="false"
	* @hibernate.collection-key column="id"
	* @hibernate.collection-one-to-many
	*       class="com.lohool.jproject.vrmall.po.Showcase"
	*       outer-join="false"
	 */
	public java.util.Set getShowcase( )
	{
		return this.showcase;
	}

        public boolean equals(Object obj)
        {
            if (! (obj instanceof Goods))
                return false;
            Goods c = (Goods) obj;
            return c.getId() ==id;
        }

        public int hashCode()
        {
            return id;
        }

}
