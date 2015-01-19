package com.lohool.jproject.vrmall.po;

/**
  * @hibernate.class  table="t_shelf"  dynamic-update="true"  dynamic-insert="true"
*/
public class Shelf{
    private int id;
    private String vrmlURL;
    private com.lohool.jproject.vrmall.po.Shop shop;
    private String name;
    private String rotation;
    private double z;
    private double y;
    private double x;
    private java.util.Set showcases;

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
    public void setShowcases(java.util.Set showcases)
    {
        this.showcases = showcases;
    }
    /**
    * @hibernate.set name="showcases" cascade="delete" inverse="false" lazy="true"
    * @hibernate.collection-key column="shelfid"
    * @hibernate.collection-one-to-many
    *       class="com.lohool.jproject.vrmall.po.Showcase"
    *       outer-join="false"
     */
    public java.util.Set getShowcases( )
    {
        return this.showcases;
    }
}
