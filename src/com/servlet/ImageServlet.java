package com.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImageServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String s = "abcdefghijklmnopqrstuvwxyz";

		Random random = new Random();

		char[] chs = new char[4];

		for (int i = 0; i < 4; i++) {
			int r = random.nextInt(26);
			char ch = s.charAt(r);
			chs[i] = ch;
		}

		String code = new String(chs);
		request.getSession().setAttribute("code", code);

		// 画验证码
		BufferedImage image = new BufferedImage(100, 30,
				BufferedImage.TYPE_INT_RGB);

		Graphics graphics = image.getGraphics();
		graphics.setColor(Color.yellow);
		graphics.fillRect(0, 0, 100, 30);
		graphics.setColor(Color.red);
		graphics.setFont(new Font("黑体", Font.BOLD, 20));

		graphics.drawString(code.charAt(0) + "", 10, 28);
		graphics.drawString(code.charAt(1) + "", 30, 25);
		graphics.drawString(code.charAt(2) + "", 50, 22);
		graphics.drawString(code.charAt(3) + "", 70, 26);

		graphics.drawLine(random.nextInt(100), random.nextInt(30), random
				.nextInt(100), random.nextInt(30));
		graphics.drawLine(random.nextInt(100), random.nextInt(30), random
				.nextInt(100), random.nextInt(30));
		graphics.drawLine(random.nextInt(100), random.nextInt(30), random
				.nextInt(100), random.nextInt(30));
		graphics.drawLine(random.nextInt(100), random.nextInt(30), random
				.nextInt(100), random.nextInt(30));
		
		OutputStream os = response.getOutputStream();
		ImageIO.write(image, "JPEG", os);
		os.close();
		
		
	}
}
