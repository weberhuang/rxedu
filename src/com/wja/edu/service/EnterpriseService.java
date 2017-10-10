package com.wja.edu.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wja.base.common.CommSpecification;
import com.wja.base.util.BeanUtil;
import com.wja.base.util.CollectionUtil;
import com.wja.base.util.Page;
import com.wja.base.util.Sort;
import com.wja.edu.dao.EnterpriseDao;
import com.wja.edu.entity.Enterprise;

/**
 * @ClassName EnterpriseService
 * @Description TODO(企业信息service)
 * @author huangxingbo
 * @Date 2017年9月7日 上午8:34:20
 * @version 1.0.0
 */
@Service
public class EnterpriseService {
    
    @Autowired
    private EnterpriseDao dao ;
    
    
 // 保存记录（包括修改和新增）
    public Enterprise save(Enterprise enterprise) {

        if (StringUtils.isNotBlank(enterprise.getId())) {
            Enterprise wr = this.dao.getOne(enterprise.getId());
            BeanUtil.copyPropertiesIgnoreNull(enterprise, wr);
            enterprise = wr;
        }
        return this.dao.save(enterprise);
    }

    // public Enterprise getByName(String name){
    // if(StringUtils.isBlank(name)){
    // return null;
    // }
    // return this.dao.findByTitle(name);
    // }

    // 根据条件获得一行记录
    public Enterprise get(String id) {
        if (StringUtils.isBlank(id)) {
            return null;
        }
        return this.dao.getOne(id);
    }

    // 单条记录删除
    public void delete(String id) {
        if (StringUtils.isNotBlank(id)) {
            this.dao.delete(id);
        }
    }

    // 多条记录删除
    public void delete(String ids[]) {

        if (!CollectionUtil.isEmpty(ids)) {
            this.dao.logicDeleteInBatch(ids);
        }
    }

    // 根据对象查询记录
    public List<Enterprise> query(Map<String, Object> params, Sort sort) {
        List<Enterprise> result = this.dao.findAll(new CommSpecification<Enterprise>(params),
                sort == null ? null : sort.getSpringSort());
        return result;
    }

    // 分页查询记录
    public Page<Enterprise> pageQuery(Map<String, Object> params, Page<Enterprise> page) {

        return page.setPageData(this.dao.findAll(new CommSpecification<Enterprise>(params), page.getPageRequest()));
    }
}
