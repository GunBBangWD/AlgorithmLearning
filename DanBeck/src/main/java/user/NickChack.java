package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

@WebServlet("/user/NickChack")
public class NickChack extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idchack = "닉네임 중복 여부 확인";
		System.out.println("닉네임체크 두포스트진입:  "+request.getParameter("nick"));
		UsersDaoGun dao = new UsersDaoGun();
		
		JsonObject jsonObject = new JsonObject();
		if(dao.nickDuplicateCheck(request.getParameter("nick"))) {
			System.out.println("닉네임중복없음");
			jsonObject.addProperty("nickchack", "닉네임중복없음");
		}else {
			System.out.println("닉네임중복");
			jsonObject.addProperty("nickchack", "닉네임중복");
		}
		dao.close();
	    response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(jsonObject.toString());
	}

}


