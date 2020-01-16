package com.qst.service;

//import com.qst.dao.FileDao;
import com.qst.dao.FileDao;
import com.qst.dao.ShareDao;
import com.qst.dao.UserDao;
import com.qst.po.*;
import com.qst.utils.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.channels.FileChannel;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@Service
public class FilesServiceImpl implements FilesService {
    @Autowired
    private UserDao userDao;
    // @Autowired
    //private FileDao fileDao;
    @Autowired
    private ShareDao shareDao;
    @Autowired
    private FileDao fileDao;

    //文件相对前缀,就是我自己建的目录eg：web-if/file
    public static final String PREFIX = "WEB-INF" + File.separator + "file" + File.separator;
    //新用户注册默认文件夹
    public static final String[] DEFAULT_DIRECTORY = {"vido", "music", "source", "image", User.RECYCLE};
/**默认文件夹*/
@Override
    public void addNewNameSpace(HttpServletRequest request, String namespace) {
        String fileName = request.getSession().getServletContext().getRealPath("/") + PREFIX;
        File file = new File(fileName, namespace);
        file.mkdir();
        for (String newFileName : DEFAULT_DIRECTORY) {
            File newFile = new File(file, newFileName);
            newFile.mkdir();
        }
    }
    @Override
    /**1.获取文件真实路径，request取地址前。name取地址尾*/
    public String getFileName(HttpServletRequest request, String fileName) {
        if (fileName == null) {
            fileName = "";
        }
        String rootPath = request.getSession().getServletContext().getRealPath("/");
        ///从静态块中获取获取名字
        System.out.println("到达filename");
        String username = (String) request.getSession().getAttribute(User.NAMESPACE);
        //拼接路径并返回，eg:以根目录建新文件为例
        // rootPath    I:\26_spring_springMVC_mybatis整合\out\artifacts\26_spring_springMVC_mybatis_war_exploded\
        //PREFIX       WEB-INF\file\
        // username  1234\
        // fileName   \
        System.out.println("getFileName取得:" + rootPath + PREFIX + username + File.separator + fileName);
        return rootPath + PREFIX + username + File.separator + fileName;

    }

    @Override
    /**用真实路径，得到所有文件,遍历所有路径下所有文件，并把文件信息储存在filecustom list中*/
    public List <FileCustom> listFile(String realPath) {
        System.out.println("realPath:" + realPath);
        //遍历所有路径下所有文件，并把文件信息储存在filecustom list中
        List <FileCustom> lists = new ArrayList <FileCustom>();
        //对文件操作  需要new出一个文件，指向该文件内存地址
        //listFiles()方法是返回某个目录下所有文件和目录的绝对路径，返回的是File数组
        File[] files = new File(realPath).listFiles();
        if (files != null) {
            for (File file : files) {
                if (!file.getName().equals(User.RECYCLE)) {
                    //
                    FileCustom custom = new FileCustom();
                    custom.setFileName(file.getName());
                    System.out.println("mingzi::" + file.getName());
                    //返回所引用文件最后修改日期
                    custom.setLastTime(FileUtils.formatTime(file.lastModified()));
                    /* 保存文件的删除前路径以及当前路径 */
                    // custom.setFilePath(prePath);
                    custom.setCurrentPath(realPath);
                    //检查是否是文件夹
                    if (file.isDirectory()) {
                        custom.setFileSize("-");
                    } else {
                        custom.setFileSize(FileUtils.getDataSize(file.length()));
                    }
                    custom.setFileType(FileUtils.getFileType(file));
                    lists.add(custom);
                }
            }
        }
        return lists;
    }

    /**
     * 上传文件
     */
    @Override
    public void uploadFilePath(HttpServletRequest request, MultipartFile[] files, String currentPath) {
        for (MultipartFile file : files) {
            //文件名
            String fileName = file.getOriginalFilename();
            System.out.println("fileName;" + fileName);
            //文件存储路径
            String filePath = getFileName(request, currentPath);
            System.out.println(filePath);
            //根据地址，名字建虚拟文件
            File distFile = new File(filePath, fileName);
            if (distFile.exists()) {
                System.out.println("已存在一个文件");
                SimpleDateFormat sdf = new SimpleDateFormat("_yyyyMMdd_HHmmss");
                fileName +=  sdf.format(System.currentTimeMillis());
                File file1 = new File(filePath, fileName);
                try {
                    file.transferTo(file1);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (!distFile.exists()) {
                //文件转化成虚拟文件
                try {
                    file.transferTo(distFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
        }
         reSize(request);
    }
    /**更新文件大小*/
    @Override
    public void reSize(HttpServletRequest request) {
        String userName = (String) request.getSession().getAttribute(User.NAMESPACE);
        try {
            userDao.reSize(userName, countFileSize(request));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**统计用户文件大小*/
    @Override
    public String countFileSize(HttpServletRequest request) {
        long countFileSize = countFileSize(new File(getFileName(request, null)));
        return FileUtils.getDataSize(countFileSize);
    }
    /**
     * 递归统计用户文件大小
     * @param srcFile
     *            位置
     * @return
     */
    private long countFileSize(File srcFile) {
        File[] listFiles = srcFile.listFiles();
        if (listFiles == null) {
            return 0;
        }
        long count = 0;
        for (File file : listFiles) {
            if (file.isDirectory()) {
                count += countFileSize(file);
            } else {
                //length方法返回这个文件的字节大小
                count += file.length();
            }
        }
        return count;
    }
    @Override
    /**判断单一文件下载*/
    public File downPackage(HttpServletRequest request, String currentPath, String[] fileNames, String username) throws Exception {
        File downloadFile = null;
        if (currentPath == null) {
            currentPath = "";
        }
        if (fileNames.length == 1) {
            downloadFile = new File(getFileName(request, currentPath, username), fileNames[0]);
            if (downloadFile.isFile()) {
                return downloadFile;
            }
        }
        String[] sourcePath = new String[fileNames.length];
        for (int i = 0; i < fileNames.length; i++) {
            sourcePath[i] = getFileName(request, currentPath, username) + File.separator + fileNames[i];
        }
        String packageZipName = packageZip(sourcePath);
        downloadFile = new File(packageZipName);
        return downloadFile;
    }

    /**
     * 压缩文件,Java IO操作——掌握压缩流的使用
     */

    private String packageZip(String[] sourcePath) throws Exception {

        //定义压缩包名字
        String zipName = sourcePath[0] + (sourcePath.length == 1 ? "" : "等" + sourcePath.length + "个文件") + ".zip";
        //压缩输出流最外层
        ZipOutputStream zos = null;
        try {
            zos = new ZipOutputStream(new FileOutputStream(zipName));
            for (String string : sourcePath) {
                writeZos(new File(string), "", zos);
            }
        } finally {
            if (zos != null) {
                zos.close();
            }
        }
        return zipName;
    }

    private void writeZos(File file, String basePath, ZipOutputStream zos) throws IOException {
        if (!file.exists()) {
            throw new FileNotFoundException();
        }
        if (file.isDirectory()) {
            File[] listFiles = file.listFiles();
            if (listFiles.length != 0) {
                for (File childFile : listFiles) {
                    writeZos(childFile, basePath + file.getName() + File.separator, zos);
                }
            }
        } else {
            //缓存字节流
            BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
            //压缩实体
            ZipEntry entry = new ZipEntry(basePath + file.getName());
            // 把里层压缩实体放入压缩输出流
            zos.putNextEntry(entry);
            ////缓存容器
            //        byte[] datas = new byte[1024];
            //        //批量字节读取处理
            int count = 0;
            byte data[] = new byte[1024];
            while ((count = bis.read(data)) != -1) {//读取输入流
                zos.write(data, 0, count);//写入压缩
            }
            bis.close();
        }
    }
    /**
     * 删除压缩文件包
     *
     * @param downloadFile
     */
    public void deleteDownPackage(File downloadFile) {
        //endsWith() 方法用于测试字符串是否以指定的后缀结束。
        if (downloadFile.getName().endsWith(".zip")) {
            downloadFile.delete();
        }
    }
//    }
//        }
//        return downloadFile;
//        String[] sourcePath = new String[fileNames.length];
//        for (int i = 0; i < fileNames.length; i++) {
//            sourcePath[i] = getFileName(request, currentPath, username) + File.separator + fileNames[i];
//        }
//        String packageZipName = packageZip(sourcePath);
//        downloadFile = new File(packageZipName);
//        return downloadFile;
//    }

    /**
     * 根据用户名获取文件路径
     */
    @Override
    public String getFileName(HttpServletRequest request, String fileName, String username) {
        if (username == null) {
            return getFileName(request, fileName);
        }
        if (fileName == null) {
            fileName = "";
        }
        String rootpath = request.getSession().getServletContext().getRealPath("/");
        return rootpath + PREFIX + username + File.separator + fileName;
    }

//    @Override
//        public void deleteDownPackage(File downloadFile) {
//            if (downloadFile.getName().endsWith(".zip")) {
//                downloadFile.delete();
//            }
//        }

    /**
     * 新建文件夹
     */
    @Override
    public boolean addDirectory(HttpServletRequest request, String currentPath, String directoryName) throws Exception {
//        File file = new File(getFileName(request, currentPath), directoryName);
//       if (!file.exists()){
//           System.out.println("file"+file.getName());
//        //file.mkdir() 如果你想在已经存在的文件夹下建立新的文件夹.
//    //file.mkdirs() 如果你想根据File里的路径名建立文件夹（当你不知道此文件夹是否存在，也不知道父文件夹存在），就可用此方法，它建立文件夹的原则是：如果父文件夹不存在并且最后一级子文件夹不存在，它就自动新建所有路经里写的文件夹；如果父文件夹存在，它就直接在已经存在的父文件夹下新建子文件夹
//        file.mkdir();
//           return file;
//       }
//    else {
//           directoryName += FileUtils.formatTime(file.lastModified());
//           File file1 = new File(getFileName(request, currentPath), directoryName);
//           System.out.println("file1"+file1.getName());
//           file1.mkdir();
//           return file1;
//}
//}
// directoryName = directoryName + FileUtils.formatTime(System.currentTimeMillis());
        System.out.println(directoryName);
        File file = new File(getFileName(request, currentPath), directoryName);
        if (file.exists()) {
            SimpleDateFormat sdf = new SimpleDateFormat("_yyyyMMdd_HHmmss");
            directoryName = directoryName + sdf.format(System.currentTimeMillis());
            file = new File(getFileName(request, currentPath), directoryName);
            System.out.println(directoryName);
        }
//        System.out.println("下一步建文件");
//       boolean mkdirs = file.mkdirs();
//       if (mkdirs){
//           System.out.println("文件创建成功");
//       }
        return file.mkdir();
    }
//    System.out.println("directoryname"+directoryName);
//    String srcPath ="\\"+"\\"+directoryName;
//    System.out.println(srcPath);
//    RecycleFile exsitfile = fileDao.findPath(srcPath);
//    System.out.println("shujukufxanhui---"+exsitfile.getCurrentPath());
//    if (exsitfile != null){
//        srcPath=srcPath +FileUtils.formatTime(System.currentTimeMillis());
//        File src = new File(getFileName(request, srcPath));
//        return src.mkdir();
//    }
//        else {
//    File file = new File(getFileName(request, currentPath), directoryName);
//	return file.mkdir();
//	}}

    /**
     * 删除
     */
    @Override
    public void delDirectory(HttpServletRequest request, String currentPath, String[] directoryName) throws Exception {
//        for (String fileName : directoryName) {
//            //拼接源文件的地址
//            String srcPath = currentPath + File.separator + fileName;
//            System.out.println("删除测试:"+srcPath);
//            RecycleFile exsitfile = fileDao.findPath(srcPath);
//            if (exsitfile != null){
//                srcPath=srcPath +FileUtils.formatTime(System.currentTimeMillis());
//                File src = new File(getFileName(request, srcPath));
//                src.mkdir();
//                File dest = new File(getFileName(request, User.RECYCLE));
//                org.apache.commons.io.FileUtils.moveToDirectory(src, dest, true);
//                //存数据库
//            }else {
//                File dest = new File(getFileName(request, User.RECYCLE));
//                File src = new File(getFileName(request, srcPath));
//                org.apache.commons.io.FileUtils.moveToDirectory(src, dest, true);
//            }
//            //根据源文件相对地址拼接 绝对路径
//            //回收站
//
//
//            //调用commons  jar包中的moveToDirectory移动文件
//
//
//            String username = (String) request.getSession().getAttribute(User.NAMESPACE);
//            System.out.println("储存在数据库地址："+srcPath);
//            //保存删除信息
//            fileDao.insertFiles(srcPath,username);
//            /*--将删除文件移动到recycle目录下*/
//            // moveDirectory(request,currentPath,directoryName,User.RECYCLE);
//          //  System.out.println("回收站名字："+dest.getName());
//        }
        //重新计算文件大小
        //reSize(request);
        for (String fileName : directoryName) {
            //拼接源文件的地址
            String srcPath = currentPath + File.separator + fileName;
            //根据源文件相对地址拼接 绝对路径
            File src = new File(getFileName(request, srcPath));
            File dest = new File(getFileName(request, User.RECYCLE));
            //调用commons  jar包中的moveToDirectory移动文件
            org.apache.commons.io.FileUtils.moveToDirectory(src, dest, true);
            String username = (String) request.getSession().getAttribute(User.NAMESPACE);
            fileDao.insertFiles(srcPath, username);
            /*--将删除文件移动到recycle目录下*/
            // moveDirectory(request,currentPath,directoryName,User.RECYCLE);
        }
    }

    /**
     * 重命名文件
     */
    @Override
    public boolean renameDirectory(HttpServletRequest request, String currentPath, String srcName, String destName) {
        //根据源文件名  获取  源地址
        File file = new File(getFileName(request, currentPath), srcName);
        //同上
        File descFile = new File(getFileName(request, currentPath), destName);
        return file.renameTo(descFile);
    }

    /**
     * 复制
     */
    @Override
    public void copyDirectory(HttpServletRequest request, String currentPath, String[] directoryName,
                              String targetdirectorypath) throws Exception {
        // TODO Auto-generated method stub
        for (String srcName : directoryName) {
            //源文件对象
            File srcFile = new File(getFileName(request, currentPath), srcName);
            //目标文件对象
            File targetFile = new File(getFileName(request, targetdirectorypath), srcName);
            /* 处理目标目录中存在同名文件或文件夹问题 */
            String srcname = srcName;
            String prefixname = "";
            String targetname = "";
            if (targetFile.exists()) {
                String[] srcnamesplit = srcname.split("\\)");
                if (srcnamesplit.length > 1) {
                    String intstring = srcnamesplit[0].substring(1);
                    // pattern 属性规定验证字段的模式。
                    //模式指的是正则表达式。
                    Pattern pattern = Pattern.compile("[0-9]*");
                    Matcher isNum = pattern.matcher(intstring);
                    if (isNum.matches()) {
                        srcname = srcname.substring(srcnamesplit[0].length() + 1);
                    }
                }
                for (int i = 1; true; i++) {
                    prefixname = "(" + i + ")";
                    targetname = prefixname + srcname;
                    targetFile = new File(targetFile.getParent(), targetname);
                    if (!targetFile.exists()) {
                        break;
                    }
                }
                targetFile = new File(targetFile.getParent(), targetname);
            }
            /* 复制 */
            copyfile(srcFile, targetFile);

        }
    }

    /**
     * copy文件
     */
    private void copyfile(File srcFile, File targetFile) throws IOException {
        if (!srcFile.isDirectory()) {
            /* 如果是文件，直接复制 */
            //创建文件
            targetFile.createNewFile();
            //输入流
            FileInputStream src = (new FileInputStream(srcFile));
            //输出流
            FileOutputStream target = new FileOutputStream(targetFile);
            //分别获取到两个文件的文件通道
            FileChannel in = src.getChannel();
            FileChannel out = target.getChannel();
            //将源文件的文件通道直接和目标文件的文件通道进行连接，直接将数据写入到目标文件中区。不需要进行分别的读取和写入操作
            in.transferTo(0, in.size(), out);
            src.close();
            target.close();
        } else {
            /* 如果是文件夹，再遍历 */
            File[] listFiles = srcFile.listFiles();
            //创建文件夹
            targetFile.mkdir();
            for (File file : listFiles) {
                File realtargetFile = new File(targetFile, file.getName());
                copyfile(file, realtargetFile);
            }
        }
    }

    /**
     * 循环获取文件信息
     */
    @Override
    public SummaryFile summarylistFile(String realPath, int number) {
        File file = new File(realPath);
//文件复制移动实体类
        SummaryFile sF = new SummaryFile();

        List <SummaryFile> returnlist = new ArrayList <SummaryFile>();
//判断路径。isDirectory() 这个用来测试该对象存在且是一个目录文件，简单说该对象是一个文件夹，且不是空文件夹就返回true，否则返回false，
//isFile() 这个用来测试该对象存在且是一个文件，简单说该对象要是一个文件不能是文件夹，比如1.txt，就返回true，否则返回false，
        if (file.isDirectory()) {
            sF.setisFile(false);
            //判断是否为根文件夹
            if (realPath.length() <= number) {
                sF.setfileName("SmartBox");
                sF.setPath("");
            } else {
                String path = file.getPath();
                sF.setfileName(file.getName());
                //截取固定长度的字符串，从number开始到value.length-number结束.
                sF.setPath(path.substring(number));
            }
            /* 设置抽象文件夹的包含文件集合 */
            for (File filex : file.listFiles()) {
                //获取当前文件的路径，构造该文件
                SummaryFile innersF = summarylistFile(filex.getPath(), number);
//不存在文件，即还是目录
                if (!innersF.getisFile()) {
                    returnlist.add(innersF);
                }
            }
            sF.setListFile(returnlist);
            /* 设置抽象文件夹的包含文件夹个数 */
            sF.setListdiretory(returnlist.size());

        } else {
            sF.setisFile(true);
        }
        return sF;
    }

    /**
     * 分享文件
     *
     * @param request
     * @param currentPath
     * @param shareFile
     * @return
     * @throws Exception
     */
    @Override
    public String shareFile(HttpServletRequest request, String currentPath, String[] shareFile) throws Exception {
        String username = (String) request.getSession().getAttribute(User.NAMESPACE);
        String shareUrl = FileUtils.getUrl8();
        for (String file : shareFile) {
            Share share = new Share();
            share.setPath(currentPath + File.separator + file);
            share.setShareUser(username);
            share.setShareUrl(shareUrl);
            // 数据入库
            shareDao.shareFile(share);
        }
        return shareUrl;
    }

    /**
     * 查找分享
     *
     * @param request
     * @param shareUrl 分享url
     * @return
     * @throws Exception
     */
    public List <ShareFile> findShare(HttpServletRequest request, String shareUrl) throws Exception {
        Share share = new Share();
        share.setShareUrl(shareUrl);
        share.setStatus(Share.PUBLIC);
        List <Share> shares = shareDao.findShare(share);
        return getShareFile(request, shares);
    }

    /**
     * 获取分享文件列表
     *
     * @param request
     * @param shares  分享文件
     * @return
     */
    private List <ShareFile> getShareFile(HttpServletRequest request, List <Share> shares) {
        List <ShareFile> files = null;
        if (shares != null) {
            files = new ArrayList <>();
            String rootPath = request.getSession().getServletContext().getRealPath("/") + FilesServiceImpl.PREFIX;
            System.out.println("rootPath" + rootPath);
            for (Share share : shares) {
                //根据父类子类地址建文件夹
                File file = new File(rootPath + share.getShareUser(), share.getPath());
                //分享的实体类
                ShareFile shareFile = new ShareFile();

                shareFile.setFileType(FileUtils.getFileType(file));
                shareFile.setFileName(file.getName());
                shareFile.setFileSize(file.isFile() ? FileUtils.getDataSize(file.length()) : "-");
                shareFile.setLastTime(FileUtils.formatTime(file.lastModified()));
                shareFile.setShareUser(share.getShareUser());
                shareFile.setUrl(share.getShareUrl());
                shareFile.setFilePath(share.getPath());
                files.add(shareFile);
            }
        }
        return files;
    }

    /**
     * --回收站显示所有删除文件--
     */
    public List <RecycleFile> recycleFiles(HttpServletRequest request) throws Exception {
        //将本用户所有删除文件获取
        String username = (String) request.getSession().getAttribute(User.NAMESPACE);
        List <RecycleFile> recycleFiles = fileDao.selectFiles(username);

        for (RecycleFile file : recycleFiles) {
            //一次实例化所有文件对象
            String getRecyclePath = getFileName(request, User.RECYCLE);
            //File(String parent,String child):以父路径和子路径名字符串创建新的File实例。
            File f = new File(getRecyclePath, new File(file.getFilePath()).getName());
            //此时设置该文件名与文件最后删除的时间
            file.setFileName(f.getName());
            file.setLastTime(FileUtils.formatTime(f.lastModified()));
        }
        return recycleFiles;
    }

    /* 删除回收站的文件 */
    @Override
    public void delRecycle(HttpServletRequest request, int[] fileId) throws Exception {
//      if (fileId.length == 0){
//
//      }
        for (int i = 0; i < fileId.length; i++) {
            //获取每个删除文件的id，同时获取该文件对象
            RecycleFile selectFile = fileDao.selectFile(fileId[i]);
            //根据每个删除文件的相对路径拼接绝对路径，得到回收站的绝对路径getFileName(request, User.RECYCLE);
            //File(File parent,String child):以父抽象路径名和子路径名字符串创建新的File实例。
            File srcFile = new File(getFileName(request, User.RECYCLE), selectFile.getFilePath());
            //逐一删除数据库所存数据以及该文件，删库跑路！！！
            fileDao.deleteFile(fileId[i], (String) request.getSession().getAttribute(User.NAMESPACE));
            delFile(srcFile);
        }
        //reSize(request);
    }

    /**
     * 删除回收站文件
     */
    private void delFile(File srcFile) {
        /* 如果是文件，直接删除 */
        if (!srcFile.isDirectory()) {
            srcFile.delete();
            return;
        }
        /* 如果是文件夹，再遍历 */
        //循环删文件
        File[] listFiles = srcFile.listFiles();
        for (File file : listFiles) {
            if (file.isDirectory()) {
                delFile(file);
            } else {
                if (file.exists()) {
                    file.delete();
                }
            }
        }
        //删文件夹
        if (srcFile.exists()) {
            srcFile.delete();
        }
    }

    /**
     * 清空回收站
     */
    public void delAllRecycle(HttpServletRequest request) throws Exception {
        //获取回收站中的所有文件
        File file = new File(getFileName(request, User.RECYCLE));
        //遍历文件夹下所有文件
        File[] inferiorFile = file.listFiles();
        for (File f : inferiorFile) {
            delFile(f);
        }
        //根据用户进行删除
        fileDao.deleteFiles((String) request.getSession().getAttribute(User.NAMESPACE));
//        reSize(request);
    }

    /**
     * 还原文件
     */
    //难点2.还原文件时不等同于移动文件到，因为还原文件需要保存多个地址，而还原只单纯保存一个地址
    //而且还原时需要判断父子文件是否都删除了，此时就需要新建立父文件，再建立子文件，而commons.io.FileUtils
    //则可以很好的解决问题
    public void revertDirectory(HttpServletRequest request, int[] fileId) throws Exception {
        for (int id : fileId) {
            //根据要还原的文件id获得文件,id,username,panth
            RecycleFile file = fileDao.selectFile(id);
            //获取该文件的文件名
            String fileName = new File(file.getFilePath()).getName();
            //根据文件名获取源文件地址
            //根目录，子名字
            File src = new File(getFileName(request, User.RECYCLE), fileName);
            //getFileName获取该文件删除时所保存的地址
            File dest = new File(getFileName(request, file.getFilePath()));
            org.apache.commons.io.FileUtils.moveToDirectory(src, dest.getParentFile(), true);

            fileDao.deleteFile(id, (String) request.getSession().getAttribute(User.NAMESPACE));
        }
    }

    /**
     * 模糊查询
     */
    @Override
    public List <FileCustom> searchFile(HttpServletRequest request, String currentPath, String reg, String regType) {
        List <FileCustom> list = new ArrayList <>();
        System.out.println("模糊查询service");
        matchFile(request, list, new File(getFileName(request, currentPath)), reg, regType == null ? "" : regType);
        System.out.println("模糊查询service后");
        for (FileCustom a : list
                ) {
            System.out.println("查询结果：" + a.toString());
        }
        return list;
    }

    private void matchFile(HttpServletRequest request, List <FileCustom> list, File dirFile, String reg,
                           String regType) {
        //dirfile是当前文件即 new File(getFileName(request, currentPath))
        File[] listFiles = dirFile.listFiles();
        if (listFiles != null) {
            //递归文件
            for (File file : listFiles) {
                if (file.isFile()) {
                    String suffixType = FileUtils.getFileType(file);
                    if (suffixType.equals(regType) || (reg != null && file.getName().contains(reg))) {
                        //新建一个file实体类
                        FileCustom custom = new FileCustom();
                        custom.setFileName(file.getName());
                        custom.setLastTime(FileUtils.formatTime(file.lastModified()));
                        String parentPath = file.getParent();
                        System.out.println("查询parentPath;" + parentPath);
                        // I:\26_spring_springMVC_mybatis整合\out\artifacts\26_spring_springMVC_mybatis_war_exploded\WEB-INF\file\1234\image\111
                        //查询文件地址前image\111
                        String prePath = parentPath.substring(parentPath.indexOf(getFileName(request, null)) + getFileName(request, null).length());
                        System.out.println("查询文件地址前" + prePath);
                        custom.setCurrentPath(File.separator + prePath);
                        if (file.isDirectory()) {
                            custom.setFileSize("-");
                        } else {
                            custom.setFileSize(FileUtils.getDataSize(file.length()));
                        }
                        custom.setFileType(FileUtils.getFileType(file));
                        list.add(custom);
                    }
                } else {
                    if (file.getName().contains(reg)) {
                        FileCustom custom = new FileCustom();
                        custom.setFileName(file.getName());
                        custom.setLastTime(FileUtils.formatTime(file.lastModified()));
                        String parentPath = file.getParent();
                        System.out.println("文件夹查询parentPath;" + parentPath);
                        // I:\26_spring_springMVC_mybatis整合\out\artifacts\26_spring_springMVC_mybatis_war_exploded\WEB-INF\file\1234\image\111
                        //查询文件地址前image\111
                        String prePath = parentPath.substring(parentPath.indexOf(getFileName(request, null)) + getFileName(request, null).length());
                        System.out.println("查询文件地址前" + prePath);
                        custom.setCurrentPath(File.separator + prePath);
                        custom.setFileSize("-");
                        list.add(custom);
                    }
                    matchFile(request, list, file, reg, regType);
                }
            }
        }

    }
/**响应文件流
	 * */
    public void respFile(HttpServletResponse response, HttpServletRequest request, String currentPath, String fileName,
                         String type) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        File file = new File(getFileName(request, currentPath), fileName);
        InputStream inputStream = new FileInputStream(file);
        if ("docum".equals(type)) {
            IOUtils.copy(inputStream, response.getWriter(), "gbk");
        } else {
            IOUtils.copy(inputStream, response.getOutputStream());
        }
    }
}

