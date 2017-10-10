package com.wja.edu.dao;

import org.springframework.stereotype.Repository;

import com.wja.base.common.CommRepository;
import com.wja.edu.entity.CourseVideo;

/**
 * @ClassName CourseVideoDao
 * @Description TODO(课程视频dao层)
 * @author huangxingbo
 * @Date 2017年9月15日 上午11:36:21
 * @version 1.0.0
 */

@Repository
public interface CourseVideoDao extends CommRepository<CourseVideo,String>{
    
}
