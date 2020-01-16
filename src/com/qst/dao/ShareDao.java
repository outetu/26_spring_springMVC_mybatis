package com.qst.dao;

import java.util.List;

import com.qst.po.Share;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface ShareDao {
	List<Share> findShare(Share share) throws Exception;
	
	List<Share> findShareByName(@Param("username") String username, @Param("status") int status) throws Exception;

	void shareFile(Share share) throws Exception;

	void cancelShare(@Param("url") String url, @Param("filePath") String filePath, @Param("status") int status) throws Exception;

}
