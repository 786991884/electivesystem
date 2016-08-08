package cn.edu.sxau.electivesystem.entity;

import java.io.Serializable;

/**
 * 学生课程关系实体
 * 
 */
public class StudentCourseR implements Serializable {
	private static final long serialVersionUID = -7756763524117554903L;
	private Integer id;
	private Student student;// 学生
	private Course course;// 课程
	private Float score;// 成绩
	private String evaluate;// 评价
	private Integer currentPage=1;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Float getScore() {
		return score;
	}

	public void setScore(Float score) {
		this.score = score;
	}

	public String getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(String evaluate) {
		this.evaluate = evaluate;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

}
