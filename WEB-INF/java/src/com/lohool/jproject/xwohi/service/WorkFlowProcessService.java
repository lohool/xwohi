/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lohool.jproject.xwohi.service;


import com.lohool.jproject.xwohi.po.WorkFlow;
import com.lohool.jproject.xwohi.po.WorkFlowProcess;
import com.lohool.jproject.xwohi.po.WorkFlowType;

import com.lohool.jproject.xwohi.po.WorkOrder;
import com.lohool.jproject.xwohi.po.WorkOrderClass;
import com.xwohi.framework.common.dao.OperationManagement;
import com.xwohi.framework.common.service.Service;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.apache.log4j.Logger;

/**
 *
 * @author xingbao-
 */
@org.springframework.stereotype.Service
public class WorkFlowProcessService implements Service {

    @javax.annotation.Resource
    private OperationManagement dao;
    Logger log = Logger.getLogger(WorkFlowProcessService.class);
    private WorkFlow currentTaskFlow;
    private WorkFlowProcess currentStep;
    private WorkFlowProcess nextStep;

    /**
     * create new work order, init the create step
     *
     * @param workorderId
     * @param woClassId
     * @param currentStep
     * @param user
     * @throws Exception
     */
    public void create(WorkOrder workorder) throws Exception {
        //dao.beginTransaction();
        WorkFlowProcess vo = new WorkFlowProcess();
        WorkOrderClass woc = (WorkOrderClass) dao.load(WorkOrderClass.class, workorder.getWorkorderClass().getId());
        ArrayList params = new ArrayList();
        params.add(woc.getRootClassId());
        System.out.println("wo class id=" + woc.getRootClassId());
        List TaskFlows = getDao().find("select obj from WorkFlow obj where obj.workorderClass.id=? and obj.sequence=1 order by sequence asc", params);
        WorkFlow task = null;
        if (TaskFlows.size() > 0) {
            task = (WorkFlow) TaskFlows.get(0);
        }

        vo.setOperator(workorder.getCreator());
        vo.setWorkFlowType(task.getWorkFlowType());
        //WorkOrder wo=new WorkOrder();
        //wo.setId(workorderId);
        vo.setWorkOrder(workorder);
        vo.setProcessor(workorder.getCreator());
        vo.setProcessTime(new java.sql.Timestamp(System.currentTimeMillis()));
        vo.setContent(task.getName());
        vo.setTaskFlowStep(task.getSequence());
        vo.setState(0);
        vo.setGenType(1);
        //close work order directly
        if(workorder.getState()==2)
        {
            this.terminate(workorder.getId(), woc.getRootClassId());
        }

        getDao().add( vo);
        currentStep = vo;
        currentTaskFlow = task;
        //dao.endTransaction();
    }

    /**
     * provide data to the window which is used to add one more process to the
     * work order
     *
     * @param workorderId
     * @param woClassId
     * @throws Exception
     */
    public void input(int workorderId, int woClassId) throws Exception {
        ArrayList params = new ArrayList();
        params.add(woClassId);
        List TaskFlows = getDao().find("select obj from WorkFlow obj where obj.workorderClass.id=? order by sequence asc", params);
        ArrayList woparams = new ArrayList();
        woparams.add(workorderId);
        List steps = getDao().find("select obj from WorkFlowProcess obj where obj.workOrder.id=? order by id desc", woparams);

        currentStep = ((WorkFlowProcess) steps.get(0));

        WorkFlow taskFlow = (WorkFlow) TaskFlows.get(currentStep.getTaskFlowStep() - 1);

        currentTaskFlow = taskFlow;

    }

    public void add(WorkFlowProcess vo, int workOrderId, String callInUniqueId) throws Exception {
        dao.beginTransaction();
        //add a new process of the current step, its state is set to 0--"Not-Finished".

        //get the last step
        ArrayList woparams = new ArrayList();
        woparams.add(workOrderId);
        List steps = getDao().find("select obj from WorkFlowProcess obj where obj.workOrder.id=? order by id desc", woparams);
        currentStep = ((WorkFlowProcess) steps.get(0));
        currentStep.setState(1);
        dao.modify(WorkFlowProcess.class, currentStep);
        WorkFlowProcess po = new WorkFlowProcess();
        po.setProcessor(vo.getProcessor());
        po.setProcessTime(new java.sql.Timestamp(System.currentTimeMillis()));
        po.setContent(vo.getContent());
        
        WorkOrder workorder=currentStep.getWorkOrder();
        
        System.out.println("add  callInUniqueId=" + callInUniqueId);
        //process a call linked to an old workorder
        if(callInUniqueId!=null && !callInUniqueId.trim().equals(""))
        {
            //fix the process type to "来电追加"
            WorkFlowType type= (WorkFlowType) dao.load(WorkFlowType.class, 1);
            po.setWorkFlowType(type);
            
            
        }
        else
        {
            //if process type is passed from page, means the page is to add a process step after an addition call
            //so the current process type should to be set as it before the addition call
            if(vo.getWorkFlowType()!=null)
            {
                po.setWorkFlowType(vo.getWorkFlowType());
            }
            else
            {
                po.setWorkFlowType(currentStep.getWorkFlowType());
            }
        }

        po.setTaskFlowStep(currentStep.getTaskFlowStep());
        po.setWorkOrder(workorder);
        po.setOperator(currentStep.getOperator());
        Set assistants = new HashSet();
        assistants.addAll(currentStep.getAssistants());
        po.setAssistants(assistants);
        po.setTaskFlowType(currentStep.getTaskFlowType());
        po.setGenType(2);
        //normal process
        if (currentStep.getTaskFlowType() != 1) {
            po.setState(0);
        } //condition process
        else {
            po.setState(0);
            po.setCheckResult(vo.getCheckResult());

        }
        dao.add( po);

        if (currentStep.getTaskFlowType() == 1 && po.getState() == 2) {
            //auto start the next step
        }


        nextStep = po;
        /*
        if(terminate)
        {
            this.terminate(preWorkOrderId, currentStep.getWorkOrder().getWorkorderClass().getFirstLevel().getId());
        }
        * */
        dao.endTransaction();
    }

    public void complete(WorkFlowProcess vo,int workOrderId, int woClassId) throws Exception {
        //set all the process item of the current step to finished and create a new item of the next step
        //the content of the new item is "Assigned to sb. by the owner of the previous step"
        getDao().beginTransaction();

        ArrayList woparams = new ArrayList();
        woparams.add(workOrderId);
        List steps = getDao().find("select obj from WorkFlowProcess obj where obj.workOrder.id=? order by id desc", woparams);

        currentStep = ((WorkFlowProcess) steps.get(0));
        currentStep.setState(1);
        getDao().modify(WorkFlowProcess.class, currentStep);
        woparams.add(currentStep.getTaskFlowStep());
        String sql = "update WorkFlowProcess obj set obj.state=1 where obj.workOrder.id=? and taskFlowStep=?";

        dao.executeUpdate(sql, woparams);

        ArrayList params = new ArrayList();
        params.add(woClassId);
        List TaskFlows = getDao().find("select obj from WorkFlow obj where obj.workorderClass.id=? order by sequence asc", params);
        currentTaskFlow = (WorkFlow) TaskFlows.get(currentStep.getTaskFlowStep() - 1);
        int nextTaskFlowSequence = currentStep.getTaskFlowStep()+1;
        //if not passed
        System.out.println("currentStep.getTaskFlowType():"+currentStep.getTaskFlowType());
        if (currentStep.getTaskFlowType() == 1 && currentStep.getCheckResult()==3) {
            nextTaskFlowSequence = currentTaskFlow.getNext();
            System.out.println("if nextTaskFlowSequence:"+nextTaskFlowSequence);
        }
        WorkFlow taskFlow = null;
        if (nextTaskFlowSequence > TaskFlows.size()) {
            //no more steps;
            taskFlow = currentTaskFlow;
            currentStep.setState(1);
            dao.modify(WorkFlowProcess.class, currentStep);
            
            /*
            //the record for the end of the work order
            nextStep = new WorkFlowProcess();
            nextStep.setState(100);
            nextStep.setTaskFlowStep(nextTaskFlowSequence);
            nextStep.setContent(taskFlow.getName());
            nextStep.setWorkFlowType(taskFlow.getWorkFlowType());
            nextStep.setProcessor(currentStep.getProcessor());
            //nextStep.setAssistants(currentStep.getAssistants());
            nextStep.setWorkOrder(currentStep.getWorkOrder());
            nextStep.setTaskFlowType(taskFlow.getType());
            nextStep.setProcessTime(new java.sql.Timestamp(System.currentTimeMillis()));

            Set assistants = new HashSet();
            assistants.addAll(currentStep.getAssistants());
            nextStep.setAssistants(assistants);

            currentTaskFlow = taskFlow;

            dao.modify(WorkFlowProcess.class, nextStep);
            */
            
            System.out.println("complete workOrderId="+workOrderId);
            
            WorkOrder wo=(WorkOrder)dao.load(WorkOrder.class, workOrderId);
             System.out.println("wo state="+wo.getState());
            wo.setState(2);
            wo.setUpdator(currentStep.getOperator());
            wo.setUpdateTime(new java.sql.Timestamp(System.currentTimeMillis()));
            dao.modify(WorkOrder.class, wo);
            System.out.println("wo state="+wo.getState());
        } else {
            //auto create next step
            taskFlow = (WorkFlow) TaskFlows.get(nextTaskFlowSequence - 1);
            System.out.println("if taskFlow:"+taskFlow.getSequence());
            nextStep = new WorkFlowProcess();

            nextStep.setState(0);
            nextStep.setTaskFlowStep(nextTaskFlowSequence);
            nextStep.setContent(taskFlow.getName());
            nextStep.setWorkFlowType(taskFlow.getWorkFlowType());
            nextStep.setOperator(currentStep.getOperator());
            //nextStep.setAssistants(currentStep.getAssistants());
            nextStep.setWorkOrder(currentStep.getWorkOrder());
            nextStep.setTaskFlowType(taskFlow.getType());
            nextStep.setProcessor(vo.getProcessor());
            nextStep.setProcessTime(new java.sql.Timestamp(System.currentTimeMillis()));

            Set assistants = new HashSet();
            assistants.addAll(currentStep.getAssistants());
            nextStep.setAssistants(assistants);
            nextStep.setGenType(1);

            currentTaskFlow = taskFlow;

            dao.add( nextStep);
        }
        getDao().endTransaction();

    }
public void terminate(int workOrderId, int woClassId) throws Exception {
        //set all the process item of the current step to finished and create a new item of the next step
        //the content of the new item is "Assigned to sb. by the owner of the previous step"
        //getDao().beginTransaction();

        ArrayList woparams = new ArrayList();
        woparams.add(workOrderId);
        List steps = getDao().find("select obj from WorkFlowProcess obj where obj.workOrder.id=? order by id desc", woparams);

        currentStep = ((WorkFlowProcess) steps.get(0));

        ArrayList params = new ArrayList();
        params.add(woClassId);
        List TaskFlows = getDao().find("select obj from WorkFlow obj where obj.workorderClass.id=? order by sequence asc", params);
        currentTaskFlow = (WorkFlow) TaskFlows.get(currentStep.getTaskFlowStep() - 1);


        WorkFlow taskFlow = null;

            //no more steps;
            taskFlow = currentTaskFlow;
            currentStep.setState(1);
            dao.modify(WorkFlowProcess.class, currentStep);
            
            //WorkOrder wo=(WorkOrder)dao.load(WorkOrder.class, workOrderId);
            //wo.setState(2);
            //dao.modify(WorkOrder.class, wo);

            //the last step
            taskFlow = (WorkFlow) TaskFlows.get(TaskFlows.size()-1);

            nextStep = new WorkFlowProcess();

            nextStep.setState(100);
            nextStep.setTaskFlowStep(currentStep.getTaskFlowStep() );
            nextStep.setContent("结案");
            nextStep.setWorkFlowType(taskFlow.getWorkFlowType());
            nextStep.setOperator(currentStep.getOperator());
            //nextStep.setAssistants(currentStep.getAssistants());
            nextStep.setWorkOrder(currentStep.getWorkOrder());
            nextStep.setTaskFlowType(taskFlow.getType());
            nextStep.setProcessTime(new java.sql.Timestamp(System.currentTimeMillis()));

            Set assistants = new HashSet();
            assistants.addAll(currentStep.getAssistants());
            nextStep.setAssistants(assistants);

            currentTaskFlow = taskFlow;

            dao.modify(WorkFlowProcess.class, nextStep);

        //getDao().endTransaction();

    }
    /**
     * @return the dao
     */
    public OperationManagement getDao() {
        return dao;
    }

    /**
     * @param dao the dao to set
     */
    public void setDao(OperationManagement dao) {
        this.dao = dao;
    }

    /**
     * @return the currentTaskFlow
     */
    public WorkFlow getCurrentTaskFlow() {
        return currentTaskFlow;
    }

    /**
     * @param currentTaskFlow the currentTaskFlow to set
     */
    public void setCurrentTaskFlow(WorkFlow currentTaskFlow) {
        this.currentTaskFlow = currentTaskFlow;
    }

    /**
     * @return the currentStep
     */
    public WorkFlowProcess getCurrentStep() {
        return currentStep;
    }

    /**
     * @param currentStep the currentStep to set
     */
    public void setCurrentStep(WorkFlowProcess currentStep) {
        this.currentStep = currentStep;
    }

    /**
     * @return the nextStep
     */
    public WorkFlowProcess getNextStep() {
        return nextStep;
    }

    /**
     * @param nextStep the nextStep to set
     */
    public void setNextStep(WorkFlowProcess nextStep) {
        this.nextStep = nextStep;
    }
}
