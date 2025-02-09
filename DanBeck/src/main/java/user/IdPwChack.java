package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

@WebServlet("/user/IdPwChack")
public class IdPwChack extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsersDaoGun dao = new UsersDaoGun();
		String idpwchack = "여부확인메시지";
		if(request.getParameter("id").equals("아이디찾기")) {
		
			idpwchack=dao.idCheck(request.getParameter("name"), request.getParameter("email"));
			System.out.println(idpwchack);

		}else {
			idpwchack=dao.pwCheck(request.getParameter("id"), request.getParameter("name"), request.getParameter("email"));
			System.out.println("아이디체크 두포스트진입:  "+request.getParameter("id"));
			
		}
		
		
		
		System.out.println("아이디체크 두포스트진입:  "+request.getParameter("name"));
		System.out.println("아이디체크 두포스트진입:  "+request.getParameter("email"));
	
		
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("message", idpwchack);
		
		dao.close();
	    response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(jsonObject.toString());
	}

}


