package com.pojo;

import java.io.Serializable;

public class Goods implements Serializable {
	private int goodsid;
	private String goodsname;
	private String goodsprice;
	private String goodsdesc;
	private int goodscount;
	private int goodsstatus;
	private String goodspic;

	public int getGoodsid() {
		return goodsid;
	}

	public void setGoodsid(int goodsid) {
		this.goodsid = goodsid;
	}

	public String getGoodsname() {
		return goodsname;
	}

	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}

	public String getGoodsprice() {
		return goodsprice;
	}

	public void setGoodsprice(String goodsprice) {
		this.goodsprice = goodsprice;
	}

	public String getGoodsdesc() {
		return goodsdesc;
	}

	public void setGoodsdesc(String goodsdesc) {
		this.goodsdesc = goodsdesc;
	}

	public int getGoodscount() {
		return goodscount;
	}

	public void setGoodscount(int goodscount) {
		this.goodscount = goodscount;
	}

	public int getGoodsstatus() {
		return goodsstatus;
	}

	public void setGoodsstatus(int goodsstatus) {
		this.goodsstatus = goodsstatus;
	}

	public String getGoodspic() {
		return goodspic;
	}

	public void setGoodspic(String goodspic) {
		this.goodspic = goodspic;
	}

	@Override
	public int hashCode() {
		// System.out.println("比了hashcode");
		return goodsid;
	}

	@Override
	public boolean equals(Object obj) {
		// System.out.println("比了equals");
		// (obj instanceof Goods) 判断obj 是不是Goods类的对象
		if (obj instanceof Goods) {
			if (((Goods) obj).getGoodsid() == this.goodsid) {
				return true;
			}
		}
		return false;
	}

}
