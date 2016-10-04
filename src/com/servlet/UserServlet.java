package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.pojo.User;

public class UserServlet extends HttpServlet {
	UserDao userDao = new UserDao();

	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if ("login".equals(method)) {
			doLogin(request, response);
		}
		if ("getUser".equals(method)) {
			doGetUser(request, response);
		}
		if ("ajax".equals(method)) {
			doAjax(request, response);
		}
		if ("ajax2".equals(method)) {
			doAjax2(request, response);
		}
		if ("register".equals(method)) {
			doRegister(request, response);
		}
		if ("tuichu".equals(method)) {
			doTuichu(request, response);
		}
		if ("addcol".equals(method)) {
			doAddCol(request, response);
		}
		if("showCollection".equals(method)){
			doShowCollection(request,response);
		}
		if("removefromcol".equals(method)){
			doRemovefromcol(request,response);
		}
	}

	private void doRemovefromcol(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("servlet");
		String goodsid = request.getParameter("goodsid");
		int id = Integer.parseInt(goodsid);
		//System.out.println("goodsid="+goodsid);
		User user = (User) request.getSession().getAttribute("user");
		String username = user.getUsername();
		//System.out.println("username="+username);
		boolean f = userDao.delCol(username, id);
		if(f){
			response.setCharacterEncoding("utf-8");
			response.getWriter().print("<script>删除成功！</script>");
			request.getRequestDispatcher("user.do?method=showCollection").forward(request, response);;	
		}else{
			response.getWriter().print("<script>删除失败！</script>");
			return ;
		}
	}

	private void doShowCollection(HttpServletRequest request,
			HttpServletResponse response) throws NullPointerException{
		User user = (User) request.getSession().getAttribute("user");
		if(user!=null){
		String username = user.getUsername();
		
		
		List list3 = userDao.findCol(username);
		
		//System.out.println("list3的大小为："+list3.size());
		request.setAttribute("list3", list3);
		try {
			request.getRequestDispatcher("collect.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}else{
			return;
		}
	}

	private void doAddCol(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		//System.out.println("购物车");
		User user = (User) request.getSession().getAttribute("user");
		String username = user.getUsername();
		//System.out.println(username);
		if (username == null) {
			try {
				response.getWriter().print("<script>alert('请先登录');location='login.jsp'</script>");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String goodsid = new String(request.getParameter("goodsid").getBytes(
				"iso-8859-1"), "utf-8");
		String goodsname = new String(request.getParameter("goodsname").getBytes(
				"iso-8859-1"), "utf-8");
		String goodsprice = new String(request.getParameter("goodsprice").getBytes(
				"iso-8859-1"), "utf-8");
		String goodspic = new String(request.getParameter("goodspic").getBytes(
				"iso-8859-1"), "utf-8");
		//如果登陆了 先判断该用户有没有收藏该商品
		//根据用户名查询商品
		boolean f = userDao.check(username,goodsid);
		response.setContentType("text/html;charset=utf-8");
		if(f){
			try {
				response.getWriter().print("<script>alert('您已经收藏该商品！');location='index.jsp'</script>");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		
		boolean c=userDao.addCol(username,goodsid,goodsname,goodspic,goodsprice);
		response.setContentType("text/html;charset=utf-8");
		if(c){
			//System.out.println("收藏成功！");
			response.getWriter().print("<script>alert('收藏成功！');location='user.do?method=showCollection';</script>");
		}else{
			//System.out.println("收藏失败！");
			response.getWriter().print("<script>alert('收藏失败！');location='index.jsp';</script>");
		}
		
	}

	private void doLogin(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		//System.out.println("ok");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//System.out.println(username);
		List<User> list = userDao.getUser(username, password);

		if (list.size() > 0) {
			// System.out.println("成功！");
			User user = list.get(0);
			request.getSession().setAttribute("user", user);
			try {
				request.getRequestDispatcher("index.jsp").forward(request,
						response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			response.setCharacterEncoding("utf-8");
			response.getWriter().print("<script> alert(\"登录失败\"); </script>");
		}
	}

	private void doTuichu(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("user");
		request.getRequestDispatcher("index.jsp").forward(request, response);

	}

	private void doRegister(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		int n = userDao.addUser(username, password);
		if (n > 0) {

			List<User> list = userDao.getUser(username, password);
			if (list.size() > 0) {
				User user = list.get(0);
				request.getSession().setAttribute("user", user);
				try {
					request.getRequestDispatcher("index.jsp").forward(request,
							response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} else {
			//System.out.println("注册失败");
		}

	}

	private void doAjax2(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// 鑾峰彇娉ㄥ唽椤甸潰杈撳叆鐨勯獙璇佺爜
		String code = request.getParameter("code");
		// 鑾峰彇session鏈嶅姟鍣ㄧ鐢熸垚鐨勯獙璇佺爜
		String truecode = (String) request.getSession().getAttribute("code");
		if (truecode.equalsIgnoreCase(code)) {
			response.getWriter().print("yes");
		} else {
			response.getWriter().print("no");
		}

	}

	private void doAjax(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		String username = request.getParameter("username");
		List list = userDao.doajax(username);
		if (list.size() > 0) {
			response.getWriter().print("no");
		} else {
			response.getWriter().print("yes");
		}

	}

	private void doGetUser(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		List<User> list = userDao.getUser(username, password);

		if (list.size() > 0) {
			// System.out.println("成功！");
			User user = list.get(0);
			request.getSession().setAttribute("user", user);
			try {
				request.getRequestDispatcher("index.jsp").forward(request,
						response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			response.getWriter().print("<script> alert(\"登录失败\"); </script>");
		}

	}
}
