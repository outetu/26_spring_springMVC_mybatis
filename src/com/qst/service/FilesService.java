package com.qst.service;

import com.qst.po.FileCustom;
import com.qst.po.ShareFile;
import com.qst.po.SummaryFile;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

public interface FilesService {
   /**注册默认文件夹*/
   public void addNewNameSpace(HttpServletRequest request, String namespace);
    /**获取文件真实路径*/
    public String getFileName(HttpServletRequest request, String fileName) ;
    /**用真实路径，得到所有文件,遍历所有路径下所有文件，并把文件信息储存在filecustom list中*/
    public List<FileCustom> listFile(String realPath);
    /**上传*/
    public void uploadFilePath(HttpServletRequest request, MultipartFile[] files, String currentPath) throws Exception;
    /**统计文件大小*/
    public String countFileSize(HttpServletRequest request);
    /**更新文件大小*/
   public void reSize(HttpServletRequest request);
    /**下载*/
    public File downPackage(HttpServletRequest request, String currentPath, String[] fileNames, String username) throws Exception;
   /**由名字获取地址*/
    public String getFileName(HttpServletRequest request, String fileName, String username);
/**删除下载*/
   // public void deleteDownPackage(File downloadFile);
/**新建文件夹*/
public boolean addDirectory(HttpServletRequest request, String currentPath, String directoryName)throws Exception;
/**删除*/
    public void delDirectory(HttpServletRequest request, String currentPath, String[] directoryName) throws Exception;
/**复制**/
    public void copyDirectory(HttpServletRequest request, String currentPath, String[] directoryName,
                              String targetdirectorypath) throws Exception;
    public SummaryFile summarylistFile(String realPath, int number);
 /**重命名*/
    public boolean renameDirectory(HttpServletRequest request, String currentPath, String srcName, String destName);
/**分享文件*/
public String shareFile(HttpServletRequest request, String currentPath, String[] shareFile) throws Exception;
/**查找分享*/
public List<ShareFile> findShare(HttpServletRequest request, String shareUrl) throws Exception;
/**删除回收站多个或者单个*/
public void delRecycle(HttpServletRequest request, int[] fileId) throws Exception;
  /**清空回收站*/
public void delAllRecycle(HttpServletRequest request) throws Exception;
   /**还原回收站*/
public void revertDirectory(HttpServletRequest request, int[] fileId) throws Exception;
/**查询*/
public List<FileCustom> searchFile(HttpServletRequest request, String currentPath, String reg, String regType);
/**删除压缩包*/
public void deleteDownPackage(File downloadFile);
}

