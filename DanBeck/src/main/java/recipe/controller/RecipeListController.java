package recipe.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import recipe.dao.RecipeCategoryKindDao;
import recipe.dao.RecipeDao;
import recipe.dto.PageDto;
import recipe.dto.RecipeCategoryKindDto;
import recipe.dto.RecipeDto;

@WebServlet("/project/recipeList.do")
public class RecipeListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RecipeCategoryKindDao rckDao= new RecipeCategoryKindDao();
		List<RecipeCategoryKindDto> cate1 = new ArrayList<>();
		List<RecipeCategoryKindDto> cate2 = new ArrayList<>();
		cate1 = rckDao.cateList("방법별");
		cate2 = rckDao.cateList("재료별");
		rckDao.close();
		int currentPage;
		RecipeDao dao = new RecipeDao();
		List<RecipeDto> list;
		int totalCount;
		int pageSize = 10;
		String page=request.getParameter("page");
		if(page==null || page.trim().length()==0) currentPage=1;
		else currentPage = Integer.parseInt(page);
		
		String cat1 = request.getParameter("cate1");
		String cat2 = request.getParameter("cate2");
		System.out.println(cat1);
		System.out.println(cat2);
		Map<String, Object> map = new HashMap<>();
		map.put("cat1", cat1);
		map.put("cat2", cat2);
		/*
		 * if(cat1!=null && cat2== null) { map.put("cat1",cat1); }else if(cat1== null &&
		 * cat2 != null) { map.put("cat2",cat2); }else if(cat1!=null&& cat2!=null) {
		 * map.put("cat1",cat1); map.put("cat2",cat2); }
		 */
		// 총 게시글 수를 구합니다.
		totalCount= dao.getCount(map);
		

		// 현재 페이지 정보를 바탕으로 페이징 정보를 계산합니다.
		PageDto pageDto = new PageDto(currentPage, totalCount, pageSize, cat1, cat2);
		
		// 해당 페이지에 해당하는 게시글 리스트를 DAO를 통해 조회합니다.
		list = dao.getList(pageDto);
		// 검색어와 검색 필드, 페이징 정보를 Attribute로 설정하고 JSP로 forward합니다.
		request.setAttribute("cate1", cate1);
		request.setAttribute("cate2", cate2);
		request.setAttribute("list", list);
		request.setAttribute("page", pageDto);
		dao.close();
		request.getRequestDispatcher("../RecipeProject/RecipeList.jsp").forward(request, response);
	}
}