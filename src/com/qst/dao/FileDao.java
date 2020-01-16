package com.qst.dao;

import java.util.List;

import com.qst.po.RecycleFile;
import org.apache.ibatis.annotations.Param;

public interface FileDao {
	//插入文件删除之前路径以及归属的用户名
	void insertFiles(@Param("filePath") String filePath, @Param("userName") String userName) throws Exception;

	void deleteFiles(@Param("userName") String userName) throws Exception;

	void deleteFile(@Param("fileId") int fileId, @Param("userName") String userName) throws Exception;
	List<RecycleFile> selectFiles(@Param("userName") String userName) throws Exception;
	RecycleFile selectFile(@Param("fileId") int fileId) throws Exception;
	RecycleFile findPath(@Param("filePath") String filePath) throws Exception;
}
