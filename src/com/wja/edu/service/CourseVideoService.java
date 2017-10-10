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
import com.wja.edu.dao.CourseVideoDao;
import com.wja.edu.entity.CourseVideo;

/**
 * @ClassName CourseVideoService
 * @Description TODO(课程视频Service类)
 * @author huangxingbo
 * @Date 2017年9月15日 上午11:39:04
 * @version 1.0.0
 */
@Service
public class CourseVideoService {
    @Autowired
    private CourseVideoDao dao ;
    
    // 保存记录（包括修改和新增）
    public CourseVideo save(CourseVideo video) {

        if (StringUtils.isNotBlank(video.getId())) {
            CourseVideo wr = this.dao.getOne(video.getId());
            BeanUtil.copyPropertiesIgnoreNull(video, wr);
            video = wr;
        }
        return this.dao.save(video);
    }


    // 根据条件获得一行记录
    public CourseVideo get(String id) {
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
    public List<CourseVideo> query(Map<String, Object> params, Sort sort) {
        List<CourseVideo> result = this.dao.findAll(new CommSpecification<CourseVideo>(params),
                sort == null ? null : sort.getSpringSort());
        return result;
    }

    // 分页查询记录
    public Page<CourseVideo> pageQuery(Map<String, Object> params, Page<CourseVideo> page) {

        return page.setPageData(this.dao.findAll(new CommSpecification<CourseVideo>(params), page.getPageRequest()));
    }
}
