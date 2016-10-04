package com.dao;

import java.util.List;

import org.omg.CORBA.Request;

import com.pojo.Collect;
import com.pojo.User;
import com.util.DbUtil;

//写sql语句
public class UserDao {
	
	//登陆
	public boolean login(String username,String password){
		String sql = "select uid,username,password from User where username = ? and password = ?";
		List<User> list = DbUtil.query(User.class, sql, username,password);
		if(list.size()>0){
			return true;
		}else{
			return false;
		}
	}
	
	public List<User> getUser(String username,String password){
		String sql = "select uid,username,password from User where username = ? and password = ?";
		List<User> list = DbUtil.query(User.class, sql, username,password);
		return list;
		
	}
	//注册
	public int addUser(String username,String password){
		int n=0;
		String sql = "insert into user(username,password) value(?,?)";
		n = DbUtil.zsg(sql, username,password);
		//System.out.println(n);
		return n;
	}
	
	//ajax
	public List doajax(String username){
		List list = null;
		String sql = "select * from user where username = ?";
		list = DbUtil.query(User.class, sql, username);
		return list;
		
	}

	public boolean check(String username, String goodsid) {
		String sql = "select username,goodsid from collect where username=? and goodsid = ?";
		List<Collect> list = DbUtil.query(Collect.class, sql, username,goodsid);
		//System.out.println("商品ID为："+goodsid);
		if(list.size()>0){
			//System.out.println(list.get(0).getGoodsid());
			return true;
		}
		return false;	
	}

	public boolean addCol(String username, String goodsid,String goodsname,String goodspic,String goodsprice) {
		//System.out.println("商品名为："+goodsname);
		String sql = "insert into collect(username,goodsid,goodsname,goodspic,goodsprice) values(?,?,?,?,?)";
		int n = DbUtil.zsg(sql, username,goodsid,goodsname,goodspic,goodsprice);
		if(n>0){
			return true;
		}
		return false;
	}

	public List findCol(String username) {
		String sql = "select * from collect where username = ?";
		List list = DbUtil.query(Collect.class, sql, username);
		return list;
	}
	public boolean delCol(String username,int goodsid){
		String sql = "delete from collect where username=? and goodsid = ?";
		int n = DbUtil.zsg(sql, username,goodsid);
		if(n>0){
			//System.out.println("删除成功！");
			return true;
		}else{
			return false;
		}
	}
	
}
