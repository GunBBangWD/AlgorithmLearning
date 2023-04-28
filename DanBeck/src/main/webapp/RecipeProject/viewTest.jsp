<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 레시피</title>
<link rel="styleSheet" href="../projectResources/css/RecipeView.css">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
   crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">   
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
.recipe_summary {
   position: relative;
   padding: 10px 18px 10px 24px;
   font-size: 16px;
   line-height: 170%;
   width: 950px;
   margin: 0 auto;
}

.review_user_info{
   display:flex;
}

.summary_in {
   position: relative;
   padding: 10px 18px 10px 24px;
   font-size: 16px;
   line-height: 170%;
   width: 90%;
   margin: 0 auto;
   text-align: center;
}

.summary_info {
    padding: 2px 15px 0;
    text-align: center;
    padding-bottom: 40px;
}

.divider {
    border-top: none;
    margin: 10px 0;
}

.recipe_image_wrapper {
    text-align: center;
}

.recipe_name {
    text-align: center;
    margin-top: 10px;
}

.recipe_image {
    width: 650px;
    height: 400px;
}

.ingredient_list {
  list-style: none;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}

.ingredient_list li {
  width: 48%;
  margin-bottom: 10px;
}

.step_title {
    font-size: 20px;
    font-weight: bold;
    margin: 0 0 20px 20px;
}

.recipe_title {
    font-size: 20px;
    font-weight: bold;
    margin: 0 0 20px 20px;
}
.comment {
  display: flex;
  flex-direction: column;
  margin-bottom: 10px;
}

.comment_user_info {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.comment_content {
  margin-top: 10px;
}
.stepDiv1 {
  display: flex;
  flex-direction: column;
}

.stepDiv1 li {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.step_left {
  flex: 1;
}

.step_right {
  margin-left: 20px;
}

</style>
</head>
<body>
   <div class="recipeView" style="background-color:lightgray;">
   
   
      <div class="recipe_summary">
      <div style="background-color: white; margin-bottom: 20px;">
         <h1 class="recipe_name">${recipeDto.recipe_name}</h1><br>
         <div class="recipe_image_wrapper"><img src="${pageContext.request.contextPath}/Storage/${recipeDto.recipe_image_url}" class="recipe_image"/></div><br>
         <div class="summary_in">${recipeDto.recipe_desc}</div><br>
         <div class="summary_info" style="opacity: 0.5;">
            <span>${recipeDto.recipe_people}</span>&nbsp&nbsp&nbsp <span>${recipeDto.recipe_time}</span>&nbsp&nbsp&nbsp
            <span>${recipeDto.recipe_difficulty}</span>
         </div></div>


      
      <hr>
      <div class="recipe_ingredient" style="background-color:white;">
        <div class="recipe_title">재료</div>
        <div class="recipe_type">
          <ul class="ingredient_list">
            <c:set var="has1" value="false" />
            <c:set var="has2" value="false" />
            <c:forEach var="ingre" items="${ingreList}">
              <li>
                <span>${ingre.ingredient_name}</span>&nbsp&nbsp&nbsp
                <span>${ingre.ingredient_amount}</span>
              </li>
            </c:forEach>
          </ul>
        </div>
      </div>

         
         
         
         <hr>
      <div class="recipe_step" style="background-color:white; margin-bottom: 20px;">
        <div class="step_title">조리순서</div>
        <div class="stepDiv1">
          <ul>
            <c:forEach var="stepList" items="${stepList}" varStatus="status">
              <li>
                <div class="step_left">${status.index + 1}. ${stepList.step_desc}</div>
                <div class="step_right"><img src="${pageContext.request.contextPath}/Storage/${stepList.step_image_url}" style="width: 150px;height: 150px; margin-right: 20px;"/></div>
              </li>
            </c:forEach>
          </ul>
          <br>
        </div>
      </div>

      <hr>

         <div class="recipe_review" >
            <div class="review_title">
               <h3>
                  요리 후기 <span>${ReviewCount}</span>
               </h3>
               <c:forEach var="ReviewList" items="${ReviewList}">
               <div class="review_user_info">
                  <h4>${ReviewList.user_nickname}</h4>&nbsp&nbsp&nbsp&nbsp
                  <span><fmt:formatDate value="${ReviewList.review_date}" pattern="yyyy-MM-dd hh:mm:ss"/></span>&nbsp&nbsp&nbsp&nbsp
                  <span>
                  평점 : <c:forEach var="i" begin="1" end="${ReviewList.review_rating}"><i class="fa fa-star" aria-hidden="true" style=" padding:0.1em;"></i></c:forEach>
                  </span>
               </div>
               <div class="review_content">
                  <p>${ReviewList.review_content} 
                  <c:forEach var="reviewImgList" items="${reviewImgList}">
                  <c:if test="${ReviewList.review_id==reviewImgList.review_id}"> 
                     <img src="${pageContext.request.contextPath}/Storage/${reviewImgList.img_image_url}" style="width:50px; height: 50px;"/>
                  </c:if>
                  </c:forEach></p>
               </div>
               </c:forEach>
            </div>
            <div class="writeReview">
            <input type="hidden" id="recipe_id" name="recipe_id" value="${recipeDto.recipe_id}"/>
            <button type="button" onclick="location.href='../project/writeReview.do?recipe_id=${recipeDto.recipe_id}'" type="button" id="writeReview" class="btn btn-outline-secondary">리뷰 작성하기</button>
            </div>
         </div>
         <br> <br><hr>

         <div class="recipe_comment" id="recipe_comment">
            <div class="comment_title">
               <div class="review_title">
                  <h3>
                     댓글<span>${commentCount}</span>
                  </h3>
                  <hr class="divider"/>
               <c:forEach var="commentList" items="${commentList}">
                 <div class="comment">
                   <div class="comment_user_info">
                     <h4>${commentList.user_nickname}</h4>
                     <c:if test="${sessionScope.user.user_idx==commentList.user_idx}">
                       <button type="button" class="delete_comment" data-comment-id="${commentList.comment_id}">삭제</button>
                     </c:if>
                   </div>
                   <div class="comment_content">
                     ${commentList.comment_content}
                   </div>
                 </div>
                 <hr class="divider"/>
               </c:forEach>



               </div>
            </div>
            <br><br>
            <div class="write_comment" >
               
                  <div class="row">
                     <textarea name="comment_content" class="form-control" rows="3" style="resize: none;" placeholder="무엇이 궁금하신가요? 댓글을 남겨주세요."></textarea>
                     <button type="submit" id="comment_submit" class="btn btn-outline-secondary">등록</button>
                  </div>
            </div>
         </div>
      </div>
   </div>
   
   <script>
   
/*    $(function(){
       $('#writeReview').on('click',function(){
           var url = '../project/writeReview.do?recipe_id=${recipeDto.recipe_id}'; 
           window.open(url, '리뷰 작성', 'width=700, height=600, left=100, top=50, scrollbar=yes, resizable=yes');
       });
   }); */
   
   $(document).ready(function() {
        $('#comment_submit').click(function() {
          var comment_content = $('.form-control').val();
          if(comment_content == '') {
            alert('댓글 내용을 입력해주세요.');
            return false;
          }
          var data = {
            recipe_id: '${recipeDto.recipe_id}',
            user_idx: '${sessionScope.user.user_idx}',
            comment_content: $('.form-control').val()
          };
          $.ajax({
            type: 'POST',
            url: '../project/commentWrite.do',
            data: data,
            dataType: 'json',
            success: function(response) {
              // 댓글 갱신
              var commentList = response;
              var commentCount = commentList.length;
              $('#recipe_comment .review_title span').text(commentCount);
              $('#recipe_comment .comment_user_info').remove();
              $('#recipe_comment .comment_content').remove();
              $('#recipe_comment .delete_comment').remove();
              $('.divider').remove();
              for(var i=0; i<commentCount; i++) {
                var comment = commentList[i];
                var html = '<div class="comment_user_info"><h4>' + comment.user_nickname + '</h4></div>';
              if (comment.user_idx == '${sessionScope.user.user_idx}') {
                 html += '<button type="button" class="delete_comment" data-comment-id="' + comment.comment_id + '">삭제</button>';
              }
                html += '<div class="comment_content">' + comment.comment_content + '</div>';
                html += '<hr class="divider">';
                $('#recipe_comment .review_title').append(html);
              }
              $('textarea[name=comment_content]').val('');
            },
            error: function(xhr, status, error) {
              console.log(error);
            }
          });
          return false;
        });
   });
   
   $(document).on('click', '.delete_comment', function() {
      var commentId = $(this).data('comment-id');
      var data = {
         comment_id: commentId,
         recipe_id: '${recipeDto.recipe_id}',
         user_idx: '${sessionScope.user.user_idx}',
      };
      $.ajax({
         type: 'POST',
         url: '../project/commentDelete.do',
         data: data,
         dataType: 'json',
      success: function(response) {
      // 댓글 갱신
      var commentList = response;
      var commentCount = commentList.length;
      $('#recipe_comment .review_title span').text(commentCount);
      $('#recipe_comment .comment_user_info').remove();
      $('#recipe_comment .comment_content').remove();
      $('#recipe_comment .delete_comment').remove();
      $('.divider').remove();
      console.log(commentCount);
      for (var i = 0; i < commentCount; i++) {
         var comment = commentList[i];
         var html = '<div class="comment_user_info"><h4>' + comment.user_nickname + '</h4>';
         if (comment.user_idx == '${sessionScope.user.user_idx}') {
         html += '<button type="button" class="delete_comment" data-comment-id="' + comment.comment_id + '">삭제</button>';
      }
         html += '</div>';
         html += '<div class="comment_content">' + comment.comment_content + '</div>';
         html += '<hr class="divider">';
         $('#recipe_comment .review_title').append(html);
      }
         $('textarea[name=comment_content]').val('');
      },
         error: function(xhr, status, error) {
         console.log(error);
      }
      });
      });
   </script>
</body>
</html>