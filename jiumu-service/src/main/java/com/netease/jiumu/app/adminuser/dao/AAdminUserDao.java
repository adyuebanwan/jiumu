package com.netease.jiumu.app.adminuser.dao;
import java.util.List;
import java.util.Map;
import com.netease.jiumu.app.model.AAdminUser;
public interface AAdminUserDao {
	AAdminUser getAAdminUser(Map<String, Object> query);
	Long insertAAdminUser(AAdminUser entity);
	void updateAAdminUser(AAdminUser entity);
	List<AAdminUser> getAAdminUserList(Map<String, Object> query);
	Integer getAAdminUserListCount(Map<String, Object> query);
	public void truncateAAdminUser();
	public void deleteAAdminUser(Map<String, Object> query);
	void batchInsertAAdminUser(List<AAdminUser> entity);
}
