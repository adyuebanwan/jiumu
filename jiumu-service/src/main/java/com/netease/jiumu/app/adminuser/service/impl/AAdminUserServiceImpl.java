package com.netease.jiumu.app.adminuser.service.impl;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Component;
import com.netease.jiumu.app.adminuser.dao.AAdminUserDao;
import com.netease.jiumu.app.model.AAdminUser;
import com.netease.jiumu.app.adminuser.service.AAdminUserService;
@Component("aAdminUserService")
public class AAdminUserServiceImpl implements AAdminUserService{
	@Resource(name="aAdminUserDao")
	private AAdminUserDao aAdminUserDao;
	@Override
	public AAdminUser getAAdminUser(Long id) {
		Map<String,Object> query = new HashMap<String,Object>();
		query.put("id", id);
		return aAdminUserDao.getAAdminUser(query);
	}
	@Override
	public Long insertAAdminUser(AAdminUser entity) {
		return aAdminUserDao.insertAAdminUser(entity);
	}
	@Override
	public void updateAAdminUser(AAdminUser entity) {
		aAdminUserDao.updateAAdminUser(entity);
	}
	@Override
	public List<AAdminUser> getAAdminUserList(Map<String, Object> query) {
		return aAdminUserDao.getAAdminUserList(query);
	}
	@Override
	public Integer getAAdminUserListCount(Map<String, Object> query) {
		return aAdminUserDao.getAAdminUserListCount(query);
	}
	@Override
	public void truncateAAdminUser() {
		aAdminUserDao.truncateAAdminUser();
	}
	@Override
	public void deleteAAdminUser(Long id) {
		Map<String,Object> query = new HashMap<String,Object>();
		query.put("id", id);
		aAdminUserDao.deleteAAdminUser(query);
	}
	@Override
	public void batchInsertAAdminUser(List<AAdminUser> list) {
		aAdminUserDao.batchInsertAAdminUser(list);
	}
}
