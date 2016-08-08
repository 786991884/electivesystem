package cn.edu.sxau.electivesystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.sxau.electivesystem.constants.PageConstants;
import cn.edu.sxau.electivesystem.dao.TeacherDao;
import cn.edu.sxau.electivesystem.entity.PageBean;
import cn.edu.sxau.electivesystem.entity.Student;
import cn.edu.sxau.electivesystem.entity.Teacher;
import cn.edu.sxau.electivesystem.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService {
	@Autowired
	private TeacherDao teacherDao;

	@Override
	public Teacher saveTeacher(Teacher teacher) {
		teacherDao.save(teacher);
		return teacher;
	}

	@Override
	public boolean deleteTeacherById(int id) {
		try {
			teacherDao.delete(teacherDao.getById(Teacher.class, id));
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteTeachersByIds(String ids) {
		try {
			String[] nids = ids.split(",");
			String hql = "delete Teacher t where t.id in (";
			for (int i = 0; i < nids.length; i++) {
				if (i > 0) {
					hql += ",";
				}
				hql += "'" + nids[i] + "'";
			}
			hql += ")";
			teacherDao.executeHql(hql);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Teacher updateTeacher(Teacher teacher) {
		Teacher teacher1 = teacherDao.getById(Teacher.class, teacher.getId());
		teacher1.setName(teacher.getName());
		teacher1.setPassword(teacher.getPassword());
		teacher1.setSex(teacher.getSex());
		teacher1.setBirthday(teacher.getBirthday());
		teacher1.setArrivedate(teacher.getArrivedate());
		teacher1.setTelephone(teacher.getTelephone());
		teacher1.setMemo(teacher.getMemo());
		return teacher;
	}

	@Override
	public Teacher getTeacherById(int id) {
		return teacherDao.getById(Teacher.class, id);
	}

	@Override
	public List<Teacher> getAllTeachers(Teacher teacher) {
		String hql = "from Teacher t where 1=1";
		Map<String, Object> params = new HashMap<>();
		if (teacher.getName() != null && !teacher.getName().trim().equals("")) {
			hql += " and t.name like :name";
			params.put("name", "%%" + teacher.getName() + "%%");
		}
		return teacherDao.find(hql, params, teacher.getCurrentPage(), PageConstants.MAX_PAGESIZE);
	}

	@Override
	public PageBean getPageTeacher(Teacher teacher) {
		String hql = "from Teacher t where 1=1";
		Map<String, Object> params = new HashMap<>();
		if (teacher.getName() != null && !teacher.getName().trim().equals("")) {
			hql += " and t.name like :name";
			params.put("name", "%%" + teacher.getName() + "%%");
		}
		return teacherDao.getPageBean(hql, params, teacher.getCurrentPage(), PageConstants.MAX_PAGESIZE);
	}

	@Override
	public int getTeacherNums(Teacher teacher) {
		String hql = "from Teacher t where 1=1";
		Map<String, Object> params = new HashMap<>();
		if (teacher.getName() != null && !teacher.getName().trim().equals("")) {
			hql += " and t.name like :name";
			params.put("name", "%%" + teacher.getName() + "%%");
		}
		return teacherDao.count(hql, params);
	}

	@Override
	public List<Teacher> getAllTeachers() {
		String hql = "from Teacher t";
		return teacherDao.find(hql);
	}

	@Override
	public Teacher getTeacherByNameAndPwd(Student student) {
		String hql = "from Teacher t where  t.name=:name and t.password=:password";
		Map<String, Object> params = new HashMap<>();
		params.put("name", student.getName());
		params.put("password", student.getPassword());
		return teacherDao.getByHql(hql, params);
	}

	@Override
	public Teacher changePassword(Student student) {
		Teacher teacher1 = teacherDao.getById(Teacher.class, student.getId());
		teacher1.setPassword(student.getPassword2());
		return teacher1;
	}

}
