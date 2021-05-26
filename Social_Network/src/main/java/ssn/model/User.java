package ssn.model;

public class User {
	private int userId;
	private String username;
	private String password;
	private String nameShowed;
	private int following;
	private int follower;
	private String avatar;
	private String email;
	private String phone;
	private String address;
	private int gender;
	private int isActivated;

	public User() {
	}

	public User(int userId, String username, String password, String nameShowed, int following, int follower,
			String avatar, String email, String phone, String address, int gender, int isActivated) {
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.nameShowed = nameShowed;
		this.following = following;
		this.follower = follower;
		this.avatar = avatar;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.gender = gender;
		this.isActivated = isActivated;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNameShowed() {
		return nameShowed;
	}

	public void setNameShowed(String nameShowed) {
		this.nameShowed = nameShowed;
	}

	public int getFollowing() {
		return following;
	}

	public void setFollowing(int following) {
		this.following = following;
	}

	public int getFollower() {
		return follower;
	}

	public void setFollower(int follower) {
		this.follower = follower;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getIsActivated() {
		return isActivated;
	}

	public void setIsActivated(int isActivated) {
		this.isActivated = isActivated;
	}
}
