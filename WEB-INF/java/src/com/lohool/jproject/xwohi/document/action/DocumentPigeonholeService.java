/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lohool.jproject.xwohi.document.action;


import com.lohool.jproject.xwohi.archive.po.Archive;
import com.lohool.jproject.xwohi.archive.po.ArchiveCatalogue;
import com.lohool.jproject.xwohi.po.Document;
import com.xwohi.framework.common.XWohiConfigration;
import com.xwohi.framework.common.dao.OperationManagement;
import com.xwohi.framework.common.mapping.XWohiActionMapping;
import com.xwohi.framework.common.security.po.Operator;
import com.xwohi.framework.common.service.DefaultService;
import com.xwohi.framework.util.FileUtil;
import java.io.File;
import java.util.Map;

/**
 *
 * @author wzvb9m
 */
public class DocumentPigeonholeService  implements DefaultService
{
private OperationManagement dao;
    public String execute(Object vo, Map parameters, String actionName, Class cls, XWohiActionMapping xwohi, Operator user) throws Exception
    {
//           OperationManagementImpl omi = new OperationManagementImpl(Document.class);
//        Operator user = (Operator)this.getUser();
        //String sql="update Document obj set obj.pigeonhole =3 where obj.id=?";
        Document doc= (Document)getDao().load(Document.class,((Document)vo).getId() ) ;
        doc.setPigeonhole(3) ;
        getDao().modify(Document.class,doc) ;
 
//        OperationManagementImpl omi2 = new OperationManagementImpl(Archive.class);
//        omi2.setSession(omi.getSession() ) ;
        Archive arc = new Archive();
        arc.setEditor(user.getAccount() ) ;
        arc.setTitle(doc.getTitle() ) ;
        arc.setContent(doc.getContent() ) ;
        arc.setCreateTime(new java.sql.Timestamp (System.currentTimeMillis() )) ;
        arc.setCatalogue(new ArchiveCatalogue()) ;
        if(doc.getFile() !=null && !doc.getFile() .trim() .equals("") )
        {
            File file = new File(XWohiConfigration.TEMP_FILE_PATH + doc.getFile());
            if(file.exists() )
            {
                String newFileName="arc_"+System.currentTimeMillis() +FileUtil.getExtension(file.getName() ) ;
                FileUtil.copy(XWohiConfigration.TEMP_FILE_PATH + doc.getFile(),XWohiConfigration.TEMP_FILE_PATH + newFileName);
                arc.setFile( newFileName);
            }
        }
        getDao().add(arc) ;
//        omi.close() ;
        return "success";

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
