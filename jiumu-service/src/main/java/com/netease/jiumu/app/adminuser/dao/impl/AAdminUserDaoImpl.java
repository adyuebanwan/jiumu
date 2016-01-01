package com.netease.jiumu.app.adminuser.dao.impl;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Component;
import org.mybatis.spring.SqlSessionTemplate;
import com.netease.jiumu.app.adminuser.dao.AAdminUserDao;
import com.netease.jiumu.app.model.AAdminUser;
@Component("aAdminUserDao")
public class AAdminUserDaoImpl   implements AAdminUserDao {
	
	@Resource(name="sqlSessionTemplate")
	private  SqlSessionTemplate  sqlSessionTemplate;
	@Override
	public AAdminUser getAAdminUser(Map<String, Object> query) {
		return sqlSessionTemplate.selectOne("AAdminUserMapper.getAAdminUser",query);
	}
	@Override
	public Long insertAAdminUser(AAdminUser entity) {
		sqlSessionTemplate.insert("AAdminUserMapper.insertAAdminUser",entity);
		return entity.getId();
	}
	@Override
	public void updateAAdminUser(AAdminUser entity) {
		sqlSessionTemplate.update("AAdminUserMapper.updateAAdminUser", entity);
	}
	@Override
	public List<AAdminUser> getAAdminUserList(Map<String, Object> query) {
		return sqlSessionTemplate.selectList("AAdminUserMapper.getAAdminUserList", query);
	}
	@Override
	public Integer getAAdminUserListCount(Map<String, Object> query) {
		return sqlSessionTemplate.selectOne("AAdminUserMapper.getAAdminUserListCount", query);
	}
	@Override
	public void truncateAAdminUser() {
		sqlSessionTemplate.delete("AAdminUserMapper.truncateAAdminUser");
	}
	@Override
	public void deleteAAdminUser(Map<String, Object> query) {
		sqlSessionTemplate.delete("AAdminUserMapper.deleteAAdminUser",query);
	}
    @Override
    public void batchInsertAAdminUser(List<AAdminUser> list) {
        sqlSessionTemplate.insert("AAdminUserMapper.batchInsertAAdminUser",list);
    }
}
