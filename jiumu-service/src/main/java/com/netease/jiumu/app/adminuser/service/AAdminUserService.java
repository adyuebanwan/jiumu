package com.netease.jiumu.app.adminuser.service;
import java.util.List;
import java.util.Map;
import com.netease.jiumu.app.model.AAdminUser;
public interface AAdminUserService{
	AAdminUser getAAdminUser(Long id);
	Long insertAAdminUser(AAdminUser entity);
	void updateAAdminUser(AAdminUser entity);
	List<AAdminUser> getAAdminUserList(Map<String, Object> query);
	Integer getAAdminUserListCount(Map<String, Object> query);
	public void truncateAAdminUser();
	public void deleteAAdminUser(Long id);
	void batchInsertAAdminUser(List<AAdminUser> entity);
}
