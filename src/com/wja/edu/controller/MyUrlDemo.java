package com.wja.edu.controller;


/**
 * @ClassName Test
 * @Description TODO(这里用一句话描述这个类的作用)
 * @author Administrator
 * @Date 2017年9月18日 上午11:30:08
 * @version 1.0.0
 */
import java.io.File;
import java.io.IOException;
import java.net.URL;

public class MyUrlDemo {

    
    public static void main(String[] args) {
        MyUrlDemo muDemo = new MyUrlDemo();
        try {
            muDemo.showURL();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void showURL() throws IOException {

        // 第一种：获取类加载的根路径   D:\git\daotie\daotie\target\classes
        File f = new File(this.getClass().getResource("/").getPath());
        System.out.println("第一种:"+f);

        // 获取当前类的所在工程路径; 如果不加“/”  获取当前类的加载目录  D:\git\daotie\daotie\target\classes\my
        File f2 = new File(this.getClass().getResource("").getPath());
        System.out.println("第一种:"+f2);

        // 第二种：获取项目路径    D:\git\daotie\daotie
        File directory = new File("");// 参数为空
        String courseFile = directory.getCanonicalPath();
        System.out.println("第二种"+courseFile);

        // 第三种：  file:/D:/git/daotie/daotie/target/classes/
        URL xmlpath = this.getClass().getClassLoader().getResource("");
        System.out.println("第三种"+xmlpath);

        // 第四种： D:\git\daotie\daotie
        System.out.println("第四种"+System.getProperty("user.dir"));
        /*
         * 结果： C:\Documents and Settings\Administrator\workspace\projectName
         * 获取当前工程路径
         */

        // 第五种：  获取所有的类路径 包括jar包的路径
        System.out.println("第五种"+System.getProperty("java.class.path"));

    }
}
