package com.dao;

import java.util.Comparator;

import com.pojo.Goods;

public class ScoreComparator implements Comparator{
	public int compare(Object o1, Object o2) {
		Goods goods1 = (Goods) o1;
		Goods goods2 = (Goods) o2;
		if(Integer.parseInt(goods1.getGoodsprice())>Integer.parseInt(goods2.getGoodsprice())){
			return -1;
		}else if(goods1.getGoodspic()==goods2.getGoodsprice()){
			return 0;
		}
		else{
			return 1;
		}
	}
}
