package com.shopping.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

/**
 * @ClassName UploadFileUtil
 * @Description 上传文件工具类
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/14 10:28
 * @Version 1.0
 **/
public class UploadUtil {
    public static String uploadImage(MultipartFile file, String fileFolder)throws Exception{
        // 保存图片的路径，图片上传成功后，将路径保存到数据库
        String filePath = "C:\\upload\\"+fileFolder;
        // 获取原始图片的扩展名
        String originalFilename = file.getOriginalFilename();
        // 生成文件新的名字
        String newFileName = UUID.randomUUID() + originalFilename;
        // 封装上传文件位置的全路径
        File targetFile = new File(filePath, newFileName);
        file.transferTo(targetFile);
        return newFileName;
    }
}
