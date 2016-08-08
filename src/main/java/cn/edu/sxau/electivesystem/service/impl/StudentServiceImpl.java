package cn.edu.sxau.electivesystem.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.sxau.electivesystem.constants.PageConstants;
import cn.edu.sxau.electivesystem.dao.StudentCourseRDao;
import cn.edu.sxau.electivesystem.dao.StudentDao;
import cn.edu.sxau.electivesystem.entity.Course;
import cn.edu.sxau.electivesystem.entity.PageBean;
import cn.edu.sxau.electivesystem.entity.Student;
import cn.edu.sxau.electivesystem.entity.StudentCourseR;
import cn.edu.sxau.electivesystem.service.StudentService;

import com.opensymphony.xwork2.ActionContext;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private StudentCourseRDao studentCourseRDao;

	@Override
	public Student saveStudent(Student student) {
		studentDao.save(student);
		return student;
	}

	@Override
	public boolean deleteStudentById(int id) {
		try {
			studentDao.delete(studentDao.getById(Student.class, id));
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteStudentsByIds(String ids) {
		try {
			String[] nids = ids.split(",");
			String hql = "delete Student s where s.id in (";
			for (int i = 0; i < nids.length; i++) {
				if (i > 0) {
					hql += ",";
				}
				hql += "'" + nids[i] + "'";
			}
			hql += ")";
			studentDao.executeHql(hql);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Student updateStudent(Student student) {
		Student student1 = studentDao.getById(Student.class, student.getId());
		student1.setName(student.getName());
		student1.setNumber(student.getNumber());
		student1.setPassword(student.getPassword());
		student1.setSex(student.getSex());
		student1.setBirthday(student.getBirthday());
		student1.setState(student.getState());
		student1.setTelephone(student.getTelephone());
		student1.setAddress(student.getAddress());
		student1.setMemo(student.getMemo());
		return student;
	}

	@Override
	public Student getStudentById(int id) {
		return studentDao.getById(Student.class, id);
	}

	@Override
	public List<Student> getAllStudents(Student student) {
		String hql = "from Student s where 1=1";
		Map<String, Object> params = new HashMap<>();
		if (student.getName() != null && !student.getName().trim().equals("")) {
			hql += " and s.name like :name";
			params.put("name", "%%" + student.getName() + "%%");
		}
		return studentDao.find(hql, params, student.getCurrentPage(), PageConstants.MAX_PAGESIZE);
	}

	@Override
	public PageBean getPageStudent(Student student) {
		String hql = "from Student s where 1=1";
		Map<String, Object> params = new HashMap<>();
		if (student.getName() != null && !student.getName().trim().equals("")) {
			hql += " and s.name like :name";
			params.put("name", "%%" + student.getName() + "%%");
		}
		return studentDao.getPageBean(hql, params, student.getCurrentPage(), PageConstants.MAX_PAGESIZE);
	}

	@Override
	public int getStudentNums(Student student) {
		String hql = "from Student s where 1=1";
		Map<String, Object> params = new HashMap<>();
		if (student.getName() != null && !student.getName().trim().equals("")) {
			hql += " and s.name like :name";
			params.put("name", "%%" + student.getName() + "%%");
		}
		return studentDao.count(hql, params);
	}

	@Override
	public Student getStudentByNumberAndPwd(Student student) {
		String hql = "from Student s where  s.number=:number and s.password=:password";
		Map<String, Object> params = new HashMap<>();
		params.put("number", student.getName());
		params.put("password", student.getPassword());
		return studentDao.getByHql(hql, params);
	}

	@Override
	public Student changePassword(Student student) {
		Student student1 = studentDao.getById(Student.class, student.getId());
		student1.setPassword(student.getPassword2());
		return student;

	}

	@Override
	public Student saveSelCourse(Student student) {
		Student s = (Student) ActionContext.getContext().getSession().get("admin");
		StudentCourseR scr = new StudentCourseR();
		scr.setStudent(s);
		Course course = new Course();
		course.setId(student.getId());
		scr.setCourse(course);
		studentCourseRDao.save(scr);
		Student byId = studentDao.getById(Student.class, s.getId());
		Hibernate.initialize(byId.getStudentCourseRs());
		byId.getStudentCourseRs().add(scr);
		return byId;
	}

	@Override
	public List<Course> getSelResult(Student student) {
		List<Course> courses = new ArrayList<>();
		Student s = (Student) ActionContext.getContext().getSession().get("admin");
		student = studentDao.getById(Student.class, s.getId());
		Set<StudentCourseR> studentCourseRs = student.getStudentCourseRs();
		for (StudentCourseR scr : studentCourseRs) {
			Course course = scr.getCourse();
			courses.add(course);
		}
		return courses;
	}

	@Override
	public void deleteSelCourse(Student student) {
		Student s = (Student) ActionContext.getContext().getSession().get("admin");
		s = studentDao.getById(Student.class, s.getId());
		Set<StudentCourseR> studentCourseRs = s.getStudentCourseRs();
		for (StudentCourseR scr : studentCourseRs) {
			if (scr.getCourse().getId() == student.getId()) {
				studentCourseRDao.delete(scr);
				break;
			}
		}
	}

	@Override
	public List<StudentCourseR> getScoreResult(Student student) {
		List<StudentCourseR> scrs = new ArrayList<>();
		Student s = (Student) ActionContext.getContext().getSession().get("admin");
		student = studentDao.getById(Student.class, s.getId());
		Set<StudentCourseR> studentCourseRs = student.getStudentCourseRs();
		for (StudentCourseR scr : studentCourseRs) {
			scrs.add(scr);
		}
		return scrs;
	}
}
