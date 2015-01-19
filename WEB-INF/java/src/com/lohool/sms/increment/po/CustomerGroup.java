package com.lohool.sms.increment.po;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
  * @hibernate.class  table="t_CustomerGroup"  dynamic-update="true"  dynamic-insert="true"
*/
@Entity
@Table(name="t_CustomerGroup")
public class CustomerGroup{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String name;

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
}
