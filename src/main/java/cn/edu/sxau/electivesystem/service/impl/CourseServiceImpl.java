package cn.edu.sxau.electivesystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.sxau.electivesystem.constants.PageConstants;
import cn.edu.sxau.electivesystem.dao.CourseDao;
import cn.edu.sxau.electivesystem.entity.Course;
import cn.edu.sxau.electivesystem.entity.PageBean;
import cn.edu.sxau.electivesystem.entity.Teacher;
import cn.edu.sxau.electivesystem.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {
	@Autowired
	private CourseDao courseDao;

	@Override
	public Course saveCourse(Course course) {
		Teacher teacher = new Teacher();
		teacher.setId(course.getTeacherId());
		course.setTeacher(teacher);
		courseDao.save(course);
		return course;
	}

	@Override
	public boolean deleteCourseById(int id) {
		try {
			courseDao.delete(courseDao.getById(Course.class, id));
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteCoursesByIds(String ids) {
		try {
			String[] nids = ids.split(",");
			String hql = "delete Course c where c.id in (";
			for (int i = 0; i < nids.length; i++) {
				if (i > 0) {
					hql += ",";
				}
				hql += "'" + nids[i] + "'";
			}
			hql += ")";
			courseDao.executeHql(hql);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Course updateCourse(Course course) {
		Course course1 = courseDao.getById(Course.class, course.getId());
		course1.setName(course.getName());
		course1.setTime(course.getTime());
		course1.setPlace(course.getPlace());
		course1.setCredit(course.getCredit());
		course1.setSelnum(course.getSelnum());
		course1.setMemo(course.getMemo());
		Teacher teacher = new Teacher();
		if (course.getTeacherId() != null && !course.getTeacherId().equals("")) {
			teacher.setId(course.getTeacherId());
			course1.setTeacher(teacher);
		}else{
			course1.setTeacher(null);
		}
		
		return course;
	}

	@Override
	public Course getCourseById(int id) {
		return courseDao.getById(Course.class, id);
	}

	@Override
	public List<Course> getAllCourses(Course course) {
		String hql = "from Course c where 1=1";
		Map<String, Object> params = new HashMap<>();
		if (course.getName() != null && !course.getName().trim().equals("")) {
			hql += " and c.name like :name";
			params.put("name", "%%" + course.getName() + "%%");
		}
		if (course.getCredit() != null && course.getCredit() >= 0) {
			hql += " and c.credit>:credit";
			params.put("credit", course.getCredit());
		}
		return courseDao.find(hql, params, course.getCurrentPage(), PageConstants.MAX_PAGESIZE);
	}

	@Override
	public PageBean getPageCourse(Course course) {
		String hql = "from Course c where 1=1";
		Map<String, Object> params = new HashMap<>();
		if (course.getName() != null && !course.getName().trim().equals("")) {
			hql += " and c.name like :name";
			params.put("name", "%%" + course.getName() + "%%");
		}
		if (course.getCredit() != null && course.getCredit() >= 0) {
			hql += " and c.credit= :credit";
			params.put("credit", course.getCredit());
		}
		return courseDao.getPageBean(hql, params, course.getCurrentPage(), PageConstants.MAX_PAGESIZE);
	}

	@Override
	public int getCourseNums(Course course) {
		String hql = "from Course c where 1=1";
		Map<String, Object> params = new HashMap<>();
		if (course.getName() != null && !course.getName().trim().equals("")) {
			hql += " and c.name like :name";
			params.put("name", "%%" + course.getName() + "%%");
		}
		if (course.getCredit() != null && course.getCredit() >= 0) {
			hql += " and c.credit>:credit";
			params.put("credit", course.getCredit());
		}
		return courseDao.count(hql, params);
	}

	@Override
	public Integer selCourseNum(Course course) {
		Course c = courseDao.getById(Course.class, course.getId());
		Integer size = c.getStudentCourseRs().size();
		return size;
	}
}
