package com.wja.edu.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import org.hibernate.annotations.Where;

import com.wja.base.common.CommConstants;
import com.wja.base.common.CommEntity;

/**
 * @ClassName Recruitment
 * @Description TODO(招聘信息实体类)
 * @author huangxingbo
 * @Date 2017年9月6日 下午9:53:11
 * @version 1.0.0
 */
@Entity
@Table(name = "t_recruitment_info")
@Where(clause = " valid = " + CommConstants.DATA_VALID)

public class Recruitment  extends CommEntity{
       
    //招聘岗位
    @Column(name = "hiring_job",length =20)
    private String hiringJob ;
    
    //招聘人数
    @Column(name = "hiring_number",length = 20)
    private String hiringNumber;
    
    //公司名称
    @Column(name ="company_name",length = 30)
    private String companyName ;
    
    //招聘负责人
    @Column(name = "recruiting_director",length = 30)
    private String recruitingDirector;
    
    //岗位要求
    @Column(name = "post_requirements" ,length =30)
    private String postRequirements;
    
    //工资待遇
    @Column(length =10)
    private String wages;
    
    //工作经验
    @Column(name = "work_experience",length = 10)
    private String workExperience; 
    
    //工作地点
    @Column(name = "working_place",length = 20)
    private String workingPlace;
    
    //是否出差
    @Column(name ="business_trip" ,length =10)
    private String businessTrip ;


    public String getHiringJob() {
        return hiringJob;
    }
    public void setHiringJob(String hiringJob) {
        this.hiringJob = hiringJob;
    }
 
    public String getHiringNumber() {
        return hiringNumber;
    }

    public void setHiringNumber(String hiringNumber) {
        this.hiringNumber = hiringNumber;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getRecruitingDirector() {
        return recruitingDirector;
    }

    public void setRecruitingDirector(String recruitingDirector) {
        this.recruitingDirector = recruitingDirector;
    }

    public String getPostRequirements() {
        return postRequirements;
    }

    public void setPostRequirements(String postRequirements) {
        this.postRequirements = postRequirements;
    }

    public String getWages() {
        return wages;
    }

    public void setWages(String wages) {
        this.wages = wages;
    }
 
    public String getWorkExperience() {
        return workExperience;
    }

    public void setWorkExperience(String workExperience) {
        this.workExperience = workExperience;
    }

    public String getWorkingPlace() {
        return workingPlace;
    }

    public void setWorkingPlace(String workingPlace) {
        this.workingPlace = workingPlace;
    }
    
    public String getBusinessTrip() {
        return businessTrip;
    }
   
    public void setBusinessTrip(String businessTrip) {
        this.businessTrip = businessTrip;
    }
    
  
}
