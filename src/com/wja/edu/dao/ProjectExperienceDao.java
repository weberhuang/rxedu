package com.wja.edu.dao;

import org.springframework.stereotype.Repository;

import com.wja.base.common.CommRepository;
import com.wja.edu.entity.ProjectExperience;

/**
 * @ClassName ProjectExperience
 * @Description TODO(项目经验dao接口)
 * @author huangxingbo
 * @Date 2017年9月28日 下午11:09:17
 * @version 1.0.0
 */
@Repository
public interface ProjectExperienceDao extends CommRepository<ProjectExperience, String> {
    
//      List<ProjectExperience> findByResumeId(String resumeId);
        ProjectExperience  findByResumeId(String resumeId);

}
