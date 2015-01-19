package com.lohool.jproject.xwohi.document.action;


import com.lohool.jproject.xwohi.po.Document;
import com.xbreeze.framework.xwohi.common.action.AbstractAction;
import com.xwohi.framework.common.service.DefaultService;
import java.io.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class DocumentPigeonhole extends AbstractAction implements Serializable
{
    Document vo = new Document();
    private DefaultService service;
    public DocumentPigeonhole()
    {
    }
    public String doExecute() throws java.lang.Exception
    {
        getService().execute(vo, this.getParameterMap(), actionURL, Document.class, null, this.getUser());
        return SUCCESS;
    }
    private void writeObject(ObjectOutputStream oos) throws IOException
    {
        oos.defaultWriteObject();
    }
    private void readObject(ObjectInputStream ois) throws ClassNotFoundException, IOException
    {
        ois.defaultReadObject();
    }
    public Document getVo()
    {
        return vo;
    }
    public void setVo(Document vo)
    {
        this.vo = vo;
    }

    public DefaultService getService()
    {
        return service;
    }

    public void setService(DefaultService service)
    {
        this.service = service;
    }


}