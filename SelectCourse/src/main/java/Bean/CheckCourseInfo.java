package Bean;

public class CheckCourseInfo {
	public CheckCourseInfo() {}
	private int CourseID;
	private String CourseName;
	@Override
	public String toString() {
		return "CheckCourseInfo [CourseID=" + CourseName + ", CourseName=" + CourseName + ", TeacherName=" + TeacherName + ", CoursePlace="
				+ CoursePlace + ", CourseType=" + CourseType + ", CourseTime=" + CourseTime + "]";
	}
	private String TeacherName;
	private String CoursePlace;
	private String CourseType;
	private String CourseTime;
	public CheckCourseInfo(int CourseID,String CourseName,String TeacherName,String CoursePlace,String CourseType,String CourseTime) {
		super();
		this.setCourseID(CourseID);
		this.CourseName=CourseName;
		this.TeacherName=TeacherName;
		this.CoursePlace=CoursePlace;
		this.CourseType=CourseType;
		this.CourseTime=CourseTime;
	}
	public String getCourseName() {
		return CourseName;
	}
	public void setCourseName(String courseName) {
		CourseName = courseName;
	}
	public String getTeacherName() {
		return TeacherName;
	}
	public void setTeacherName(String teacherName) {
		TeacherName = teacherName;
	}
	public String getCoursePlace() {
		return CoursePlace;
	}
	public void setCoursePlace(String coursePlace) {
		CoursePlace = coursePlace;
	}
	public String getCourseType() {
		return CourseType;
	}
	public void setCourseType(String courseType) {
		CourseType = courseType;
	}
	public String getCourseTime() {
		return CourseTime;
	}
	public void setCourseTime(String courseTime) {
		CourseTime = courseTime;
	}
	public int getCourseID() {
		return CourseID;
	}
	public void setCourseID(int courseID) {
		CourseID = courseID;
	}
	
}
