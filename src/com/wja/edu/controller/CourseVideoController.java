package com.wja.edu.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.wja.base.common.OpResult;
import com.wja.base.util.BeanUtil;
import com.wja.base.util.Page;
import com.wja.base.util.UploadUtil;
import com.wja.edu.entity.CourseVideo;
import com.wja.edu.service.CourseVideoService;

/**
 * @ClassName CourseVideoController
 * @Description TODO(课程视频控制类)
 * @author huangxingbo
 * @Date 2017年9月15日 下午1:58:57
 * @version 1.0.0
 */

@Controller
@RequestMapping("/video")
public class CourseVideoController {

    // 从属性文件中获取改值
    @Value("${prop.projectpath}")
    private String projectpath;
    public void  setProjectpath(String projectpath) {  
        System.out.println(projectpath);  
        this.projectpath = projectpath;  
    }  
    
    @Autowired
    private CourseVideoService service;

    @RequestMapping({"add", "update" })
    @ResponseBody
    public Object save(@RequestParam("videourl") MultipartFile videourl, @RequestParam("picurl") MultipartFile picurl,
            @RequestParam("id") String id, @RequestParam("name") String name,@RequestParam("descr") String descr) {
        
      projectpath = "E:/apache-tomcat-7.0/webapps/webbase/uploads/";
//        projectpath = "/opt/apache-tomcat-7.0/webapps/webbase/uploads/";

        String picUrl = UploadUtil.uploadFile(picurl, "videoImg", projectpath);
        String videoUrl = UploadUtil.uploadFile(videourl, "video", projectpath);

        CourseVideo video = new CourseVideo();
        video.setPicurl(picUrl);
        video.setVideourl(videoUrl);
        video.setId(id);
        video.setName(name);
        video.setDescr(descr);

        boolean add = StringUtils.isBlank(video.getId());
        video = this.service.save(video);
        if (add) {
            return OpResult.addOk();
        } else {
            return OpResult.updateOk();
        }
    }

    @RequestMapping("manage")
    public String manage() {
        return "edu/coursevideo/course_video";
    }

    @RequestMapping("videoList")
    public String videoList() {
        return "edu/coursevideo/online_video";
    }


    // 根据条件查询
    @RequestMapping("list")
    @ResponseBody
    public Object query(@RequestParam Map<String, Object> params, Page<CourseVideo> page) {

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

//    // 根据文件名从属性文件中获取值
//    public static String getProperties(String url, String name) throws IOException {
//        InputStream in = new BufferedInputStream(new FileInputStream(url));
//        Properties p = new Properties();
//        p.load(in);
//        return p.getProperty(name);
//    }
    
    /**
     * 点播列表
     * @param request
     * @return
     */
    @RequestMapping("view")
    public String muivod(HttpServletRequest request) {
        List<CourseVideo> videoList = this.service.query(null, null);
        request.setAttribute("videoList", videoList);
        return "edu/coursevideo/online_video";
    }
    
    
    /**
     *视频详情页面
     * @param request
     * @return
     */
    @RequestMapping("muivodetail")
    public String muivodetail(String id,HttpServletRequest request) {
        CourseVideo video = this.service.get(id);
        request.setAttribute("video", video);
        return "edu/coursevideo/view_detail";
    }
    

}
