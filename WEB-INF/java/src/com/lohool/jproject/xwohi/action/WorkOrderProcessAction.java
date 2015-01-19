/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lohool.jproject.xwohi.action;

import com.lohool.jproject.xwohi.operator.po.Operator;
import com.lohool.jproject.xwohi.po.WorkFlow;
import com.lohool.jproject.xwohi.po.WorkFlowProcess;
import com.lohool.jproject.xwohi.service.WorkFlowProcessService;
import com.xbreeze.framework.xwohi.common.action.AbstractAction;

/**
 *
 * @author xingbao-
 */
public class WorkOrderProcessAction extends AbstractAction{

    private int action;
    private int workorderId;
    private int workorderClassId;
    private WorkFlowProcess vo;
    private WorkFlow taskFlow;
    
    //for the action to add a call to an old workorder
    private String callInUniqueId;
    
    @javax.annotation.Resource
    private WorkFlowProcessService service;
    @Override
    public String doExecute() throws Exception 
    {
        if(vo==null)vo=new WorkFlowProcess();
        vo.setProcessor((Operator)getUser());
        if(getAction()==1)
        {
            getService().input(getWorkorderId(), getWorkorderClassId());
            setVo(getService().getCurrentStep());
            setTaskFlow(getService().getCurrentTaskFlow());
            return "show-info";
        }
        else if(getAction()==2)
        {
            
            getService().add(vo, getWorkorderId(),callInUniqueId);
            //not a new call linked to an old workorder
           if(service.getCurrentStep().getTaskFlowType()==1 && (callInUniqueId==null || callInUniqueId.trim().equals("")))
            {
                //auto start the next step
                return complete(service, getWorkorderId(), getWorkorderClassId());
            }
           else     return "saved";
        }
        else if(getAction()==3)
        {
                return complete(service,getWorkorderId(), getWorkorderClassId());
        }
        else if(getAction()==4)
        {
                service.terminate(getWorkorderId(), getWorkorderClassId());
                return "terminate";
        }
        return ERROR;
    }

    String complete(WorkFlowProcessService service,int workOrderId, int woClassId) throws Exception
    {
           service.complete(this.getVo(),workOrderId, woClassId);
            setVo(getService().getNextStep());
            setTaskFlow(getService().getCurrentTaskFlow());
            if(getTaskFlow().getNewProcessor()==1)return "choose-processor";
            else return "complete";
    }
    /**
     * @return the action
     */
    public int getAction() {
        return action;
    }

    /**
     * @param action the action to set
     */
    public void setAction(int action) {
        this.action = action;
    }

    /**
     * @return the workorderId
     */
    public int getWorkorderId() {
        return workorderId;
    }

    /**
     * @param workorderId the workorderId to set
     */
    public void setWorkorderId(int workorderId) {
        this.workorderId = workorderId;
    }

    /**
     * @return the workorderClassId
     */
    public int getWorkorderClassId() {
        return workorderClassId;
    }

    /**
     * @param workorderClassId the workorderClassId to set
     */
    public void setWorkorderClassId(int workorderClassId) {
        this.workorderClassId = workorderClassId;
    }

    /**
     * @return the vo
     */
    public WorkFlowProcess getVo() {
        return vo;
    }

    /**
     * @param vo the vo to set
     */
    public void setVo(WorkFlowProcess vo) {
        this.vo = vo;
    }

    /**
     * @return the taskFlow
     */
    public WorkFlow getTaskFlow() {
        return taskFlow;
    }

    /**
     * @param taskFlow the taskFlow to set
     */
    public void setTaskFlow(WorkFlow taskFlow) {
        this.taskFlow = taskFlow;
    }

    /**
     * @return the service
     */
    public WorkFlowProcessService getService() {
        return service;
    }

    /**
     * @param service the service to set
     */
    public void setService(WorkFlowProcessService service) {
        this.service = service;
    }

    /**
     * @return the callInUniqueId
     */
    public String getCallInUniqueId()
    {
        return callInUniqueId;
    }

    /**
     * @param callInUniqueId the callInUniqueId to set
     */
    public void setCallInUniqueId(String callInUniqueId)
    {
        this.callInUniqueId = callInUniqueId;
    }
    
}
