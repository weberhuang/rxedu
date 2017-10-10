package com.wja.edu.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Where;

import com.wja.base.common.CommConstants;
import com.wja.base.common.CommEntity;


/**
 * @ClassName WeeklyReport
 * @Description TODO(周报管理实体类)
 * @author huangxingbo
 * @Date 2017年9月1日 下午6:49:45
 * @version 1.0.0
 */

@Entity
@Table(name ="t_report_weekly")
@Where(clause = " valid = " + CommConstants.DATA_VALID)

public class WeeklyReport extends CommEntity {
    
    //标题
    @Column(length = 200)
    private  String title ;
    
    //学习内容记录 
    @Column( name ="content_remark" ,length = 200 )
    private  String   contentRemark;
    
    // 下步学习目标 
    @Column(name= "next_learning_goal" ,length =200)
    private String nextLearningGoal;
    
    //感想与建议
    @Column(name= "thoughts_and_suggestions", length= 200)
    private String suggestions ;
    
    //备注
    @Column(name ="remark" ,length = 200)
    private String remark ;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContentRemark() {
        return contentRemark;
    }

    public void setContentRemark(String contentRemark) {
        this.contentRemark = contentRemark;
    }

    public String getNextLearningGoal() {
        return nextLearningGoal;
    }

    public void setNextLearningGoal(String nextLearningGoal) {
        this.nextLearningGoal = nextLearningGoal;
    }

    public String getSuggestions() {
        return suggestions;
    }

  
    public void setSuggestions(String suggestions) {
        this.suggestions = suggestions;
    } 
   
    public String getRemark() {
        return remark;
    }  

    public void setRemark(String remark) {
        this.remark = remark;
    }
    
}
