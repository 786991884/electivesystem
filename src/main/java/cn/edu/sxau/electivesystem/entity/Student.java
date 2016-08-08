package cn.edu.sxau.electivesystem.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 学生实体
 * 
 */
public class Student implements Serializable {
	private static final long serialVersionUID = -8096984335764255453L;
	private Integer id;
	private String number;// 学号
	private String name;// 姓名
	private String password;// 密码
	private String sex;// 性别
	private String birthday;// 出生日期
	private String state;// 政治面貌
	private String telephone;// 电话
	private String address;// 家庭地址
	private String memo;// 备注信息
	private Set<StudentCourseR> studentCourseRs = new HashSet<>();// 所选课程
	private Integer currentPage = 1;
	private String msg;// 这个是提供登陆错误信息
	private String vcode;// 这个接收验证码
	private String password2;// 新密码
	private String rpassword2;// 重复新密码
	private Integer credit;
	private Integer roleId;// 身份标识

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Set<StudentCourseR> getStudentCourseRs() {
		return studentCourseRs;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public void setStudentCourseRs(Set<StudentCourseR> studentCourseRs) {
		this.studentCourseRs = studentCourseRs;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getVcode() {
		return vcode;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getPassword2() {
		return password2;
	}

	public Integer getCredit() {
		return credit;
	}

	public void setCredit(Integer credit) {
		this.credit = credit;
	}

	public String getRpassword2() {
		return rpassword2;
	}

	public void setRpassword2(String rpassword2) {
		this.rpassword2 = rpassword2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

}
