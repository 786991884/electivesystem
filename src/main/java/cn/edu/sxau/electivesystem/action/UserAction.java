package cn.edu.sxau.electivesystem.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.sxau.electivesystem.entity.PageBean;
import cn.edu.sxau.electivesystem.entity.User;
import cn.edu.sxau.electivesystem.service.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User> {
	private static final long serialVersionUID = 1L;

	@Override
	public User getModel() {
		return user;
	}

	private User user = new User();
	private String ids;
	@Resource
	private UserService userService;

	public String userList() throws Exception {
		PageBean pageBean = userService.getPageUser(user);
		ActionContext.getContext().put("pageBean", pageBean);
		return SUCCESS;
	}

	public String userView() throws Exception {
		// 拿指定id的用户详细信息
		this.user = userService.getUserById(user.getId());
		return SUCCESS;
	}

	public String userEdit() throws Exception {
		this.user = userService.updateUser(user);
		return SUCCESS;
	}

	public String toUserEdit() throws Exception {
		this.user = userService.getUserById(user.getId());
		return SUCCESS;
	}

	public String userAdd() throws Exception {
		this.user = userService.saveUser(user);
		return SUCCESS;
	}

	public String toUserAdd() throws Exception {
		return SUCCESS;
	}

	public String userDel() throws Exception {
		boolean flag = userService.deleteUserById(user.getId());
		if (flag) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String usersDel() throws Exception {
		boolean flag = userService.deleteUsersByIds(ids);
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
