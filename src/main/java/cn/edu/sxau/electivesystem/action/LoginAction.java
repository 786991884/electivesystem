package cn.edu.sxau.electivesystem.action;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.sxau.electivesystem.entity.Student;
import cn.edu.sxau.electivesystem.entity.Teacher;
import cn.edu.sxau.electivesystem.entity.User;
import cn.edu.sxau.electivesystem.service.StudentService;
import cn.edu.sxau.electivesystem.service.TeacherService;
import cn.edu.sxau.electivesystem.service.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class LoginAction extends ActionSupport implements ModelDriven<Student> {
	private static final long serialVersionUID = -3191423208373591105L;
	private Student student = new Student();
	@Resource
	private StudentService studentService;
	@Resource
	private TeacherService teacherService;
	@Resource
	private UserService userService;

	@Override
	public Student getModel() {
		return student;
	}

	/**
	 * 用户登录到系统
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
		if (student.getRoleId() == 1) {// 学生
			if (student.getName() == null || student.getPassword() == null) {
				addFieldError("name", "用户名和密码必填！");
				return INPUT;
			}
			Student student1 = studentService.getStudentByNumberAndPwd(student);
			if (student1 != null) {
				// 合法用户，首先保存到Session,然后到合适页面
				ActionContext.getContext().getSession().put("admin", student1);
				ActionContext.getContext().getSession().put("roleId", 1);
				return SUCCESS;
			} else {
				addFieldError("password", "用户名或者密码错误");
			}
			return INPUT;
		} else if (student.getRoleId() == 2) {// 教师
			if (student.getName() == null || student.getPassword() == null) {
				addFieldError("name", "用户名和密码必填！");
				return INPUT;
			}
			Teacher teacher1 = teacherService.getTeacherByNameAndPwd(student);
			if (teacher1 != null) {
				// 合法用户，首先保存到Session,然后到合适页面
				ActionContext.getContext().getSession().put("admin", teacher1);
				ActionContext.getContext().getSession().put("roleId", 2);
				return SUCCESS;
			} else {
				addFieldError("password", "用户名或者密码错误");
			}
			return INPUT;
		} else {// 管理员
			if (student.getName() == null || student.getPassword() == null) {
				addFieldError("name", "用户名和密码必填！");
				return INPUT;
			}
			User user1 = userService.getUserByNameAndPwd(student);
			if (user1 != null) {
				// 合法用户，首先保存到Session,然后到合适页面
				ActionContext.getContext().getSession().put("admin", user1);
				ActionContext.getContext().getSession().put("roleId", 3);
				return SUCCESS;
			} else {
				addFieldError("password", "用户名或者密码错误");
			}
			return INPUT;
		}

	}

	/**
	 * 个人信息查看
	 */
	public String personalInfo() {
		Integer roleId = (Integer) ActionContext.getContext().getSession().get("roleId");
		if (roleId != null) {
			if (roleId == 1) {
				Student s = (Student) ActionContext.getContext().getSession().get("admin");
				ActionContext.getContext().put("info", s);
				return "studentInfo";
			} else if (roleId == 2) {
				Teacher teacher = (Teacher) ActionContext.getContext().getSession().get("admin");
				ActionContext.getContext().put("info", teacher);
				return "teacherInfo";
			} else {
				User user = (User) ActionContext.getContext().getSession().get("admin");
				ActionContext.getContext().put("info", user);
				return "userInfo";
			}
		}
		return null;
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
		Integer roleId = (Integer) ActionContext.getContext().getSession().get("roleId");
		if (roleId != null) {
			if (roleId == 1) {
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
			} else if (roleId == 2) {
				Teacher teacher1 = (Teacher) ActionContext.getContext().getSession().get("admin");
				if (!student.getPassword().equals(teacher1.getPassword())) {
					addFieldError("password", "原密码输入有误！");
					return INPUT;
				}
				if (!student.getPassword2().equals(student.getRpassword2())) {
					addFieldError("password2", "再次密码输入不一致!");
					return INPUT;
				}
				student.setId(teacher1.getId());
				teacherService.changePassword(student);
				Teacher t = new Teacher();
				BeanUtils.copyProperties(teacher1, t);
				teacher1.setPassword(student.getPassword2());
				ActionContext.getContext().getSession().put("admin", teacher1);
				return SUCCESS;
			} else {
				User user1 = (User) ActionContext.getContext().getSession().get("admin");
				if (!student.getPassword().equals(user1.getPassword())) {
					addFieldError("password", "原密码输入有误！");
					return INPUT;
				}
				if (!student.getPassword2().equals(student.getRpassword2())) {
					addFieldError("password2", "再次密码输入不一致!");
					return INPUT;
				}
				student.setId(user1.getId());
				userService.changePassword(student);
				User u = new User();
				BeanUtils.copyProperties(user1, u);
				user1.setPassword(student.getPassword2());
				ActionContext.getContext().getSession().put("admin", user1);
				return SUCCESS;
			}
		}
		return null;
	}

}
