package com.wja.edu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Where;
import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;
import com.wja.base.common.CommConstants;
import com.wja.base.common.CommEntity;
import com.wja.base.util.DateUtil;


/**
 * @ClassName Resume
 * @Description TODO(简历信息实体类)
 * @author huangxingbo
 * @Date 2017年9月7日 上午11:54:51
 * @version 1.0.0
 */
@Entity
@Table(name = "t_student_resume")
@Where(clause = " valid = " + CommConstants.DATA_VALID)

public class Resume extends CommEntity {

public static final String STATUS_NEED_AUDIT = "w";
    
    public static final String STATUS_IN_LEARNING = "s";
    
    // 学生对应的用户id
    @Column(name = "user_id", length = 32)
    private String userId;
    

    //姓名
    @Column(length = 30, nullable = false)
    private String name;
    
    //年龄 
    @Column(length = 3)
    private String age;
    
    //性别
    @Column(length = 1)
    private String sex;
    
    //生日
    @DateTimeFormat(pattern = DateUtil.DATE)
    @JSONField(format = DateUtil.DATE)
    private Date birthday;
    
    //QQ号码
    @Column(length = 20)
    private String qq;
    
    //有效号码
    @Column(length = 40)
    private String email;
    
    //手机号码
    @Column(length = 40)
    private String phone;
    
    //家庭住址
    @Column(length = 60)
    private String address;   

    //第二联系人及电话
    @Column(name = "second_contact", length = 50)
    private String secondContact;
    
    //学习专业
    @Column(name = "learn_major", length = 32)
    private String learnMajor;
    
    //入学时间
    @DateTimeFormat(pattern = DateUtil.DATE)
    @JSONField(format = DateUtil.DATE)
    private Date startTime;
    
    //毕业时间
    @DateTimeFormat(pattern = DateUtil.DATE)
    @JSONField(format = DateUtil.DATE)
    private Date finishTime;
    
    //所在班级
    @Column(length = 32)
    private String clazz;
    
    //学历
    @Column(length = 10)
    private String education;
    
    //专业
    @Column(length = 30)
    private String major;
    
    //毕业院校
    @Column(length = 60)
    private String school;
    
    //院校毕业时间
    @Column(name = "grad_time")
    @DateTimeFormat(pattern = DateUtil.DATE)
    @JSONField(format = DateUtil.DATE)
    private Date graduateTime;
    
    //父母姓名
    @Column(length = 40)
    private String parent;
    
    //家庭住址
    @Column(length = 80)
    private String home;
    
    //家庭联系电话
    @Column(name = "home_phone", length = 40)
    private String homePhone;
    
    //状态
    @Column(name = "status", length = 1)
    private String status;
    
    //备注
    @Column(length = 200)
    private String remark;
    
    //期望薪资
    @Column(name = "expected_salary")
    private String expectedSalary;
   
    //工作地点
    @Column(length = 40)
    private String workplace ;
    
    //岗位职能
    @Column(length = 400)
    private String post ;
    
    //行业
    @Column(length = 30)
    private String industry ;
    
    //到岗时间
    @Column(name = "arrival_time")
    @DateTimeFormat(pattern = DateUtil.DATE)
    @JSONField(format = DateUtil.DATE)
    private Date arrivalTime;
    
    //工作类型
    @Column(name = "work_type")
    private String workType ;    
    
    //自我评价
    @Column(name = "self_evaluation", length = 400)
    private String selfEvaluation ;  
    
    //特长、技能
    @Column(length = 400)
    private String skills ;
    
    //项目名称
    @Column(name = "project_name",length = 50)
    private String projectName ;
    
    //项目描述
    @Column(name = "project_desc",length = 1000)
    private String projectDesc ;
    
//    @OneToOne
//    @JoinColumn(name = "resume_id")
//    private ProjectExperience projectExperience;
    
    //岗位职责
    @Column(length = 500)
    private String responsibilities ;
    
    @Column(name ="project_start_time")
    private String projectStartTime ;
    
    @Column(name ="project_finish_time")
    private String projectFinishTime ;
    
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

    
    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
    
    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }

    public String getSecondContact() {
        return secondContact;
    }

    public void setSecondContact(String secondContact) {
        this.secondContact = secondContact;
    }

    public String getLearnMajor() {
        return learnMajor;
    }

    public void setLearnMajor(String learnMajor) {
        this.learnMajor = learnMajor;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(Date finishTime) {
        this.finishTime = finishTime;
    }

    public String getClazz() {
        return clazz;
    }

    public void setClazz(String clazz) {
        this.clazz = clazz;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public Date getGraduateTime() {
        return graduateTime;
    }

    public void setGraduateTime(Date graduateTime) {
        this.graduateTime = graduateTime;
    }

    public String getParent() {
        return parent;
    }
  
    public void setParent(String parent) {
        this.parent = parent;
    }
 
    public String getHome() {
        return home;
    }

    public void setHome(String home) {
        this.home = home;
    }

    public String getHomePhone() {
        return homePhone;
    }

    public void setHomePhone(String homePhone) {
        this.homePhone = homePhone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
 
    public static String getStatusNeedAudit() {
        return STATUS_NEED_AUDIT;
    }

    public static String getStatusInLearning() {
        return STATUS_IN_LEARNING;
    }
    
    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }
 
    public String getExpectedSalary() {
        return expectedSalary;
    }

    public void setExpectedSalary(String expectedSalary) {
        this.expectedSalary = expectedSalary;
    }

    public String getWorkplace() {
        return workplace;
    }

    public void setWorkplace(String workplace) {
        this.workplace = workplace;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }


    public String getIndustry() {
        return industry;
    }

 
    public void setIndustry(String industry) {
        this.industry = industry;
    }

 
    public Date getArrivalTime() {
        return arrivalTime;
    }


    public void setArrivalTime(Date arrivalTime) {
        this.arrivalTime = arrivalTime;
    }


    public String getWorkType() {
        return workType;
    }

    public void setWorkType(String workType) {
        this.workType = workType;
    }

    public String getSelfEvaluation() {
        return selfEvaluation;
    }

    public void setSelfEvaluation(String selfEvaluation) {
        this.selfEvaluation = selfEvaluation;
    }

    public String getSkills() {
        return skills;
    }

    public String getResponsibilities() {
        return responsibilities;
    }

    public void setResponsibilities(String responsibilities) {
        this.responsibilities = responsibilities;
    }

    public String getProjectStartTime() {
        return projectStartTime;
    }

    public void setProjectStartTime(String projectStartTime) {
        this.projectStartTime = projectStartTime;
    }

    public String getProjectFinishTime() {
        return projectFinishTime;
    }

    public void setProjectFinishTime(String projectFinishTime) {
        this.projectFinishTime = projectFinishTime;
    }


}
