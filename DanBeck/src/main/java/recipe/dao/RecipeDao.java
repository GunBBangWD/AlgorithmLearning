package recipe.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import DBpackage.DBConnectpool;
import recipe.dto.PageDto;
import recipe.dto.RecipeDto;

public class RecipeDao extends DBConnectpool {
	public RecipeDao() {
		super();
	}

	public int getCount(Map<String,Object> map) {
	    int count = 0;
	    String sql = "";
	    if (map.get("cat1") != null && (map.get("cat2") == null || map.get("cat2").equals(""))) {
	        sql += "SELECT COUNT(*) FROM recipe r INNER JOIN recipe_category_kind rck ON rck.category_kind_idx = r.cate1 AND rck.category_kind_type ='방법별' AND rck.category_kind_idx = "+map.get("cat1");
	    } else if((map.get("cat1") == null || map.get("cat1").equals("")) && map.get("cat2") != null) {
	        sql += "SELECT COUNT(*) FROM recipe r INNER JOIN recipe_category_kind rck ON rck.category_kind_idx = r.cate2 AND rck.category_kind_type ='재료별' AND rck.category_kind_idx =" +map.get("cat2");
	    } else if(map.get("cat1") != null && map.get("cat2") != null) {
	    	sql += "SELECT COUNT(*) FROM recipe r INNER JOIN recipe_category_kind rck ON rck.category_kind_idx = r.cate1 INNER JOIN recipe_category_kind rck2 ON rck2.category_kind_idx = r.cate2 WHERE rck.category_kind_type ='방법별' AND rck.category_kind_idx=" +map.get("cat1")+ " AND rck2.category_kind_type ='재료별' AND rck2.category_kind_idx ="+map.get("cat2");
	    }else{
	    	sql= "SELECT COUNT(*) FROM recipe r";
	    }
	    try {
	        psmt = con.prepareStatement(sql);
	        rs = psmt.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt(1);
	        }
	    } catch (Exception e) {
	        System.out.println("게시물 Count 조회중 에러");
	        e.printStackTrace();
	    }
	    return count;
	}


	public List<RecipeDto> getList(PageDto map) {
	    List<RecipeDto> list = new ArrayList<>();
	    String sql = "";
	    try {
	        if (map.getCat1() != null && (map.getCat2() == null || map.getCat2().equals(""))) {
	        	sql = "SELECT r.*, u.user_nickname FROM recipe r INNER JOIN users u ON u.user_idx = r.user_idx INNER JOIN recipe_category_kind rck ON rck.category_kind_idx = r.cate1 AND rck.category_kind_type ='방법별' AND rck.category_kind_idx = "+map.getCat1();
	        }else if((map.getCat1() == null || map.getCat1().equals("")) && map.getCat2() != null) {
	        	sql = "SELECT r.*, u.user_nickname FROM recipe r INNER JOIN users u ON u.user_idx = r.user_idx INNER JOIN recipe_category_kind rck ON rck.category_kind_idx = r.cate2 AND rck.category_kind_type ='재료별' AND rck.category_kind_idx =" +map.getCat2();
	        }else if(map.getCat1() != null && map.getCat2() != null) {
	            sql = "SELECT r.*, u.user_nickname FROM recipe r INNER JOIN users u ON u.user_idx = r.user_idx Inner join recipe_category_kind rck ON rck.category_kind_idx = r.cate1 INNER JOIN recipe_category_kind rck2 ON rck2.category_kind_idx = r.cate2 "
	            		+ "WHERE rck.category_kind_type ='방법별' AND rck.category_kind_idx=" +map.getCat1()+ " AND rck2.category_kind_type ='재료별' AND rck2.category_kind_idx =" +map.getCat2();
	        }else {
	        	sql = "SELECT r.*, u.user_nickname FROM recipe r INNER JOIN users u ON u.user_idx = r.user_idx";
	        }
	        sql += " ORDER BY recipe_id DESC LIMIT ?, ?";

	        System.out.println(sql);
	        psmt = con.prepareStatement(sql);
	        psmt.setInt(1, map.getStartNo());
	        psmt.setInt(2, map.getPageSize());
	        rs = psmt.executeQuery();
	        while (rs.next()) {
	            RecipeDto dto = new RecipeDto();
	            dto.setRecipe_id(rs.getString("recipe_id"));
	            dto.setUser_idx(rs.getString("user_idx"));
	            dto.setRecipe_name(rs.getString("recipe_name"));
	            dto.setRecipe_desc(rs.getString("recipe_desc"));
	            dto.setRecipe_people(rs.getString("recipe_people"));
	            dto.setRecipe_time(rs.getString("recipe_time"));
	            dto.setRecipe_difficulty(rs.getString("recipe_difficulty"));
	            dto.setRecipe_image_url(rs.getString("recipe_image_url"));
	            dto.setUser_nickname(rs.getString("user_nickname"));
	            dto.setCate1(rs.getString("cate1"));
	            dto.setCate2(rs.getString("cate2"));
				/* dto.setCategory_kind_name(rs.getString("category_kind_name")); */
	            dto.setRecipe_visitcount(rs.getInt("recipe_visitcount"));
	            list.add(dto);
	        }
	    } catch (SQLException e) {
	        System.out.println("RecipeDao getRecipeList Error : " + e.getMessage());
	    } finally {
	        close();
	    }

	    return list;
	}
	
	public void updateVisitCount(String recipe_id) {
		String sql = "UPDATE recipe SET recipe_visitcount = recipe_visitcount +1 WHERE recipe_id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, recipe_id);
			psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("조회수 증가 중 오류 발생");
			e.printStackTrace();
		}
	}

	public RecipeDto detailView(String recipe_id) {
		RecipeDto dto = new RecipeDto();
		String sql = "select * from recipe where recipe_id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, recipe_id);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setRecipe_id(rs.getString("recipe_id"));
				dto.setRecipe_name(rs.getString("recipe_name"));
				dto.setRecipe_desc(rs.getString("recipe_desc"));
				dto.setRecipe_people(rs.getString("recipe_people"));
				dto.setRecipe_time(rs.getString("recipe_time"));
				dto.setRecipe_difficulty(rs.getString("recipe_difficulty"));
				dto.setRecipe_image_url(rs.getString("recipe_image_url"));
			}
		} catch (Exception e) {
			System.out.println("상세보기 불러오기 중 DB 오류");
			e.printStackTrace();
		}
		return dto;
	}

	public List<String> suggestionKeyword(String recipe_name) {
		String sql = "select recipe_name from recipe where recipe_name like concat('%" + recipe_name + "%')";
		List<String> list = new ArrayList<>();
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (SQLException e) {
			System.out.println("실패");
			e.printStackTrace();
		}
		return list;
	}

	public int insertRecipe(RecipeDto dto) {
		int result = 0;
		String sql = "insert into recipe (user_idx,recipe_name,recipe_desc,recipe_people,recipe_time,recipe_difficulty,recipe_image_url,cate1,cate2) values(?,?,?,?,?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getUser_idx());
			psmt.setString(2, dto.getRecipe_name());
			psmt.setString(3, dto.getRecipe_desc());
			psmt.setString(4, dto.getRecipe_people());
			psmt.setString(5, dto.getRecipe_time());
			psmt.setString(6, dto.getRecipe_difficulty());
			psmt.setString(7, dto.getRecipe_image_url());
			psmt.setString(8, dto.getCate1());
			psmt.setString(9, dto.getCate2());

			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("실패");
			e.printStackTrace();
		}
		return result;
	}
	
	public int updateRecipe(RecipeDto dto) {
	    int result = 0;
	    String sql = "UPDATE recipe SET user_idx=?, recipe_name=?, recipe_desc=?, recipe_people=?, recipe_time=?, recipe_difficulty=?, recipe_image_url=? WHERE recipe_id=?";
	    System.out.println(sql);
	    System.out.println(dto);
	    try {
	        psmt = con.prepareStatement(sql);
	        psmt.setString(1, dto.getUser_idx());
	        psmt.setString(2, dto.getRecipe_name());
	        psmt.setString(3, dto.getRecipe_desc());
	        psmt.setString(4, dto.getRecipe_people());
	        psmt.setString(5, dto.getRecipe_time());
	        psmt.setString(6, dto.getRecipe_difficulty());
	        psmt.setString(7, dto.getRecipe_image_url());
	        psmt.setString(8, dto.getRecipe_id());
	        result = psmt.executeUpdate();
	    } catch (SQLException e) {
	        System.out.println("실패");
	        e.printStackTrace();
	    }
	    return result;
	}

	public String getLastRecipeId() {
		String lastIndex = "";
		String sql = "SELECT recipe_id FROM recipe WHERE recipe_id = (SELECT MAX(recipe_id) FROM recipe)";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next())
				lastIndex = rs.getString("recipe_id");
		} catch (Exception e) {
			System.out.println("게시글 마지막 index 조회중 DB 에러");
			e.printStackTrace();
		}
		return lastIndex;
	}
}
