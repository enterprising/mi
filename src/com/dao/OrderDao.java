package com.dao;

import java.util.List;

import com.pojo.Address;
import com.util.DbUtil;

public class OrderDao {
	
	public boolean addAddress(int uid,String uname,String utel,String province,String city,String county,String detail,int postcode,String addxinxi){
		String sql = "insert into address(uid,uname,utel,province,city,county,detail,postcode,addxinxi) value(?,?,?,?,?,?,?,?,?)";
		int n = DbUtil.zsg(sql, uid,uname,utel,province,city,county,detail,postcode,addxinxi);
		if(n>0){
			return true;
		}else{
			return false;
		}
		
	}
	public List<Address> findall(int uid){
		//System.out.println(uid);
		String sql = "select * from address where uid = ?";
		List<Address> list = DbUtil.query(Address.class,sql,uid);
		return list;
	}

}
