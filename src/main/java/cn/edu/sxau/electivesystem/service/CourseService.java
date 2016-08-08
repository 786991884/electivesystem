package cn.edu.sxau.electivesystem.service;

import java.util.List;

import cn.edu.sxau.electivesystem.entity.Course;
import cn.edu.sxau.electivesystem.entity.PageBean;

public interface CourseService {
	Course saveCourse(Course course);

	boolean deleteCourseById(int id);

	boolean deleteCoursesByIds(String ids);

	Course updateCourse(Course course);

	Course getCourseById(int id);

	List<Course> getAllCourses(Course course);

	PageBean getPageCourse(Course course);

	int getCourseNums(Course course);

	/**
	 * 根据课程查看所选该课程的人数
	 * 
	 * @param course
	 * @return
	 */
	Integer selCourseNum(Course course);
}
