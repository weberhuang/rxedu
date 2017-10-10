package com.wja.edu.dao;

import org.springframework.stereotype.Repository;

import com.wja.base.common.CommRepository;
import com.wja.edu.entity.Resume;


/**
 * @ClassName ResumeDao
 * @Description TODO(这里用一句话描述这个类的作用)
 * @author huangxingbo
 * @Date 2017年9月7日 下午2:20:29
 * @version 1.0.0
 */
@Repository
public interface ResumeDao extends CommRepository<Resume, String> {
    
    Resume findByUserId(String userId);
}
