package cn.edu.sxau.electivesystem.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.sxau.electivesystem.entity.Course;
import cn.edu.sxau.electivesystem.entity.PageBean;
import cn.edu.sxau.electivesystem.entity.Student;
import cn.edu.sxau.electivesystem.entity.StudentCourseR;
import cn.edu.sxau.electivesystem.service.CourseService;
import cn.edu.sxau.electivesystem.service.StudentService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class StudentAction extends ActionSupport implements ModelDriven<Student> {
	private static final long serialVersionUID = -4677270699399193500L;
	private Student student = new Student();
	@Resource
	private StudentService studentService;
	@Resource
	private CourseService courseService;
	private String ids;

	@Override
	public Student getModel() {
		return student;
	}

	/**
	 * 学生根据学号和密码进行登录
	 * 
	 * @return
	 */
	public String login() {
		// 进行验证码的判断
		String serverCode = (String) ActionContext.getContext().getSession().get(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		if (serverCode != null && !serverCode.equalsIgnoreCase(student.getVcode())) {
			addFieldError("vcode", "验证码输入错误");
			// addActionMessage("验证码错了");
			return INPUT;
		}
		if (student.getNumber() == null || student.getPassword() == null) {
			addFieldError("number", "学号和密码必填！");
			return INPUT;
		}
		Student student1 = studentService.getStudentByNumberAndPwd(student);
		if (student1 != null) {
			// 合法用户，首先保存到Session,然后到合适页面
			ActionContext.getContext().getSession().put("admin", student1);
			return SUCCESS;
		} else {
			addFieldError("password", "用户名或者密码错误");
		}
		return INPUT;
	}

	/**
	 * 个人信息查看
	 */
	public String personalInfo() {
		student = (Student) ActionContext.getContext().getSession().get("admin");
		return SUCCESS;
	}

	/**
	 * 到修改密码页面
	 */
	public String toChangePwd() {
		return SUCCESS;
	}

	/**
	 * 修改密码操作
	 */
	public String changePwd() {
		Student student1 = (Student) ActionContext.getContext().getSession().get("admin");
		if (!student.getPassword().equals(student1.getPassword())) {
			addFieldError("password", "原密码输入有误！");
			return INPUT;
		}
		if (!student.getPassword2().equals(student.getRpassword2())) {
			addFieldError("password2", "再次密码输入不一致!");
			return INPUT;
		}
		student.setId(student1.getId());
		studentService.changePassword(student);
		BeanUtils.copyProperties(student1, student);
		student.setPassword(student.getPassword2());
		ActionContext.getContext().getSession().put("admin", student);
		return SUCCESS;
	}

	public String studentList() throws Exception {
		PageBean pageBean = studentService.getPageStudent(student);
		ActionContext.getContext().put("pageBean", pageBean);
		return SUCCESS;
	}

	public String studentView() throws Exception {
		// 拿指定id的用户详细信息
		this.student = studentService.getStudentById(student.getId());
		return SUCCESS;
	}

	public String studentEdit() throws Exception {
		this.student = studentService.updateStudent(student);
		return SUCCESS;
	}

	public String toStudentEdit() throws Exception {
		this.student = studentService.getStudentById(student.getId());
		return SUCCESS;
	}

	public String studentAdd() throws Exception {
		this.student = studentService.saveStudent(student);
		return SUCCESS;
	}

	public String toStudentAdd() throws Exception {
		return SUCCESS;
	}

	public String studentDel() throws Exception {
		boolean flag = studentService.deleteStudentById(student.getId());
		if (flag) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String studentsDel() throws Exception {
		boolean flag = studentService.deleteStudentsByIds(ids);
		if (flag) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	/**
	 * 到学生选课界面
	 * 
	 * @return
	 */
	public String toSelCourse() {
		Course course = new Course();
		course.setName(student.getName());
		course.setCredit(student.getCredit());
		course.setCurrentPage(student.getCurrentPage());
		PageBean pageBean = courseService.getPageCourse(course);
		// 已选择课程查询
		@SuppressWarnings("unchecked")
		List<Course> list = pageBean.getRecordList();
		List<Course> courses = studentService.getSelResult(student);
		for (Course c : courses) {
			for (Course clist : list) {
				if (c.getId() == clist.getId()) {
					clist.setSelState(1);
				}
			}
		}
		ActionContext.getContext().put("pageBean", pageBean);
		return SUCCESS;
	}

	/**
	 * 学生选课
	 * 
	 * @return
	 */
	public String selCourse() {
		Course course = new Course();
		course.setId(student.getId());
		Integer selCourseNum = courseService.selCourseNum(course);
		Integer selNum = courseService.getCourseById(course.getId()).getSelnum();
		if (selCourseNum >= selNum) {
			return INPUT;
		}
		// 得到学生所选的课程
		List<Course> courseList = studentService.getSelResult(student);
		Integer totalcredit = 0;
		for (Course c : courseList) {
			totalcredit += c.getCredit();
		}
		Course newCourse = courseService.getCourseById(course.getId());
		totalcredit += newCourse.getCredit();
		if (totalcredit > 4) {
			return ERROR;
		}
		studentService.saveSelCourse(student);
		return SUCCESS;
	}

	/**
	 * 选课结果查看
	 * 
	 * @return
	 */
	public String selResult() {
		List<Course> courses = studentService.getSelResult(student);
		ActionContext.getContext().put("courses", courses);
		return SUCCESS;
	}

	/**
	 * 已选择课程删除
	 * 
	 * @return
	 */
	public String selCourseDel() {
		studentService.deleteSelCourse(student);
		return SUCCESS;
	}

	/**
	 * 已选择课程成绩查询
	 * 
	 * @return
	 */
	public String scoreResult() {
		List<StudentCourseR> studentCourseRs = studentService.getScoreResult(student);
		ActionContext.getContext().put("scr", studentCourseRs);
		return SUCCESS;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}
