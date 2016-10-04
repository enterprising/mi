package com.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.OrderDao;
import com.pojo.Address;
import com.pojo.User;

public class OrderServlet extends HttpServlet {

	OrderDao orderDao = new OrderDao();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if("adddz".equals(method)){
			doAddAddress(request,response);
		}
		if("jiesuan".equals(method)){
			doJiesuan(request,response);
		}
	}
	private void doJiesuan(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String price = request.getParameter("price");
		request.setAttribute("price", price);
		//System.out.println(price);
		User user = (User) request.getSession().getAttribute("user");
		if(user!=null){
			int uid = user.getUid();
			//System.out.println("uid="+uid);
			List<Address> addressList = orderDao.findall(uid);
			request.setAttribute("addressList", addressList);
			if(addressList.size()>0){
				//System.out.println("ok,查出来了");
			}
			request.getRequestDispatcher("order.jsp").forward(request, response);
		}else{
			try {
				response.getWriter().print("<script>alert('请先登录！');location='login.jsp'</script>");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	private void doAddAddress(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		User user = (User) request.getSession().getAttribute("user");
		if(user!=null){
		int uid = user.getUid();
		String uname = new String(request.getParameter("uname").getBytes("iso-8859-1"), "utf-8");
		
		System.out.println("uname="+uname);
		String utel = new String(request.getParameter("utel").getBytes("iso-8859-1"), "utf-8");
		String province = new String(request.getParameter("province").getBytes("iso-8859-1"), "utf-8");
		String city = new String(request.getParameter("city").getBytes("iso-8859-1"), "utf-8");
		String county = new String(request.getParameter("county").getBytes("iso-8859-1"), "utf-8");
		String detail = new String(request.getParameter("detail").getBytes("iso-8859-1"), "utf-8");
		String postcode2 = new String(request.getParameter("postcode").getBytes("iso-8859-1"), "utf-8");
		int postcode = Integer.parseInt(postcode2);
		String addxinxi =new String(request.getParameter("addxinxi").getBytes("iso-8859-1"), "utf-8");
		boolean f = orderDao.addAddress(uid, uname, utel, province, city, county, detail, postcode, addxinxi);
		if(f){
			System.out.println("成功！");
			response.setCharacterEncoding("utf-8");
		}else{
			response.setCharacterEncoding("utf-8");
			response.getWriter().print("<script>alert('新增地址失败');location='index.jsp'</script>");
			
		}
		}else{
			response.getWriter().print("<script>alert('请先登录！');location='login.jsp'</script>");
		}
		
	}
}
