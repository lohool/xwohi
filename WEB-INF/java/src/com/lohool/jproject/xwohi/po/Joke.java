package com.lohool.jproject.xwohi.po;

/**
  * @hibernate.class  table="t_joke"  dynamic-update="true"  dynamic-insert="true"
*/
public class Joke{
	private long id;
	private String title;
	private String content;
	private com.lohool.jproject.xwohi.po.JokeClass jokeClass;

	public void setId(long id)
	{
		this.id = id;
	}
	/**
	 * @hibernate.id  generator-class="native" column="id"
	 */
	public long getId( )
	{
		return this.id;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	/**
	  * @hibernate.property column="title"
	 */
	public String getTitle( )
	{
		return this.title;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	/**
	  * @hibernate.property column="content"
	 */
	public String getContent( )
	{
		return this.content;
	}
	public void setJokeClass(com.lohool.jproject.xwohi.po.JokeClass jokeClass)
	{
		this.jokeClass = jokeClass;
	}
	/**
	* @hibernate.many-to-one
	*       class="com.lohool.jproject.xwohi.po.JokeClass"
	*       name="jokeClass"
	*       column="classID"
	*       cascade="none"
	*       lazy="false"
	*       outer-join="false"
	 */
	public com.lohool.jproject.xwohi.po.JokeClass getJokeClass( )
	{
		return this.jokeClass;
	}
}
