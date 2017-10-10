package com.wja.edu.dao;

import org.springframework.stereotype.Repository;

import com.wja.base.common.CommRepository;
import com.wja.edu.entity.Recruitment;

/**
 * @ClassName RecruitmentDao
 * @Description TODO(招聘信息dao层)
 * @author huangxingbo
 * @Date 2017年9月7日 上午8:23:00
 * @version 1.0.0
 */
@Repository
public interface RecruitmentDao extends CommRepository<Recruitment,String> {

    
}
