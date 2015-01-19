/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lohool.jproject.xwohi.document.action;

import com.lohool.jproject.xwohi.po.Document;
import com.xwohi.framework.common.XWohiConfigration;
import com.xwohi.framework.common.dao.OperationManagement;
import com.xwohi.framework.common.mapping.XWohiActionMapping;
import com.xwohi.framework.common.security.po.Operator;
import com.xwohi.framework.common.service.DefaultService;
import java.io.File;
import java.util.Map;

/**
 *
 * @author wzvb9m
 */
public class DocumentDeleteService implements DefaultService
{
    private OperationManagement dao;
    private int state;
    public String execute(Object vo, Map parameters, String actionName, Class cls, XWohiActionMapping xwohi, Operator loginUser) throws Exception
    {
//        OperationManagementImpl omi = new OperationManagementImpl(Document.class);
        Document doc =(Document)vo;
        Document obj=(Document)getDao().load(Document.class,doc.getId() ) ;
        if(obj.getState() ==0)
        {
            obj.setState(getState());
            getDao().modify(Document.class,obj) ;
        }
        else
        {
            String fileName=obj.getFile();
            if(fileName !=null)
            {
                File file= new File(XWohiConfigration.TEMP_FILE_PATH +fileName);
                if(file.exists() )file.delete() ;
            }
            getDao().delete(Document.class,obj) ;
        }
//        omi.close() ;
        return "success";
    }



    public int getState()
    {
        return state;
    }

    public void setState(int state)
    {
        this.state = state;
    }

    public OperationManagement getDao()
    {
        return dao;
    }

    public void setDao(OperationManagement dao)
    {
        this.dao = dao;
    }

}
