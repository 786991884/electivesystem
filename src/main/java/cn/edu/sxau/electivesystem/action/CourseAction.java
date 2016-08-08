package cn.edu.sxau.electivesystem.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.sxau.electivesystem.entity.Course;
import cn.edu.sxau.electivesystem.entity.PageBean;
import cn.edu.sxau.electivesystem.entity.Teacher;
import cn.edu.sxau.electivesystem.service.CourseService;
import cn.edu.sxau.electivesystem.service.TeacherService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class CourseAction extends ActionSupport implements ModelDriven<Course> {

	private static final long serialVersionUID = -507812596967026954L;
	private Course course = new Course();
	@Resource
	private CourseService courseService;
	@Resource
	private TeacherService teacherService;
	private String ids;

	@Override
	public Course getModel() {
		return course;
	}

	public String courseList() throws Exception {
		PageBean pageBean = courseService.getPageCourse(course);
		ActionContext.getContext().put("pageBean", pageBean);
		return SUCCESS;
	}

	public String courseView() throws Exception {
		// 拿指定id的用户详细信息
		course = courseService.getCourseById(course.getId());
		return SUCCESS;
	}

	public String courseEdit() throws Exception {
		this.course = courseService.updateCourse(course);
		return SUCCESS;
	}

	public String toCourseEdit() throws Exception {
		// 准备数据
		List<Teacher> teacherList = teacherService.getAllTeachers();
		ActionContext.getContext().put("teacherList", teacherList);
		this.course = courseService.getCourseById(course.getId());
		return SUCCESS;
	}

	public String courseAdd() throws Exception {
		this.course = courseService.saveCourse(course);
		return SUCCESS;
	}

	public String toCourseAdd() throws Exception {
		// 准备数据
		List<Teacher> teacherList = teacherService.getAllTeachers();
		ActionContext.getContext().put("teacherList", teacherList);
		return SUCCESS;
	}

	public String courseDel() throws Exception {
		boolean flag = courseService.deleteCourseById(course.getId());
		if (flag) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String coursesDel() throws Exception {
		boolean flag = courseService.deleteCoursesByIds(ids);
		if (flag) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}
