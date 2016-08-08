package cn.edu.sxau.electivesystem.service;

import java.util.List;

import cn.edu.sxau.electivesystem.entity.PageBean;
import cn.edu.sxau.electivesystem.entity.Student;
import cn.edu.sxau.electivesystem.entity.Teacher;

public interface TeacherService {
	Teacher saveTeacher(Teacher teacher);

	boolean deleteTeacherById(int id);

	boolean deleteTeachersByIds(String ids);

	Teacher updateTeacher(Teacher teacher);

	Teacher getTeacherById(int id);

	List<Teacher> getAllTeachers(Teacher teacher);

	PageBean getPageTeacher(Teacher teacher);

	int getTeacherNums(Teacher teacher);

	/**
	 * 获得所有老师
	 * 
	 * @return
	 */
	List<Teacher> getAllTeachers();

	/**
	 * 教师登录验证
	 * 
	 * @param student
	 * @return
	 */
	Teacher getTeacherByNameAndPwd(Student student);

	Teacher changePassword(Student student);
}
