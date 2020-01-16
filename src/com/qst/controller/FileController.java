package com.qst.controller;

import com.qst.po.*;
import com.qst.service.FilesServiceImpl;
import org.apache.ibatis.annotations.Param;
import org.junit.experimental.theories.ParametersSuppliedBy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

@Controller
@RequestMapping("/files")
public class FileController {
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private FilesServiceImpl filesServiceImpl;

    @RequestMapping("/getFiles")
    public @ResponseBody
    Result <List <FileCustom>> getFiles(String path) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        System.out.println("DAODAgetfiles:" + path);
        String realPath = filesServiceImpl.getFileName(request, path);
        List <FileCustom> listFileCustom = filesServiceImpl.listFile(realPath);
        Result <List <FileCustom>> result = new Result <List <FileCustom>>(325,
                true, "获取成功");
        result.setData(listFileCustom);
        return result;
    }

    // currentPath;当前路径前台传来的
    @RequestMapping("/upload")
    public @ResponseBody
    Result <String> upload(
            @RequestParam("files") MultipartFile[] files, String currentPath) {
        System.out.println("qian" + currentPath);
        try {
            System.out.println("qian" + currentPath);
            filesServiceImpl.uploadFilePath(request, files, currentPath);
            System.out.println("hou");
        } catch (Exception e) {
            return new Result <>(301, false, "上传失败");
        }
        return new Result <String>(305, true, "上传成功");
    }

    @RequestMapping("/download")
    //ResponseEntity设置http相应内容、状态以及头信息。
    public ResponseEntity <byte[]> download(String currentPath, String[] downPath, String username) {
        try {
            String down = request.getParameter("downPath");
            //应该写在service，后期优化,创建文件对象
            File downloadFile = filesServiceImpl.downPackage(request, currentPath,
                    downPath, username);
            System.out.println("下载地址" + downloadFile.getPath());
            //获取输入流
            //BufferedInputStream bis = new BufferedInputStream(new FileInputStream(downloadFile));
            //设置头信息
            HttpHeaders headers = new HttpHeaders();
            //设置MIME类型
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            //设置文件输出类型
            String fileName = new String(downloadFile.getName().getBytes(
                    "utf-8"), "iso-8859-1");
            //设置下载的附件 (myFileName必须处理中文名称!)
            headers.setContentDispositionFormData("attachment", fileName);
            //将文件读到byte数组
            byte[] fileToByteArray = org.apache.commons.io.FileUtils
                    .readFileToByteArray(downloadFile);
            // filesServiceImpl.deleteDownPackage(downloadFile);
            filesServiceImpl.deleteDownPackage(downloadFile);
            return new ResponseEntity <byte[]>(fileToByteArray, headers,
                    HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 新建文件夹，前台，传来
     */
    // @RequestMapping("/addDirectory")
    //   @ResponseBody
    //  public File addDirectory(String currentPath, String directoryName) {
//        try {
//            HttpSession session = request.getSession();
//            session.setAttribute("directoryName",directoryName);
//            System.out.println(session.getAttribute("directoryName"));
//            if (directoryName.equals(session.getAttribute("directoryName") )){
//                Date now= new Date();
//                //打印当前时间
//                System.out.println("当前时间:"+now.toString());
//                directoryName = directoryName + now.toString();
//                System.out.println("加上时间的文件名"+directoryName);
//                filesServiceImpl.addDirectory(request, currentPath, directoryName);
//                return new Result <>(336, true, "添加成功");
//            //System.out.println("新建文件夹控制:"+"currentPath="+currentPath+""+"directoryName="+directoryName);
//            }else {
    //         File file = filesServiceImpl.addDirectory(request, currentPath, directoryName);
//        System.out.println("dierci"+file);
    //           return file;
//             return new Result <>(336, true, "添加成功");
//        } catch (Exception e) {
//            return new Result <Object>(331, false, "添加失败");
//        }
    //   }
    @RequestMapping("/addDirectory")
    public @ResponseBody
    Result <String> addDirectory(String currentPath,
                                 String directoryName) {
        System.out.println("前台传来的当前地址：" + currentPath);
        System.out.println("前台传来的文件名："+directoryName);
        try {
            filesServiceImpl.addDirectory(request, currentPath, directoryName);
            return new Result <>(336, true, "添加成功");
        } catch (Exception e) {
            return new Result <>(331, false, "添加失败");
        }
    }

    /**
     * 重命名文件夹
     */
    @RequestMapping("/renameDirectory")
    public @ResponseBody
    Result <String> renameDirectory(String currentPath,
                                    String srcName, String destName) {
        try {
            filesServiceImpl.renameDirectory(request, currentPath, srcName, destName);
            return new Result <>(356, true, "重命名成功");
        } catch (Exception e) {
            return new Result <>(351, false, "重命名失败");
        }
    }

    /**
     * 删除
     */
    @RequestMapping("/delDirectory")
    public @ResponseBody
    Result <String> delDirectory(String currentPath,
                                 String[] directoryName) {
        //request.setCharacterEncoding("UTF-8");
        try {
            filesServiceImpl.delDirectory(request, currentPath, directoryName);
            return new Result <>(346, true, "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result <>(341, false, "删除失败");
        }
    }

    /**
     * 复制
     */
    @RequestMapping("/copyDirectory")
    public @ResponseBody
    Result <String> copyDirectory(String currentPath,
                                  String[] directoryName, String targetdirectorypath)
            throws Exception {
        try {
            filesServiceImpl.copyDirectory(request, currentPath, directoryName,
                    targetdirectorypath);
            return new Result <>(366, true, "复制成功");
        } catch (IOException e) {
            return new Result <>(361, true, "复制失败");
        }
    }

    /**
     * 获取目录结构并返回
     */
    @RequestMapping("/summarylist")
    /* 如果方法声明了注解@ResponseBody ，则会直接将返回值输出到页面。 */
    public String summarylist(Model model) {
        //跟目录地址
        String webrootpath = filesServiceImpl.getFileName(request, "");
        int number = webrootpath.length();
        System.out.println("根目录" + webrootpath);
        System.out.println("列表" + number);
        SummaryFile rootlist = filesServiceImpl.summarylistFile(webrootpath, number);
        model.addAttribute("rootlist", rootlist);
        return "summarylist";
    }
    /**
     * 获取分享文件列表
     *
     * @param path
     *            路径
     * @param username
     *            用户名
     * @return Json对象
     */
//    @RequestMapping("/getShareFiles")
//    public @ResponseBody Result<List<FileCustom>> getFiles(String path,
//                                                           String username) {
//        String realPath = filesServiceImpl.getFileName(request, path, username);
//        List<FileCustom> listFile = filesServiceImpl.listFile(realPath);
//        Result<List<FileCustom>> result = new Result<List<FileCustom>>(326,
//                true, "获取成功");
//        result.setData(listFile);
//        System.out.println("返回的data:");
//        System.out.print(result.getData());
//        return result;
//    }

    /**
     * 分享文件
     *
     * @param request
     * @param currentPath 当前路径
     * @param shareFile   分享文件名
     * @return
     */
    @RequestMapping("/share")
    public @ResponseBody
    Result <String> shareFile(HttpServletRequest request, String currentPath, String[] shareFile) {
        try {

            String shareUrl = filesServiceImpl.shareFile(request, currentPath, shareFile);
            System.out.println("前台传来的currentpath" + currentPath);
            System.out.println("分享" + shareUrl);
            Result <String> result = new Result <>(405, true, "分享成功");
            result.setData(shareUrl);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return new Result <>(401, false, "分享失败");
        }
    }

    @RequestMapping("/shareFiles")
    public String shareFiles(HttpServletRequest request, String shareUrl) {
        try {
            System.out.println("前台拼接完的：" + shareUrl);
            List <ShareFile> files = filesServiceImpl.findShare(request, shareUrl);
            request.setAttribute("files", files);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "share";
    }

    /**
     * --调用删除时存入的file数据库信息即显示数据页面作用，并返回给recycle.jsp--
     */
    @RequestMapping("/recycleFile")
    public String recycleFile() {
        try {
            List <RecycleFile> findDelFile = filesServiceImpl.recycleFiles(request);
            // 返回的删除文件若没有，则不设置findDelFile
            if (null != findDelFile && findDelFile.size() != 0) {
                request.setAttribute("findDelFile", findDelFile);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "recycle";
    }

    /*
     * --删除回收站多个文件获取当前路径以及文件名--
     */
    @RequestMapping("/delRecycle")
    public @ResponseBody
    Result <String> delRecycleDirectory(int fileId[]) {
        try {
            filesServiceImpl.delRecycle(request, fileId);
            return new Result <>(327, true, "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result <>(322, false, "删除失败");
        }
    }

    /* --清空回收站-- */
    @RequestMapping("/delAllRecycle")
    public @ResponseBody
    Result <String> delAllRecycleDirectory() {
        try {
            filesServiceImpl.delAllRecycle(request);
            // 返回状态码
            return new Result <>(327, true, "删除成功");
        } catch (Exception e) {
            return new Result <>(322, false, "删除失败");
        }
    }

    /*
     * --还原回收站文件-- --获取目的路径以及文件名--
     */
    @RequestMapping("/revertDirectory")
    public @ResponseBody
    Result <String> revertDirectory(int[] fileId) {
        try {
            filesServiceImpl.revertDirectory(request, fileId);
            return new Result <>(327, true, "还原成功");
        } catch (Exception e) {
            return new Result <>(322, false, "还原失败");
        }
    }

    /**
     * 查找文件（模糊查询）
     *
     * @param reg
     *            要查找的文件名
     * @param currentPath
     *            当面路径
     * @param regType
     *            查找文件类型
     * @return Json对象
     */
    @RequestMapping("searchFile")
    public @ResponseBody Result<List<FileCustom>> searchFile(String reg,
                                                             String currentPath, String regType) {
        try {

            System.out.println("到达搜索");
            System.out.println("类型"+regType);
            List<FileCustom> searchFile =filesServiceImpl.searchFile(request,
                    currentPath, reg, regType);
            Result<List<FileCustom>> result = new Result<>(376, true, "查找成功");
            result.setData(searchFile);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return new Result<>(371, false, "查找失败");
        }
    }
    /**
     * 打开文件
     *
     * @param response
     *            响应文件流
     * @param currentPath
     *            当前路径
     * @param fileName
     *            文件名
     * @param fileType
     *            文件类型
     */
    @RequestMapping("/openFile")
    public void openFile(HttpServletResponse response, String currentPath,
                         String fileName, String fileType) {
        try {
            filesServiceImpl.respFile(response, request, currentPath, fileName,
                    fileType);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

