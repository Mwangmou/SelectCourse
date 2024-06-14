package Bean;

public class CourseInfo {
	private int CourseID;
	private String CourseName;
	private String TeacherName;
	private String CoursePlace;
	private int AllStudent;
	private int StudentNum;
	private String CourseType;
	private String CourseTime;
	private String CourseCondition;
	@Override
	public String toString() {
		return "CourseInfo [CourseID=" + CourseID + ", CourseName=" + CourseName + ", TeacherName=" + TeacherName
				+ ", CoursePlace=" + CoursePlace + ", AllStudent=" + AllStudent + ", StudentNum=" + StudentNum
				+ ", CourseType=" + CourseType + ", CourseTime=" + CourseTime + ", CourseCondition=" + CourseCondition
				+ "]";
	}
	public CourseInfo() {}
	public CourseInfo(int CourseID,String CourseName,String TeacherName,String CoursePlace,int AllStudent,int StudentNum,String CourseType,String CourseTime,String CourseCondition) {
		super();
		this.CourseID=CourseID;
		this.CourseName=CourseName;
		this.TeacherName=TeacherName;
		this.CoursePlace=CoursePlace;
		this.AllStudent=AllStudent;
		this.StudentNum=StudentNum;
		this.CourseType=CourseType;
		this.CourseTime=CourseTime;
		this.CourseCondition=CourseCondition;
	}
	public int getCourseID() {
		return CourseID;
	}
	public void setCourseID(int courseID) {
		CourseID = courseID;
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
	public int getAllStudent() {
		return AllStudent;
	}
	public void setAllStudent(int allStudent) {
		AllStudent = allStudent;
	}
	public int getStudentNum() {
		return StudentNum;
	}
	public void setStudentNum(int studentNum) {
		StudentNum = studentNum;
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
	public String getCourseCondition() {
		return CourseCondition;
	}
	public void setCourseCondition(String courseCondition) {
		CourseCondition = courseCondition;
	}
	
}
