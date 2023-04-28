package recipe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import recipe.dao.RecipeReviewDao;

@WebServlet("/project/deleteReview.do")
public class ReviewDeleteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String review_id = req.getParameter("review_id");
		String recipe_id = req.getParameter("recipe_id");
		 RecipeReviewDao dao = new RecipeReviewDao();
		 int res = dao.deleteReview(review_id);

		 dao.close();
		 resp.sendRedirect("../project/recipeview.do?recipe_id=" + recipe_id);
	}
	
}
