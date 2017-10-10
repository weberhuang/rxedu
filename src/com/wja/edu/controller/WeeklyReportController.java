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
import com.wja.edu.entity.WeeklyReport;
import com.wja.edu.service.WeeklyReportService;

/**
 * @ClassName WeeklyReportController
 * @Description TODO(周报管理控制类)
 * @author huangxingbo
 * @Date 2017年9月1日 下午6:47:38
 * @version 1.0.0
 */
@Controller
@RequestMapping("/report")
public class WeeklyReportController {

    @Autowired
    private WeeklyReportService service;

    @RequestMapping({"add", "update" })
    @ResponseBody
    public Object save(WeeklyReport report) {
        boolean add = StringUtils.isBlank(report.getId());

        report = this.service.save(report);

        if (add) {
            return OpResult.addOk();
        } else {
            return OpResult.updateOk();
        }
    }

    @RequestMapping("manage")
    public String manage() {
        return "edu/personnal/weekly_report";
    }
    
    @RequestMapping("studentReport")
    public String studentReport() {
        return "edu/student/student_report";
    }

    // 根据条件查询
    @RequestMapping("list")
    @ResponseBody
    public Object query(@RequestParam Map<String, Object> params, Page<WeeklyReport> page) {

        this.service.pageQuery(params, page);
        BeanUtil.setCollFieldValues(page.getRows());
        return page;
    }
    
    @RequestMapping("remove")
    @ResponseBody
    public  Object remove(String id[]){
        
         this.service.delete(id);
        return OpResult.deleteOk();
    }

}
