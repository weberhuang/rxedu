package com.wja.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wja.base.system.entity.User;
import com.wja.base.web.RequestThreadLocal;

/**
 * @ClassName ExamController
 * @Description TODO(考試管理模块)
 * @author huangxingbo
 * @Date 2017年9月12日 下午5:37:24
 * @version 1.0.0
 */
@Controller
@RequestMapping("/onlineExam")
public class ExamController {

  
    @RequestMapping("exam")
    public String manage(Model model) {
        User user = RequestThreadLocal.currUser.get();
        String username = user.getUsername();
        String password = user.getPassword();
        String credential = "http://127.0.0.1:8080/examxx/j_spring_security_check?j_username=" + username + "&j_password="
                + password;
        model.addAttribute("credential", credential);
        return "/edu/exam/exercise_bank";
    }

    @RequestMapping("questionBank")
    public String question(Model model) {
        User user = RequestThreadLocal.currUser.get();
        String username = user.getUsername();
        String password = user.getPassword();
        String credential = "http://127.0.0.1:8080/examxx/j_spring_security_check?j_username=" + username + "&j_password="
                + password;
        model.addAttribute("credential", credential);
        return "/edu/exam/exercise_bank";
    }
}
