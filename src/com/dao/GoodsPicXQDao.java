package com.dao;

import java.util.List;

import com.pojo.GoodsPicXQ;
import com.util.DbUtil;

public class GoodsPicXQDao {
	//得到图片
	public GoodsPicXQ findpic(int id){
		String sql = "select goodsid,goodspic1,goodspic2,goodspic3,goodspic4,goodspic5,goodspic6 from goodspicxq where goodsid = ?";
		List<GoodsPicXQ> list = DbUtil.query(GoodsPicXQ.class, sql, id);
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
}
