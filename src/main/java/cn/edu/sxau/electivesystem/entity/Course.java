package cn.edu.sxau.electivesystem.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 课程实体
 * 
 */
public class Course implements Serializable {

	private static final long serialVersionUID = -6771533350417997270L;
	private Integer id;
	private String name;// 课程名称
	private String time;// 上课时间
	private String place;// 上课地点
	private Integer credit;// 课程学分
	private String memo;// 备注信息
	private Teacher teacher;// 所属老师
	private Integer selnum;// 课程人数
	private Set<StudentCourseR> studentCourseRs = new HashSet<>();// 选课学生
	private Integer currentPage = 1;
	private Integer teacherId;
	private Integer selState = 0;// 选中状态标志

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Set<StudentCourseR> getStudentCourseRs() {
		return studentCourseRs;
	}

	public void setStudentCourseRs(Set<StudentCourseR> studentCourseRs) {
		this.studentCourseRs = studentCourseRs;
	}

	public Integer getCredit() {
		return credit;
	}

	public void setCredit(Integer credit) {
		this.credit = credit;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public Integer getSelnum() {
		return selnum;
	}

	public void setSelnum(Integer selnum) {
		this.selnum = selnum;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public Integer getSelState() {
		return selState;
	}

	public void setSelState(Integer selState) {
		this.selState = selState;
	}

}
