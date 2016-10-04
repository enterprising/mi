package com.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.GoodsDao;
import com.dao.GoodsPicDao;
import com.dao.GoodsPicXQDao;
import com.dao.ScoreComparator;
import com.dao.ScoreComparator2;
import com.pojo.Goods;
import com.pojo.GoodsPic;
import com.pojo.GoodsPicXQ;

public class GoodsServlet extends HttpServlet {
	GoodsDao goodsDao = new GoodsDao();
	GoodsPicDao goodsPicDao = new GoodsPicDao();
	GoodsPicXQDao goodsPicXQdao = new GoodsPicXQDao();

	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if ("fenye".equals(method)) {
			doFenye(request, response);
		}
		if ("paixu".equals(method)) {
			doSort(request, response);
		}
		if ("paixu2".equals(method)) {
			doSort2(request, response);
		}
		if ("getdetailbyid".equals(method)) {
			doGetdetailbyid(request, response);
		}
		if ("addcar".equals(method)) {
			doAddCar(request, response);
		}
		if ("changenum".equals(method)) {
			doChangeNum(request, response);
		}
		if("removefromcar".equals(method)){
			doRemovefromcar(request,response);
		}
	}

	private void doRemovefromcar(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		String goodsid = request.getParameter("goodsid");
		//System.out.println(goodsid);
		//根据id找商品
		Goods goods = goodsDao.findbyid(Integer.parseInt(goodsid));
		Map<Goods, Integer> map = (Map<Goods, Integer>) request.getSession().getAttribute("map");
		map.remove(goods);
		try {
			response.sendRedirect("showCar.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void doChangeNum(HttpServletRequest request,
			HttpServletResponse response) {
		//System.out.println("yunxingle");
		HttpSession session = request.getSession();

		Map<Goods, Integer> map = (Map<Goods, Integer>) session
				.getAttribute("map");

		String goodsid = request.getParameter("goodsid");

		int id = Integer.parseInt(goodsid);

		Goods goods = goodsDao.findbyid(id);

		String op = request.getParameter("op");

		if ("a".equals(op)) {
			//System.out.println("+1");
			map.put(goods, map.get(goods) + 1);
		} else if ("b".equals(op)) {
			map.put(goods, map.get(goods) - 1);
		}

		session.setAttribute("map", map);

	}

	private void doAddCar(HttpServletRequest request,
			HttpServletResponse response) {
		String goodsid = request.getParameter("goodsid");
		String num = request.getParameter("num");
		//System.out.println("num="+num);
		// 集合中用商品对象作为键 以数量作为值
		Goods goods = goodsDao.findbyid(Integer.parseInt(goodsid));

		Map<Goods, Integer> map = (Map<Goods, Integer>) request.getSession()
				.getAttribute("map");

		if (map == null) {
			map = new HashMap<Goods, Integer>();
		}

		// 去购物车中取这次要购买的商品
		Integer num2 = map.get(goods);
		if (num2 == null) {
			map.put(goods, Integer.parseInt(num));
		} else {
			//System.out.println("Integer.parseInt(num)+num2="+(Integer.parseInt(num)+num2));
			map.put(goods, Integer.parseInt(num)+num2);
		}

		request.getSession().setAttribute("map", map);

	
		//request.getRequestDispatcher("showCar.jsp").forward(request,response);

		try {
			response.sendRedirect("showCar.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void doGetdetailbyid(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		if (Integer.parseInt(request.getParameter("id")) == 1) {
			request.getRequestDispatcher("ninote.jsp").forward(request,
					response);
		}
		String id = request.getParameter("id");
		int gid = Integer.parseInt(id);
		Goods goods = goodsDao.findbyid(gid);
		GoodsPic goodsPic = goodsPicDao.findpic(gid);
		GoodsPicXQ goodsPicXQ = goodsPicXQdao.findpic(gid);
		request.setAttribute("goods", goods);
		request.setAttribute("goodsPic", goodsPic);
		request.setAttribute("goodsPicXQ", goodsPicXQ);
		request.getRequestDispatcher("showDetail.jsp").forward(request,
				response);

	}

	private void doSort2(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		String goodsname = new String(request.getParameter("text").getBytes(
				"iso-8859-1"), "utf-8");
		int currentPage = 1;
		int pageSize = 12;

		String page = request.getParameter("page");
		String size = request.getParameter("size");
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		if (size != null) {
			pageSize = Integer.parseInt(size);
		}
		Map map = goodsDao.fenye(currentPage, pageSize, goodsname);
		List list = (List) map.get("list");
		ScoreComparator2 scoreComparator = new ScoreComparator2();
		Collections.sort(list, scoreComparator);
		// System.out.println("map的大小="+map.size());
		request.setAttribute("map", map);
		try {
			request.getRequestDispatcher("showFenye.jsp").forward(request,
					response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void doSort(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String goodsname = new String(request.getParameter("text").getBytes(
				"iso-8859-1"), "utf-8");
		int currentPage = 1;
		int pageSize = 12;

		String page = request.getParameter("page");
		String size = request.getParameter("size");
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		if (size != null) {
			pageSize = Integer.parseInt(size);
		}
		Map map = goodsDao.fenye(currentPage, pageSize, goodsname);
		List list = (List) map.get("list");
		ScoreComparator scoreComparator = new ScoreComparator();
		Collections.sort(list, scoreComparator);
		// System.out.println("map的大小="+map.size());
		request.setAttribute("map", map);
		try {
			request.getRequestDispatcher("showFenye.jsp").forward(request,
					response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void doFenye(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		String goodsname = new String(request.getParameter("text").getBytes(
				"iso-8859-1"), "utf-8");
		int currentPage = 1;
		int pageSize = 12;

		String page = request.getParameter("page");
		String size = request.getParameter("size");
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		if (size != null) {
			pageSize = Integer.parseInt(size);
		}
		Map map = goodsDao.fenye(currentPage, pageSize, goodsname);

		// System.out.println("map的大小="+map.size());
		request.setAttribute("map", map);
		try {
			request.getRequestDispatcher("showFenye.jsp").forward(request,
					response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
