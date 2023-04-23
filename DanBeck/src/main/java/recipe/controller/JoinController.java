package recipe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import recipe.dao.UsersDao;
import recipe.dto.UsersDto;
import recipe.utility.Alert;

@WebServlet("/project/join.do")
public class JoinController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("../RecipeProject/Join.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user_id=req.getParameter("user_id");
		String user_pw=req.getParameter("user_pw");
		String user_name=req.getParameter("user_name");
		String user_nickname=req.getParameter("user_nickname");
		String user_email=req.getParameter("user_email");
		String user_address=req.getParameter("user_address");
		String user_phone=req.getParameter("user_phone");
		
		UsersDto dto = new UsersDto();
		dto.setUser_id(user_id);
		dto.setUser_pw(user_pw);
		dto.setUser_name(user_name);
		dto.setUser_nickname(user_nickname);
		dto.setUser_email(user_email);
		dto.setUser_address(user_address);
		dto.setUser_phone(user_phone);
		UsersDao dao = new UsersDao();
		if(dao.joinUser(dto)==0) {
			dao.close();
			System.out.println("회원가입 실패");
			Alert.alertLocation(resp, "가입이 실패하였습니다", "../project/join.do");
		}else {
			dao.close();
			System.out.println("회원가입 성공");
			Alert.alertLocation(resp, "회원가입 성공", "../RecipeProject/Login.jsp");
		}
		
	}
}
