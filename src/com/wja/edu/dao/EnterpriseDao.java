package com.wja.edu.dao;

import org.springframework.stereotype.Repository;

import com.wja.base.common.CommRepository;
import com.wja.edu.entity.Enterprise;

/**
 * @ClassName EnterpriseDao
 * @Description TODO(就业企业dao接口)
 * @author huangxingbo
 * @Date 2017年9月6日 下午9:36:49
 * @version 1.0.0
 */
@Repository
public interface EnterpriseDao extends CommRepository<Enterprise, String> {

    
}
