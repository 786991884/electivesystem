package cn.edu.sxau.electivesystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.sxau.electivesystem.constants.PageConstants;
import cn.edu.sxau.electivesystem.dao.StudentCourseRDao;
import cn.edu.sxau.electivesystem.entity.PageBean;
import cn.edu.sxau.electivesystem.entity.StudentCourseR;
import cn.edu.sxau.electivesystem.service.StudentCourseRService;

@Service
public class StudentCourseRServiceImpl implements StudentCourseRService {
	@Autowired
	private StudentCourseRDao studentCourseRDao;

	@Override
	public StudentCourseR saveStudentCourseR(StudentCourseR studentCourseR) {
		studentCourseRDao.save(studentCourseR);
		return studentCourseR;
	}

	@Override
	public boolean deleteStudentCourseRById(int id) {
		try {
			studentCourseRDao.delete(studentCourseRDao.getById(StudentCourseR.class, id));
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteStudentCourseRsByIds(String ids) {
		try {
			String[] nids = ids.split(",");
			String hql = "delete studentCourseRDao s where s.id in (";
			for (int i = 0; i < nids.length; i++) {
				if (i > 0) {
					hql += ",";
				}
				hql += "'" + nids[i] + "'";
			}
			hql += ")";
			studentCourseRDao.executeHql(hql);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public StudentCourseR updateStudentCourseR(StudentCourseR studentCourseR) {
		StudentCourseR studentCourseR1 = studentCourseRDao.getById(StudentCourseR.class, studentCourseR.getId());
		studentCourseR1.setScore(studentCourseR.getScore());
		return studentCourseR;
	}

	@Override
	public StudentCourseR getStudentCourseRById(int id) {
		return studentCourseRDao.getById(StudentCourseR.class, id);
	}

	@Override
	public List<StudentCourseR> getAllStudentCourseRs(StudentCourseR studentCourseR) {
		String hql = "from studentCourseRDao s where 1=1";
		Map<String, Object> params = new HashMap<>();
		if (studentCourseR.getScore() != null && !studentCourseR.getScore().equals("")) {
			hql += " and s.score like :score";
			params.put("score", "%%" + studentCourseR.getScore() + "%%");
		}
		return studentCourseRDao.find(hql, params, studentCourseR.getCurrentPage(), PageConstants.MAX_PAGESIZE);
	}

	@Override
	public PageBean getPageStudentCourseR(StudentCourseR studentCourseR) {
		String hql = "from studentCourseRDao s where 1=1";
		Map<String, Object> params = new HashMap<>();
		if (studentCourseR.getScore() != null && !studentCourseR.getScore().equals("")) {
			hql += " and s.score like :score";
			params.put("score", "%%" + studentCourseR.getScore() + "%%");
		}
		return studentCourseRDao.getPageBean(hql, params, studentCourseR.getCurrentPage(), PageConstants.MAX_PAGESIZE);
	}

	@Override
	public int getStudentCourseRNums(StudentCourseR studentCourseR) {
		String hql = "from studentCourseRDao s where 1=1";
		Map<String, Object> params = new HashMap<>();
		if (studentCourseR.getScore() != null && !studentCourseR.getScore().equals("")) {
			hql += " and s.score like :score";
			params.put("score", "%%" + studentCourseR.getScore() + "%%");
		}
		return studentCourseRDao.count(hql, params);
	}

}
