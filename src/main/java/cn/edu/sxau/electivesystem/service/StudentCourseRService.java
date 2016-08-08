package cn.edu.sxau.electivesystem.service;

import java.util.List;

import cn.edu.sxau.electivesystem.entity.PageBean;
import cn.edu.sxau.electivesystem.entity.StudentCourseR;

public interface StudentCourseRService {
	StudentCourseR saveStudentCourseR(StudentCourseR studentCourseR);

	boolean deleteStudentCourseRById(int id);

	boolean deleteStudentCourseRsByIds(String ids);

	StudentCourseR updateStudentCourseR(StudentCourseR studentCourseR);

	StudentCourseR getStudentCourseRById(int id);

	List<StudentCourseR> getAllStudentCourseRs(StudentCourseR studentCourseR);

	PageBean getPageStudentCourseR(StudentCourseR studentCourseR);

	int getStudentCourseRNums(StudentCourseR studentCourseR);
}
