package com.wja.edu.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Where;

import com.wja.base.common.CommConstants;
import com.wja.base.common.CommEntity;


/**
 * @ClassName CourseVideo
 * @Description TODO(课程视频实体类)
 * @author huangxingbo
 * @Date 2017年9月15日 上午11:28:09
 * @version 1.0.0
 */
@Entity
@Table(name = "t_edu_course_video")
@Where(clause = " valid = " + CommConstants.DATA_VALID)
public class CourseVideo extends CommEntity {
    
    //视频名称
    @Column(length = 50)
    private String name ;
       
    
    //封面地址 
    @Column(length = 40)
    private String  picurl ;
    
    //视频描述
    @Column(length = 50)
    private String  descr ;
    

    //视频路径
    @Column(length = 40)
    private String videourl ;


    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }


    public String getPicurl() {
        return picurl;
    }


    public void setPicurl(String picurl) {
        this.picurl = picurl;
    }

    public String getVideourl() {
        return videourl;
    }


    public void setVideourl(String videourl) {
        this.videourl = videourl;
    }
    
    public String getDescr() {
        return descr;
    }

    public void setDescr(String desc) {
        this.descr = desc;
    }

}
