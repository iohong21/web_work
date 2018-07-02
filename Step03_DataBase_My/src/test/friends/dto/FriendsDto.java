package test.friends.dto;

public class FriendsDto {
	private int num;
	private String name;
	private String phone;
	
	public FriendsDto() {}
	public FriendsDto(int num, String name, String phone) {
		this.num = num;
		this.name = name;
		this.phone = phone;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String addr) {
		this.phone = addr;
	}
	public Object[] toArray() {
		return new Object[]{ num, name, phone};
	}
}
