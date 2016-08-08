package cn.edu.sxau.electivesystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.sxau.electivesystem.constants.PageConstants;
import cn.edu.sxau.electivesystem.dao.UserDao;
import cn.edu.sxau.electivesystem.entity.PageBean;
import cn.edu.sxau.electivesystem.entity.Student;
import cn.edu.sxau.electivesystem.entity.User;
import cn.edu.sxau.electivesystem.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	@Autowired
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public List<User> getAllUsers(User user) {
		String hql = "from User u where 1=1";
		Map<String, Object> params = new HashMap<>();
		if (user.getName() != null && !user.getName().trim().equals("")) {
			hql += " and u.name like :name";
			params.put("name", "%%" + user.getName() + "%%");
		}
		if (user.getScore() != null && user.getScore() >= 0) {
			hql += " and u.score>:score";
			params.put("score", user.getScore());
		}
		return userDao.find(hql, params, user.getCurrentPage(), PageConstants.MAX_PAGESIZE);
	}

	@Override
	public int getUserNums(User user) {
		String hql = "select count(*) from User u where 1=1";
		Map<String, Object> params = new HashMap<>();
		if (user.getName() != null && !user.getName().trim().equals("")) {
			hql += " and u.name=:name";
			params.put("name", user.getName());
		}
		if (user.getScore() != null && user.getScore() >= 0) {
			hql += " and u.score>:score";
			params.put("score", user.getScore());
		}
		return userDao.count(hql, params);
	}

	@Override
	public User getUserById(int id) {
		return userDao.getById(User.class, id);
	}

	@Override
	public boolean deleteUserById(int id) {
		try {
			userDao.delete(userDao.getById(User.class, id));
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteUsersByIds(String ids) {
		// for (String id : ids.split(",")) {
		// User u = userDao.getById(User.class, id);
		// if (u != null) {
		// userDao.delete(u);
		// }
		// }
		try {
			String[] nids = ids.split(",");
			String hql = "delete User u where u.id in (";
			for (int i = 0; i < nids.length; i++) {
				if (i > 0) {
					hql += ",";
				}
				hql += "'" + nids[i] + "'";
			}
			hql += ")";
			userDao.executeHql(hql);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public PageBean getPageUser(User user) {
		String hql = "from User u where 1=1";
		Map<String, Object> params = new HashMap<>();
		if (user.getName() != null && !user.getName().trim().equals("")) {
			hql += " and u.name like :name";
			params.put("name", "%%" + user.getName() + "%%");
		}
		if (user.getScore() != null && user.getScore() >= 0) {
			hql += " and u.score>:score";
			params.put("score", user.getScore());
		}
		return userDao.getPageBean(hql, params, user.getCurrentPage(), PageConstants.MAX_PAGESIZE);
	}

	@Override
	public User updateUser(User user) {
		User user1 = userDao.getById(User.class, user.getId());
		user1.setEmail(user.getEmail());
		user1.setName(user.getName());
		return user;
	}

	@Override
	public User saveUser(User user) {
		userDao.save(user);
		return user;
	}

	@Override
	public User getUserByNameAndPwd(Student student) {
		String hql = "from User u where  u.name=:name and u.password=:password";
		Map<String, Object> params = new HashMap<>();
		params.put("name", student.getName());
		params.put("password", student.getPassword());
		return userDao.getByHql(hql, params);
	}

	@Override
	public User changePassword(Student student) {
		User user1 = userDao.getById(User.class, student.getId());
		user1.setPassword(student.getPassword2());
		return user1;
	}

}
