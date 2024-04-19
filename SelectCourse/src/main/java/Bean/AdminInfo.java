package Bean;

public class AdminInfo {
	private int AdminID;
	private String AdminAccount;
	private String AdminPassword;
	@Override
	public String toString() {
		return "AdminInfo [AdminID=" + AdminID + ", AdminAccount=" + AdminAccount + ", AdminPassword=" + AdminPassword
				+ "]";
	}
	public AdminInfo() {}
	public AdminInfo(int AdminID,String AdminAccount,String AdminPassword) {
		this.AdminID=AdminID;
		this.AdminAccount=AdminAccount;
		this.AdminPassword=AdminPassword;
	}
	public int getAdminID() {
		return AdminID;
	}
	public void setAdminID(int adminID) {
		AdminID = adminID;
	}
	public String getAdminAccount() {
		return AdminAccount;
	}
	public void setAdminAccount(String adminAccount) {
		AdminAccount = adminAccount;
	}
	public String getAdminPassword() {
		return AdminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		AdminPassword = adminPassword;
	}
	
}
