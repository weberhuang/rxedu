package com.wja.edu.controller;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.wja.base.common.OpResult;
import com.wja.base.system.entity.User;
import com.wja.base.util.BeanUtil;
import com.wja.base.util.Page;
import com.wja.base.web.RequestThreadLocal;
import com.wja.edu.entity.Resume;
import com.wja.edu.service.ResumeService;

/**
 * @ClassName ResumeController
 * @Description TODO(简历管理控制类)
 * @author huangxingbo1
 * @Date 2017年9月7日 下午2:33:57
 * @version 1.0.0
 */
@Controller
@RequestMapping("resume")
public class ResumeController {

    @Autowired
    private ResumeService service ;
    
    
    @RequestMapping("info")
    public String info(Model model)
    {
        User u = RequestThreadLocal.currUser.get();
        Object o = null;
        String res = null;
        
        o= this.service.findByUserId(u.getUsername());
        res = "edu/personnal/my_resume";
    
        model.addAttribute("resumeData", JSON.toJSONString(o));
        model.addAttribute("resumeInfo", "yes");
        return res;
    }

    
    @RequestMapping({"add", "update" })
    @ResponseBody
    public Object save(Resume resume) {
        boolean add = StringUtils.isBlank(resume.getId());
        User u = RequestThreadLocal.currUser.get();
        if(!"admin".equals(u.getUsername())){
            resume.setUserId(u.getUsername());
        }
//        resume.setProjectExperience(pe);
        resume = this.service.save(resume);

        if (add) {
            return OpResult.addOk();
        } else {
            return OpResult.updateOk();
        }
    }

    @RequestMapping("manage")
    public String manage() {
        return "edu/enterprise/resume_view";
    }


    // 根据条件查询
    @RequestMapping("list")
    @ResponseBody
    public Object query(@RequestParam Map<String, Object> params, Page<Resume> page) {

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
