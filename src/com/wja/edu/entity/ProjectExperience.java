package com.wja.edu.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Where;

import com.wja.base.common.CommConstants;
import com.wja.base.common.CommEntity;


/**
 * @ClassName ProjectExperience
 * @Description TODO(项目经验实体类)
 * @author huangxingbo
 * @Date 2017年9月28日 下午9:58:54
 * @version 1.0.0
 */
@Entity
@Table(name = "t_project_experience")
@Where(clause = " valid = " + CommConstants.DATA_VALID)
public class ProjectExperience  extends CommEntity{
    
    @Column(name = "resume_id",length = 32)
    private String resumeId;
    
    @Column(name ="start_time")
    private String startTime ;
    
    @Column(name ="finish_time")
    private String finishTime ;
    
    @Column(name = "project_name" ,length =50)
    private String projectName ;

    @Column(name = "project_desc",length= 1000)
    private String projectDesc ;
   
    @Column(length = 500)
    private String responsibilities ;
      
    
    public String getResponsibilities() {
        return responsibilities;
    }
  
    public void setResponsibilities(String responsibilities) {
        this.responsibilities = responsibilities;
    }
    
    public String getResumeId() {
        return resumeId;
    }

    public void setResumeId(String resumeId) {
        this.resumeId = resumeId;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(String finishTime) {
        this.finishTime = finishTime;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }
  
    public String getProjectDesc() {
        return projectDesc;
    }
 
    public void setProjectDesc(String projectDesc) {
        this.projectDesc = projectDesc;
    }
    
}






