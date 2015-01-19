package com.lohool.jproject.xwohi.mail.po;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public interface Mail
{
    public String getAttachFile();
    public String getTitle();
    public void setTitle(String title);
    public String getContent();
    public void setContent(String content);

}