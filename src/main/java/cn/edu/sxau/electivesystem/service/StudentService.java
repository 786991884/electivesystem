package cn.edu.sxau.electivesystem.service;

import java.util.List;

import cn.edu.sxau.electivesystem.entity.Course;
import cn.edu.sxau.electivesystem.entity.PageBean;
import cn.edu.sxau.electivesystem.entity.Student;
import cn.edu.sxau.electivesystem.entity.StudentCourseR;

public interface StudentService {
	/**
	 * 通过学号和密码获取学生
	 * 
	 * @param admin
	 * @return
	 */
	Student getStudentByNumberAndPwd(Student student);

	Student saveStudent(Student student);

	boolean deleteStudentById(int id);

	boolean deleteStudentsByIds(String ids);

	Student updateStudent(Student student);

	Student getStudentById(int id);

	List<Student> getAllStudents(Student student);

	PageBean getPageStudent(Student student);

	int getStudentNums(Student student);

	Student changePassword(Student student);

	/**
	 * 保存选课信息
	 * 
	 * @param student
	 * @return
	 */
	Student saveSelCourse(Student student);

	/**
	 * 获得选课结果
	 * 
	 * @param student
	 * @return
	 */
	List<Course> getSelResult(Student student);

	/**
	 * 删除选中的课程
	 * 
	 * @param student
	 */
	void deleteSelCourse(Student student);

	/**
	 * 查询课程成绩
	 * 
	 * @param student
	 * @return
	 */
	List<StudentCourseR> getScoreResult(Student student);

}
