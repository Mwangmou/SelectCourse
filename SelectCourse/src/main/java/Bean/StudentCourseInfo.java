package Bean;

public class StudentCourseInfo {
	private int ID;
	private int StudentID;
	private int CourseID;
	@Override
	public String toString() {
		return "StudentCourseInfo [ID=" + ID + ", StudentID=" + StudentID + ", CourseID=" + CourseID + "]";
	}
	public StudentCourseInfo() {}
	public StudentCourseInfo(int ID,int StudentID,int CourseID) {
		this.ID=ID;
		this.StudentID=StudentID;
		this.CourseID=CourseID;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public int getStudentID() {
		return StudentID;
	}
	public void setStudentID(int studentID) {
		StudentID = studentID;
	}
	public int getCourseID() {
		return CourseID;
	}
	public void setCourseID(int courseID) {
		CourseID = courseID;
	}
}
