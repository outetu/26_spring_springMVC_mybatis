package com.qst.service;

import com.qst.po.FileCustom;
import com.qst.po.ShareFile;
import com.qst.po.SummaryFile;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

public interface FilesService {
   /**ע��Ĭ���ļ���*/
   public void addNewNameSpace(HttpServletRequest request, String namespace);
    /**��ȡ�ļ���ʵ·��*/
    public String getFileName(HttpServletRequest request, String fileName) ;
    /**����ʵ·�����õ������ļ�,��������·���������ļ��������ļ���Ϣ������filecustom list��*/
    public List<FileCustom> listFile(String realPath);
    /**�ϴ�*/
    public void uploadFilePath(HttpServletRequest request, MultipartFile[] files, String currentPath) throws Exception;
    /**ͳ���ļ���С*/
    public String countFileSize(HttpServletRequest request);
    /**�����ļ���С*/
   public void reSize(HttpServletRequest request);
    /**����*/
    public File downPackage(HttpServletRequest request, String currentPath, String[] fileNames, String username) throws Exception;
   /**�����ֻ�ȡ��ַ*/
    public String getFileName(HttpServletRequest request, String fileName, String username);
/**ɾ������*/
   // public void deleteDownPackage(File downloadFile);
/**�½��ļ���*/
public boolean addDirectory(HttpServletRequest request, String currentPath, String directoryName)throws Exception;
/**ɾ��*/
    public void delDirectory(HttpServletRequest request, String currentPath, String[] directoryName) throws Exception;
/**����**/
    public void copyDirectory(HttpServletRequest request, String currentPath, String[] directoryName,
                              String targetdirectorypath) throws Exception;
    public SummaryFile summarylistFile(String realPath, int number);
 /**������*/
    public boolean renameDirectory(HttpServletRequest request, String currentPath, String srcName, String destName);
/**�����ļ�*/
public String shareFile(HttpServletRequest request, String currentPath, String[] shareFile) throws Exception;
/**���ҷ���*/
public List<ShareFile> findShare(HttpServletRequest request, String shareUrl) throws Exception;
/**ɾ������վ������ߵ���*/
public void delRecycle(HttpServletRequest request, int[] fileId) throws Exception;
  /**��ջ���վ*/
public void delAllRecycle(HttpServletRequest request) throws Exception;
   /**��ԭ����վ*/
public void revertDirectory(HttpServletRequest request, int[] fileId) throws Exception;
/**��ѯ*/
public List<FileCustom> searchFile(HttpServletRequest request, String currentPath, String reg, String regType);
/**ɾ��ѹ����*/
public void deleteDownPackage(File downloadFile);
}

