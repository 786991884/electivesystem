package cn.edu.sxau.electivesystem.service;

import java.util.List;

import cn.edu.sxau.electivesystem.entity.PageBean;
import cn.edu.sxau.electivesystem.entity.Student;
import cn.edu.sxau.electivesystem.entity.User;

public interface UserService {

	List<User> getAllUsers(User user);

	int getUserNums(User user);

	User getUserById(int id);

	boolean deleteUserById(int id);

	PageBean getPageUser(User user);

	User updateUser(User user);

	User saveUser(User user);

	boolean deleteUsersByIds(String ids);

	/**
	 * 用户登录验证
	 * 
	 * @param student
	 * @return
	 */
	User getUserByNameAndPwd(Student student);

	User changePassword(Student student);
}
