package cn.edu.sxau.electivesystem.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.sxau.electivesystem.entity.PageBean;
import cn.edu.sxau.electivesystem.entity.Teacher;
import cn.edu.sxau.electivesystem.service.TeacherService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class TeacherAction extends ActionSupport implements ModelDriven<Teacher> {
	private static final long serialVersionUID = 2159743949313337525L;
	private Teacher teacher = new Teacher();
	@Resource
	private TeacherService teacherService;
	private String ids;

	@Override
	public Teacher getModel() {
		return teacher;
	}

	public String teacherList() throws Exception {
		PageBean pageBean = teacherService.getPageTeacher(teacher);
		ActionContext.getContext().put("pageBean", pageBean);
		return SUCCESS;
	}

	public String teacherView() throws Exception {
		// 拿指定id的用户详细信息
		this.teacher = teacherService.getTeacherById(teacher.getId());
		return SUCCESS;
	}

	public String teacherEdit() throws Exception {
		this.teacher = teacherService.updateTeacher(teacher);
		return SUCCESS;
	}

	public String toTeacherEdit() throws Exception {
		this.teacher = teacherService.getTeacherById(teacher.getId());
		return SUCCESS;
	}

	public String teacherAdd() throws Exception {
		this.teacher = teacherService.saveTeacher(teacher);
		return SUCCESS;
	}

	public String toTeacherAdd() throws Exception {
		return SUCCESS;
	}

	public String teacherDel() throws Exception {
		boolean flag = teacherService.deleteTeacherById(teacher.getId());
		if (flag) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String teachersDel() throws Exception {
		boolean flag = teacherService.deleteTeachersByIds(ids);
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
