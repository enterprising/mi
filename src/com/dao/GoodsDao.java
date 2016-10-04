package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.pojo.Goods;
import com.util.DbUtil;

public class GoodsDao {
	
	public Goods findbyid(int id){
		String sql = "select goodsid,goodsname,goodsprice,goodsdesc,goodscount,goodsstatus,goodspic from goods where goodsid = ?";
		List<Goods> list = DbUtil.query(Goods.class, sql, id);
		if(list.size()>0){
			return list.get(0);
		}
		return null;

	}
	
	
	public Map fenye(int currentPage,int pageSize,String text){
		
		StringBuffer sb = new StringBuffer();
		List textlist = new ArrayList();
		
		if (text != null && text.length() > 0) {
			sb.append(" and goodsname like ? ");
			textlist.add("%" + text + "%");
		}
		
		Map map = new HashMap();
		String sql = "select count(*) from goods where 1=1 " + sb.toString();
		//根据用户输入要搜索的条件得到总记录条数
		int count = DbUtil.uniqueQuery(sql, textlist.toArray());
		//根据总记录条数 每页数 得到总页数
		int pageCount = count % pageSize == 0? count/pageSize:count/pageSize + 1;
		
		if (currentPage > pageCount) {
			currentPage = pageCount;
		}
		if (currentPage < 1) {
			currentPage = 1;
		}
		sb.append(" limit ?,?");
		textlist.add((currentPage - 1) * pageSize);
		textlist.add(pageSize);
		sql = "select goodsid,goodsname,goodsdesc,goodsprice,goodspic,goodscount,goodsstatus from goods where 1=1 "
				+ sb.toString();
		//System.out.println(sql);
		
		List<Goods> list = DbUtil.query(Goods.class, sql, textlist.toArray());
		
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		map.put("count", count);
		map.put("pageCount", pageCount);
		map.put("list", list);
		map.put("text", text);
		
		return map;
	}

}
