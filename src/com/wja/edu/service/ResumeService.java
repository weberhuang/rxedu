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
import com.wja.edu.dao.ProjectExperienceDao;
import com.wja.edu.dao.ResumeDao;
import com.wja.edu.dao.StudentDao;
import com.wja.edu.entity.ProjectExperience;
import com.wja.edu.entity.Resume;
import com.wja.edu.entity.Student;

/**
 * @ClassName ResumeService
 * @Description TODO(简历Service类)
 * @author huangxingbo
 * @Date 2017年9月7日 下午2:22:00
 * @version 1.0.0
 */
@Service
public class ResumeService {

    @Autowired
    private ResumeDao dao;
    
    @Autowired
    private StudentDao studentDao;
    
       
    // 保存记录（包括修改和新增）
    public Resume save(Resume resume) {

        if (StringUtils.isNotBlank(resume.getId())) {
            Resume wr = this.dao.getOne(resume.getId());
            BeanUtil.copyPropertiesIgnoreNull(resume, wr);
            resume = wr;
        }
//              this.proExperDao.save(resume.getProjectExperience()); 
        return this.dao.save(resume);
        
    }

    // 根据条件获得一行记录
    public Resume get(String id) {
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
    public List<Resume> query(Map<String, Object> params, Sort sort) {
        List<Resume> result = this.dao.findAll(new CommSpecification<Resume>(params),
                sort == null ? null : sort.getSpringSort());
        return result;
    }

    // 分页查询记录
    public Page<Resume> pageQuery(Map<String, Object> params, Page<Resume> page) {

        return page.setPageData(this.dao.findAll(new CommSpecification<Resume>(params), page.getPageRequest()));
    }
    
    //根据userID获取简历对象
    
     public Resume findByUserId(String userId){
         Resume resume =  this.dao.findByUserId(userId);
         if(resume==null){
            resume = new Resume();
            resume.setUserId(userId);
            Student stu= this.studentDao.findByUserId(userId); 
            BeanUtil.copyPropertiesIgnoreNull(stu,resume);
            resume.setId(null);
         } 
//        ProjectExperience peojectExperience= this.proExperDao.findByResumeId(resume.getId());
//        resume.setProjectExperience(peojectExperience);
       return resume;    
     }
}
