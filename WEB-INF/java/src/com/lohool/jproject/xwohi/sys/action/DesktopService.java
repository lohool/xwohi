/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lohool.jproject.xwohi.sys.action;


import com.xwohi.framework.common.service.DefaultService;
import java.util.List;

/**
 *
 * @author wzvb9m
 */
public interface DesktopService extends DefaultService
{

    List getCalendarPlanList();

    List getNewMailList();

}
