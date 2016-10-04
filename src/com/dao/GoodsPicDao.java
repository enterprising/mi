package com.dao;

import java.util.List;

import com.pojo.GoodsPic;
import com.util.DbUtil;

public class GoodsPicDao {
	//得到图片信息
	public GoodsPic findpic(int id){
		String sql = "select goodsid,goodspic1,goodspic2,goodspic3,goodspic4 from goodspic where goodsid = ?";
		List<GoodsPic> list = DbUtil.query(GoodsPic.class, sql, id);
		
		if(list.size()>0){
			return list.get(0);
		}
		return null;
		
	}
}
