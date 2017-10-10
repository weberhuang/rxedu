package com.wja.edu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wja.base.common.CommSpecification;
import com.wja.base.system.entity.User;
import com.wja.base.util.BeanUtil;
import com.wja.base.util.CollectionUtil;
import com.wja.base.util.Page;
import com.wja.base.util.Sort;
import com.wja.edu.dao.WeeklyReportDao;
import com.wja.edu.entity.Major;
import com.wja.edu.entity.WeeklyReport;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

/**
 * @ClassName WeeklyReport
 * @Description TODO(周报管理service类)
 * @author huangxingbo
 * @Date 2017年9月1日 下午7:12:00
 * @version 1.0.0
 */

@Service
public class WeeklyReportService {

    @Autowired
    private WeeklyReportDao dao;

    // 保存记录（包括修改和新增）
    public WeeklyReport save(WeeklyReport report) {

        if (StringUtils.isNotBlank(report.getId())) {
            WeeklyReport wr = this.dao.getOne(report.getId());
            BeanUtil.copyPropertiesIgnoreNull(report, wr);
            report = wr;
        }
        return this.dao.save(report);
    }

    //根据名称查找记录
    public WeeklyReport getByName(String name) {
        if (StringUtils.isBlank(name)) {
            return null;
        }
        return this.dao.findByTitle(name);
    }

    // 根据条件获得一行记录
    public WeeklyReport get(String id) {
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
    public List<WeeklyReport> query(Map<String, Object> params, Sort sort) {
        List<WeeklyReport> result = this.dao.findAll(new CommSpecification<WeeklyReport>(params),
                sort == null ? null : sort.getSpringSort());
        return result;
    }

    // 分页查询记录
    public Page<WeeklyReport> pageQuery(Map<String, Object> params, Page<WeeklyReport> page) {

        return page.setPageData(this.dao.findAll(new CommSpecification<WeeklyReport>(params), page.getPageRequest()));
    }
}
