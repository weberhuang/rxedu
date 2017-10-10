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
import com.wja.edu.entity.Enterprise;
import com.wja.edu.service.EnterpriseService;

/**
 * @ClassName EnterpriseController
 * @Description TODO(企业信息控制类)
 * @author huangxingbo
 * @Date 2017年9月7日 上午8:27:36
 * @version 1.0.0
 */

@Controller
@RequestMapping("enterprise")
public class EnterpriseController {

    @Autowired
    private EnterpriseService service;

    @RequestMapping({"add", "update" })
    @ResponseBody
    public Object save(Enterprise enterprise) {
        
        boolean add = StringUtils.isBlank(enterprise.getId());
        enterprise = this.service.save(enterprise);
        if (add) {
            return OpResult.addOk();
        } else {
            return OpResult.updateOk();
        }
    }

    @RequestMapping("manage")
    public String manage() {
        return "edu/enterprise/enterprise";
    }

    // 根据条件查询
    @RequestMapping("list")
    @ResponseBody
    public Object query(@RequestParam Map<String, Object> params, Page<Enterprise> page) {

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
