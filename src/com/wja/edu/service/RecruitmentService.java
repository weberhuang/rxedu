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
import com.wja.edu.dao.RecruitmentDao;
import com.wja.edu.entity.Recruitment;

/**
 * @ClassName RecruitmentService
 * @Description TODO(招聘企业信息Service)
 * @author huangxingbo
 * @Date 2017年9月7日 上午8:35:57
 * @version 1.0.0
 */
@Service
public class RecruitmentService {

    @Autowired
    private RecruitmentDao dao;

    // 保存记录（包括修改和新增）
    public Recruitment save(Recruitment recruitment) {

        if (StringUtils.isNotBlank(recruitment.getId())) {
            Recruitment wr = this.dao.getOne(recruitment.getId());
            BeanUtil.copyPropertiesIgnoreNull(recruitment, wr);
            recruitment = wr;
        }
        return this.dao.save(recruitment);
    }

    // public Recruitment getByName(String name){
    // if(StringUtils.isBlank(name)){
    // return null;
    // }
    // return this.dao.findByTitle(name);
    // }

    // 根据条件获得一行记录
    public Recruitment get(String id) {
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
    public List<Recruitment> query(Map<String, Object> params, Sort sort) {
        List<Recruitment> result = this.dao.findAll(new CommSpecification<Recruitment>(params),
                sort == null ? null : sort.getSpringSort());
        return result;
    }

    // 分页查询记录
    public Page<Recruitment> pageQuery(Map<String, Object> params, Page<Recruitment> page) {

        return page.setPageData(this.dao.findAll(new CommSpecification<Recruitment>(params), page.getPageRequest()));
    }
    
}
