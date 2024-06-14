package Bean;

public class ViewCourseInfo {
	private int StudentID;
	private String Name;
	private String major;
	private String ClassID;
	private String CourseName;
	private String TeacherName;
	public ViewCourseInfo() {}
	public ViewCourseInfo(int StudentID,String Name,String major,String ClassID,String CourseName,String TeacherName) {
		super();
		this.StudentID=StudentID;
		this.Name=Name;
		this.major=major;
		this.ClassID=ClassID;
		this.CourseName=CourseName;
		this.TeacherName=TeacherName;
	}
	public int getStudentID() {
		return StudentID;
	}
	public void setStudentID(int studentID) {
		StudentID = studentID;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getClassID() {
		return ClassID;
	}
	public void setClassID(String classID) {
		ClassID = classID;
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
	
	public String toString() {
		return "ViewCourseInfo [StudentID=" + StudentID + ", Name=" + Name + ", major=" + major + ", ClassID=" + ClassID
				+ ", CourseName=" + CourseName + ", TeacherName=" + TeacherName + "]";
	}
}
