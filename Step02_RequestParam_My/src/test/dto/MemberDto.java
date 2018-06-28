package test.dto;

import java.util.ArrayList;
import java.util.List;

public class MemberDto {
	private int num;
	private String name;
	private String addr;
	
	public MemberDto() {}
	public MemberDto(int num, String name, String addr) {
		this.num = num;
		this.name = name;
		this.addr = addr;
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Object[] toArray() {
		return new Object[]{ num, name, addr};
	}
}
