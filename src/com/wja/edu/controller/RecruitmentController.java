package com.wja.edu.controller;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wja.base.common.OpResult;
import com.wja.base.util.BeanUtil;
import com.wja.base.util.Page;
import com.wja.edu.entity.Recruitment;
import com.wja.edu.service.RecruitmentService;

/**
 * @ClassName RecruitmentController
 * @Description TODO(招聘信息控制类)
 * @author huangxingbo
 * @Date 2017年9月7日 上午8:28:12
 * @version 1.0.0
 */
@Controller
@RequestMapping("recruitment")
public class RecruitmentController {

    @Autowired
    private RecruitmentService service;

    @RequestMapping({"add", "update" })
    @ResponseBody
    public Object save(Recruitment recruitment) {
        boolean add = StringUtils.isBlank(recruitment.getId());

        recruitment = this.service.save(recruitment);

        if (add) {
            return OpResult.addOk();
        } else {
            return OpResult.updateOk();
        }
    }

    @RequestMapping("manage")
    public String manage() {
        return "edu/enterprise/recruitment";
    }

    // 根据条件查询
    @RequestMapping("list")
    @ResponseBody
    public Object query(@RequestParam Map<String, Object> params, Page<Recruitment> page) {

        this.service.pageQuery(params, page);
        BeanUtil.setCollFieldValues(page.getRows());
        return page;
    }

    @RequestMapping("remove")
    @ResponseBody
    public Object remove(String id[]) {

        this.service.delete(id);
        return OpResult.deleteOk();
    }
}
