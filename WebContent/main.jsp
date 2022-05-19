<%@page import="com.model.AnswerDAO"%>
<%@page import="com.model.AnswerVO"%>
<%@page import="com.model.QuesVO"%>
<%@page import="com.model.QuesDAO"%>
<%@page import="com.model.PostVO"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="com.model.PostDAO"%>
<%@page import="com.model.ProductVO"%>
<%@page import="com.model.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.MemberDAO"%>
<%@page import="com.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>Good Spice</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/noscript.css" />
	</head>
	<body class="is-preload">
	<%   
	// 회원
	   MemberVO vo = (MemberVO) session.getAttribute("member");
	   MemberDAO dao = new MemberDAO();
	   ArrayList<MemberVO> al = dao.selectAll();
	   
	// 제품
	   ProductDAO Pdao = new ProductDAO();
	   ArrayList<ProductVO> Pal =new ArrayList<ProductVO>();
	   boolean ch = true;
	   if(vo!=null){
	      Pal = Pdao.selectAll(vo.getid());
	   }
	   
	// 게시판
	   PostDAO Postdao = new PostDAO();
	   ArrayList<PostVO> Postal = Postdao.PostList();
	   
	// 질문
	   QuesDAO Qdao = new QuesDAO();
	   ArrayList<QuesVO> Qal = Qdao.QuesList();
	   
	// 댓글
	   AnswerDAO Adao = new AnswerDAO();
	   ArrayList<AnswerVO> Aal = Adao.AnswerList();
	   %>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="logo">
							<span class="icon fa-gem"></span>
						</div>
						<div class="content">
							<div class="inner">
				               <h1>Smart Spice</h1>
				               <p>May your life be happy with this Spice</p>
				               <%if (vo != null) {%>
				               <%String GetId = vo.getid();%>
				                  <% if (GetId.equals("admin")) {%>
				                     <h2>관리자님 환영합니다</h2>
				                  <%} else {%>
				                  <h2><%=vo.getid() %>님 환영합니다</h2>
				                  <%} %>
				               <%} %>
				            </div>
						</div>
						
						
						<nav>
							<ul>
								<!-- 기본 메뉴 : Intro, Recipe(한식, 중식, 양식, 일식), Post, Q&A -->
								<li><a href="#intro">Intro</a></li>
								<li><select  id="select" onclick="menu()" 
												onchange="if(this.value) location.href=(this.value);">
					                    <option disabled selected>Recipe</option>
					                    <option value="#KOREA">한식</option>
					                    <option value="#CHINA">중식</option>
					                    <option value="#USA">양식</option>
					                    <option value="#JAPAN">일식</option>
				              		</select>
				              	</li>
								<li><a href="#POST">Post</a></li>
				                <li><a href="#QNA">Q&A</a></li>
								
								<!-- 로그인하지 않은 경우 : + Login, Join-->
				                <%if (vo == null) {%>
				               	<li><a href="#Login">Login</a></li>
				               	<li><a href="#Join">Join</a></li>
				               
				               	<%} else {%>
				               	<!-- 로그인 한 경우 : + Logout -->
				               	<% String GetId = vo.getid(); %>
				               	
				               		<!-- 로그인한 아이디가 admin인 경우 : + Adimn(레시피, 회원정보) -->
				                	<%if (GetId.equals("admin")) {%>
				                  	<li>
				                  		<select id="Adminpage" onclick="admin()"
				                  				onchange="if(this.value) location.href=(this.value);">
				                      		<option disabled selected>Admin</option>
				                        	<option value="#recipepost">레시피</option>
				                        	<option value="#MemberInfo">회원정보</option>
				                  		</select>
				                  	</li>
				   
				   					<!-- 로그인한 아이디가 일반 회원인 경우 : + Mypage(정보수정, 기기관리) -->
				   					<%} else { %>
				                  	<li>
				                  		<select id="selMypage" onclick="info()"
				                     			onchange="if(this.value) location.href=(this.value);">
				                     
				                        	<option disabled selected>Mypage</option>
				                       		<option value="#ChangeInfo">정보수정</option>
				                        	<option value="#Product">기기관리</option>
				                  		</select>
				                  	</li>
				                  	<% } %>
				                   	<li><a href="LogoutService">Logout</a></li>
				            	<%}%>
							</ul>
						</nav>
					</header>



				<!-- Main -->
					<div id="main">


						<!-- Intro 제품소개 -->
					         <article id="intro">
					            <h2 class="major">제품소개</h2>
					            <span class="image main"><img src = "images/goodspice.jpg"></span>
					            <P align = "center">저희 "<b>스마트 양념통</b>"은 요리를 보다 맛있게 만들기 위해 구상된 제품입니다.<br> 
					            					요리시 가장 어려운 간 맞추는일을 보다 간편하게,<br>
					            					보다 완벽하게 할 수 있도록 돕는 기능 할 것입니다.</P>
					            <p align = "center"><b>당신의 식탁에 행복이 가득하기를 바랍니다.</b></p>
					            <p align = "center">구매처 : <a href="https://www.smhrd.or.kr/">스마트인재개발원</a></p>
					         </article>
					
				
					   <!-- Recipe 한식 -->
					         <article id="KOREA">
					            <h2 class="major">한식</h2>
					
					            <div style="text-align: right;">
					               <a href="#CHINA">중식&ensp;</a>
					               <a href="#USA">양식&ensp;</a>
					               <a href="#JAPAN">일식</a>
					            </div>
					            
					            <span class="image main"> 김치찌개 <a href="#kimchi"><img src="images/KOREA.jfif"></a></span> 
					            <span class="image main"> 된장찌개 <a href="#beensoup"><img src="images/been.jpg"></a></span> 
					            <span class="image main"> 김치볶음밥 <a href="#kimbok"><img src="images/bokk.jpg"></a></span>
					         </article>
					
						<!-- Recipe 중식 -->
					         <article id="CHINA">
					            <h2 class="major">중식</h2>
					
					            <div style="text-align: right;">
					               <a href="#KOREA">한식&ensp;</a>
					               <a href="#USA">양식&ensp;</a> 
					               <a href="#JAPAN">일식</a>
					            </div>
					            
					            <span class="image main"> 짜장면 <a href=#jja><img src="images/CHINA.jfif"></a></span> 
					            <span class="image main"> 짬뽕 <a href=#bbong><img src="images/jjam.jfif"></a></span> 
					            <span class="image main"> 탕수육 <a href=#tangsu><img src="images/tang.jfif"></a></span>
					         </article>
					
				 		<!-- Recipe 양식 -->
					         <article id="USA">
					            <h2 class="major">양식</h2>
					
					            <div style="text-align: right;">
					               <a href="#CHINA">중식&ensp;</a>
					               <a href="#KOREA">한식&ensp;</a>
					               <a href="#JAPAN">일식</a>
					            </div>
					            
					            <span class="image main"> 스테이크 <a href=#steak><img src="images/USA.jfif"></a></span>
					            <span class="image main"> 마카로니앤치즈 <a href=#cheese><img src="images/mac.jpg"></a></span>
					            <span class="image main"> 스파게티 <a href=#pasta><img src="images/spaghetti.jfif"></a></span>
					         </article>
					
						<!-- Recipe 일식 -->
					    	<article id="JAPAN">
					        	<h2 class="major">일식</h2>
					
					            <div style="text-align: right;">
					               <a href="#CHINA">중식&ensp;</a>
					               <a href="#USA">양식&ensp;</a>
					               <a href="#KOREA">한식</a>
					            </div>
					            
					            <span class="image main"> 우동 <a href=#udon><img src="images/udon.png"></a></span> 
					            <span class="image main"> 초밥 <a href=#sushi><img src="images/JAPAN.jfif"></a></span>
					            <span class="image main"> 오코노미야끼 <a href=#oko><img src="images/oko.jpg"></a></span>
					        </article>
					         
						<!-- 한식 : 김치찌개 -->
					    	<article id="kimchi" class = "user">
								<h2 class="major"><a href="#KOREA">한식</a></h2>
									<div style="text-align: right;">
										<a href="#KOREA">한식&ensp;</a>
										<a href="#CHINA">중식&ensp;</a> 
										<a href="#USA">양식&ensp;</a>
										<a href="#JAPAN">일식</a>
									</div>
					
									<h3>김치찌개</h3>
									<span class="image main"> <a><img src="images/KOREA.jfif"></a></span>
									<div>
										<ul>
											<li>소금 10g</li>
											<li>설탕 25g</li>
											<li>후추 5g</li>
										</ul>
									</div>
					
									<div style="text-align: center;">
									<%if(vo!=null){ %>
										<a href="OutputSpice?REC_NUM=1&id=<%=vo.getid() %>">
											<button onclick = "alert('전송 성공')">전송</button>
										</a>
									<%} %>
									</div>
							</article>
							
						<!-- 한식 : 된장찌개 -->
					       	<article id="beensoup">
					            <h2 class="major"><a href=#KOREA>한식</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">한식&ensp;</a> 
					               <a href="#CHINA">중식&ensp;</a> 
					               <a href="#USA">양식&ensp;</a> 
					               <a href="#JAPAN">일식</a>
					            </div>
					            
					            <h3>된장찌개</h3>
					            <span class="image main"><a><img src="images/been.jpg"></a></span>
					            <div>
					               <ul>
					                  <li>소금 10g</li>
					                  <li>설탕 10g</li>
					                  <li>설탕 10g</li>
					               </ul>
					            </div>
					            
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=2&id=<%=vo.getid() %>">
										<button onclick = "alert('전송 성공')">전송</button>
									</a>
								<%} %>
								</div>
					        </article>
					
						<!-- 한식 : 김치볶음밥 -->
					        <article id="kimbok">
					            <h2 class="major"><a href=#KOREA>한식</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">한식&ensp;</a>
					               <a href="#CHINA">중식&ensp;</a>
					               <a href="#USA">양식&ensp;</a>
					               <a href="#JAPAN">일식</a>
					            </div>
					            
					            <h3>김치볶음밥</h3>
					            <span class="image main"><a><img src="images/bokk.jpg"></a></span>
					            <div>
					               <ul>
					                  <li>준비중입니다.</li>
					               </ul>
					            </div>
					            
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=3&id=<%=vo.getid() %>">
										<button onclick = "alert('전송 성공')">전송</button>
									</a>
								<%} %>
								</div>
					   		</article>
					
					 	<!-- 중식 : 짜장면 -->
					    	<article id="jja">
					           	<h2 class="major"><a href=#CHINA>중식</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">한식&ensp;</a>
					               <a href="#CHINA">중식&ensp;</a>
					               <a href="#USA">양식&ensp;</a>
					               <a href="#JAPAN">일식</a>
					            </div>
					            <h3>짜장면</h3>
					            <span class="image main"><a><img src="images/CHINA.jfif"></a></span>
					            <div>
					               <ul>
					                  <li>준비중입니다.</li>
					               </ul>
					            </div>
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=4&id=<%=vo.getid() %>">
										<button onclick = "alert('전송 성공')">전송</button>
									</a>
								<%} %>
								</div>
					        </article>
							
						<!-- 중식 : 짬뽕 -->
					    	<article id="bbong">
					       		<h2 class="major"><a href=#CHINA>중식</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">한식&ensp;</a>
					               <a href="#CHINA">중식&ensp;</a> 
					               <a href="#USA">양식&ensp;</a>
					               <a href="#JAPAN">일식</a>
					            </div>
					            
					            <h3>짬뽕</h3>
					            <span class="image main"><a><img src="images/jjam.jfif"></a></span>
					            <div>
					               <ul>
					                  <li>준비중입니다.</li>
					               </ul>
					            </div>
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=5&id=<%=vo.getid() %>">
										<button onclick = "alert('전송 성공')">전송</button>
									</a>
								<%} %>
								</div>
					        </article>
					
						<!-- 중식 : 탕수육 -->
					        <article id="tangsu">
					        	<h2 class="major"><a href=#CHINA>중식</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">한식&ensp;</a>
					               <a href="#CHINA">중식&ensp;</a> 
					               <a href="#USA">양식&ensp;</a>
					               <a href="#JAPAN">일식</a>
					            </div>
					            
					            <h3>탕수육</h3>
					            <span class="image main"><a><img src="images/tang.jfif"></a></span>
					            <div>
					               <ul>
					                  <li>준비중입니다.</li>
					               </ul>
					            </div>
					            
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=6&id=<%=vo.getid() %>">
										<button onclick = "alert('전송 성공')">전송</button>
									</a>
								<%} %>
								</div>
					        </article>
					
						<!-- 양식 : 스테이크 -->
					        <article id="steak">
					        	<h2 class="major"><a href=#USA>양식</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">한식&ensp;</a> 
					               <a href="#CHINA">중식&ensp;</a> 
					               <a href="#USA">양식&ensp;</a>
					               <a href="#JAPAN">일식</a>
					            </div>
					            
					            <h3>스테이크</h3>
					            <span class="image main"><a><img src="images/USA.jfif"></a></span>
					            <div>
					               <ul>
					                  <li>준비중입니다.</li>
					               </ul>
					            </div>
					            
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=7&id=<%=vo.getid() %>">
										<button onclick = "alert('전송 성공')">전송</button>
									</a>
								<%} %>
								</div>
					         </article>
					         
						<!-- 양식 : 맥앤치즈 -->
					         <article id="cheese">
					            <h2 class="major"><a href=#USA>양식</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">한식&ensp;</a>
					               <a href="#CHINA">중식&ensp;</a>
					               <a href="#USA">양식&ensp;</a>
					               <a href="#JAPAN">일식</a>
					            </div>
					            
					            <h3>마카로니앤치즈</h3>
					            <span class="image main"><a><img src="images/mac.jpg"></a></span>
					            <div>
					               <ul>
					                  <li>준비중입니다.</li>
					               </ul>
					            </div>
					            
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=8&id=<%=vo.getid() %>">
										<button onclick = "alert('전송 성공')">전송</button>
									</a>
								<%} %>
								</div>
					        </article>
					
						<!-- 양식 : 스파게티 -->
					         <article id="pasta">
					            <h2 class="major"><a href=#USA>양식</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">한식&ensp;</a>
					               <a href="#CHINA">중식&ensp;</a>
					               <a href="#USA">양식&ensp;</a>
					               <a href="#JAPAN">일식</a>
					            </div>
					            
					            <h3>스파게티</h3>
					            <span class="image main"><a><img src="images/spaghetti.jfif"></a></span>
					            <div>
					               <ul>
					                  <li>준비중입니다.</li>
					               </ul>
					            </div>
					            
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=9&id=<%=vo.getid() %>">
										<button onclick = "alert('전송 성공')">전송</button>
									</a>
								<%} %>
								</div>
					        </article>
					
						<!-- 일식 : 초밥 -->
					        <article id="sushi">
					            <h2 class="major"><a href=#JAPAN>일식</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">한식&ensp;</a>
					               <a href="#CHINA">중식&ensp;</a>
					               <a href="#USA">양식&ensp;</a>
					               <a href="#JAPAN">일식</a>
					            </div>
					            
					            <h3>초밥</h3>
					            <span class="image main"><a><img src="images/JAPAN.jfif"></a></span>
					            <div>
					               <ul>
					                  <li>준비중입니다.</li>
					               </ul>
					            </div>
					            
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=10&id=<%=vo.getid() %>">
										<button onclick = "alert('전송 성공')">전송</button>
									</a>
								<%} %>
								</div>
					        </article>
					
						<!-- 일식 : 우동 -->
					        <article id="udong">
					        	<h2 class="major"><a href=#JAPAN>일식</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">한식&ensp;</a>
					               <a href="#CHINA">중식&ensp;</a>
					               <a href="#USA">양식&ensp;</a>
					               <a href="#JAPAN">일식</a>
					            </div>
					            
					            <h3>우동</h3>
					            <span class="image main"><a><img src="images/udon.png"></a></span>
					            <div>
					               <ul>
					                  <li>준비중입니다.</li>
					               </ul>
					            </div>
					            
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=11&id=<%=vo.getid() %>">
										<button onclick = "alert('전송 성공')">전송</button>
									</a>
								<%} %>
								</div>
					        </article>
					
						<!-- 일 식 : 오꼬노미야끼 -->
					        <article id="oko">
					            <h2 class="major"><a href=#JAPAN>일식</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">한식&ensp;</a>
					               <a href="#CHINA">중식&ensp;</a>
					               <a href="#USA">양식&ensp;</a>
					               <a href="#JAPAN">일식</a>
					            </div>
					            
					            <h3>오코노미야끼</h3>
					            <span class="image main"><a><img src="images/oko.jpg"></a></span>
					            <div>
					               <ul>
					                  <li>준비중입니다.</li>
					               </ul>
					            </div>
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=12&id=<%=vo.getid() %>">
										<button onclick = "alert('전송 성공')">전송</button>
									</a>
								<%} %>
								</div>
					        </article>     
					       
					         
					 	<!-- Board : 게시판 목록 -->
	         				<article id="POST">
	            				<h1 class="major">게시판</h1>
	                     		<table>
				                	<tr>
				                    	<td style="text-align: center; width : 15%">번호</td>
				                        <td style="text-align: center; width : 50%">제목</td>
				                        <td style="text-align: center; width : 20%">작성일</td>
				                        <td style="text-align: center; width : 15%">작성자</td>
				                    </tr>
				                   
				                	<% for(int i = 0, j = Postal.size(); i < Postal.size() ;i++, j--){ %>
                        			<tr>
                           				<td align = "center"><%=j%></td>
                           				<td><a onclick = "postDetail(<%= Postal.get(i).getPost_num() %>)"><%=Postal.get(i).getPost_name() %></a></td>
                           				<td ><%=Postal.get(i).getPost_date() %></td>
                           				<td align = "center"><%=Postal.get(i).getMem_id() %></td>
                        			</tr>
                     				<%} %>
	                  			</table>
	                  				
	               				<!-- 글쓰기 버튼 -->
	                  			<div style="text-align: right;"><button onclick="location.href='main.jsp#post_up'">글쓰기</button></div>
	         				</article>
	         
	         			<!-- Board : 글쓰기 페이지 -->
	         				<article id= "post_up">
	         					<h1 class="major">게시판</h1>
	               				<form method="post" action="writeAction.jsp">
		                  			<table>
		                        		<tr>
		                          			<td><input class="form-control" name="post_name" type="text"
		                          						placeholder="글 제목" maxlength="50" required="required"></td>
		                        		</tr>
		                        		<tr>
		                           			<td><textarea class="form-control" name="post_cont" placeholder="글 내용"  maxlength="2048"
		                           							style="height: 350px;" required="required"></textarea></td>
		                        		</tr>
		                  			</table>
		                  			<!-- 저장 버튼-->
		                  			<div style="text-align: right;"><input type="submit" class="btn btn-primary pull-right" value="저장"></div>
	               				</form>
	         				</article>
	
	      				<!-- Board : 글 상세보기 -->
	         				<article id="post_one">
	            				<h1 class="major">게시판</h1>
	                  			<table>
	                       	 		<tr>
	                           			<td style="width: 20%;">글 제목</td>
	                           			<td id="post_detail_name" colspan="2"></td>
	                        		</tr>
	                        		<tr>
	                           			<td>작성자</td>
	                           			<td id="post_detail_id" colspan="2"></td>
	                        		</tr>
	                        		<tr>
			                           	<td>작성일자</td>
			                           	<td id="post_detail_date" colspan="2"></td>
	                        		</tr>
	                        		<tr>
	                           			<td>내용</td>
	                           			<td id="post_detail_cont" colspan="2" style="height: 200px; text-align: left;"></td>
	                        		</tr>
	                  			</table>
	                  			<div style="text-align: right;"><button onclick="location.href='main.jsp#POST'">목록</button></div>
	         				</article>         
					        
					         
						<!-- Q&A : 질문 목록 -->
	         				<article id="QNA">
	            				<h1 class="major">Q&A</h1>
	                     		<table>
	                        		<tr>
			                           <td  style="text-align: center; width : 15%">번호</td>
			                           <td  style="text-align: center; width : 50%">제목</td>
			                           <td  style="text-align: center; width : 20%">작성일</td>
			                           <td  style="text-align: center; width : 15%">작성자</td>
	                        		</tr>
	                  	
	                        		<tr>
			                           <td></td>
			                           <td><a href = "main.jsp#ques_one"></a></td>
			                           <td></td>
			                           <td></td>
	                        		</tr>
	                     		</table>
	            
	               				<!-- 질문 작성 버튼 -->
	                  			<div style="text-align: right;"><button onclick="location.href='main.jsp#ques_up'">글쓰기</button></div>
	         				</article>
	         
	         			<!-- Q&A : 질문 작성 -->
	         			<article id= "ques_up">
	         				<h1 class="major">Q&A</h1>
	               			<form method="post" action="quesWriteAction.jsp">
	                  			<table>
	                        		<tr>
	                           			<td><input class="form-control" name="ques_name" type="text" 
	                           						placeholder="질문 제목"  maxlength="50" required="required"></td>
	                        		</tr>
	                        		<tr>
	                           			<td><textarea class="form-control" name="ques_cont" placeholder="질문 내용"
	                           						 maxlength="2048" style="height: 350px;" required="required"></textarea></td>
	                        		</tr>
	                  			</table>
	                  			<!-- 글쓰기 버튼 -->
	                  			<div style="text-align: right;"><input type="submit" class="btn btn-primary pull-right" value="저장"></div>
	               			</form>
	         			</article>
	   
	
	         		<!-- Q&A : 질문 상세 -->
	         			<article id="ques_one">
	            			<h1 class="major">Q&A</h1>
	                  		<table>
			                	<tr>
			                    	<td style="width: 20%;">질문 제목</td>
			                    	<td colspan="2"></td>
			                	</tr>
			                 	<tr>
			                       	<td>작성자</td>
			                     	<td colspan="2"></td>
			                 	</tr>
			                   	<tr>
			                    	<td>작성일자</td>
			                   		<td colspan="2"></td>
			                 	</tr>
			                  	<tr>
			                     	<td>내용</td>
			                  		<td colspan="2" style="height: 200px; text-align: left;"></td>
			                   	</tr>
	                  		</table>
	                  		<div style="text-align: right;"><button onclick="location.href='main.jsp#QNA'">목록</button></div>    <br>
	         			 	
	         			 	<!-- 댓글보는곳 -->
	            			<table>
			                    <tr>
			                       <td style="text-align: center; width : 15%" >번호</td>
			                       <td style="text-align: center; width : 50%">내용</td>
			                       <td style="text-align: center; width : 20%">작성일</td>
			                       <td style="text-align: center; width : 15%">작성자</td>
			                    </tr>
		                        <tr>
		                           <td style="text-align: center;"></td>
		                           <td></td>
		                           <td style="text-align: center;"></td>
		                           <td style="text-align: center;"></td>
		                        </tr>
	                  		</table>
	            
	            			<!--댓글 쓰는 칸 -->
	            			<form method="post" action="ansWriteAction.jsp">
	                  			<table>
	                        		<tr>
	                           			<td><textarea class="form-control" name="ans_cont" placeholder="답글 작성" maxlength="100"
	                           						style="height: 50px; resize: none; overflow-y:hidden;;" required="required"></textarea></td>
	                        		</tr>
	                  			</table>
	                  			
		                  		<!-- 저장 버튼 -->
		                  		<div style="text-align: right;"><input type="submit" value="저장"></div>
	               			</form>
	        			</article>	         
					         
					         
					<!-- Login -->
	         			<article id="Login">
	            			<h2 class="major">Login</h2>
	
	            			<form action="LoginService" method="post">
	               				<h3>ID</h3>
	               				<input name="id" type="text" placeholder="ID를 입력하세요" required="required"> <br>
	               				<h3>PW</h3>
	               				<input name="pw" type="password" placeholder="PW를 입력하세요" required="required"> <br>
	               				<div style="text-align: center;">
	                  				<input type="submit" value="LogIn">
	               				</div>
	            			</form>
	         			</article>
	 
	 
	         		<!-- Join -->
	         			<article id="Join">
	            			<h2 class="major">Join</h2>
	
	            			<form action="JoinService" method="post">
	               				<input name="id" id="input_id" type="text" placeholder="ID를 입력하세요" required="required">   <br> 
	               				<div style="text-align: center;">
	               					<input type="button" value="Id중복체크" onclick="idcheck()"> 
	               				</div> 		<br> 
	               				<input name="pw" type="password" placeholder="PW를 입력하세요" required="required">    	<br> 
	               				<input name="nick" type="text" placeholder="NICK를 입력하세요" required="required"> 		<br>
	               				<div style="text-align: center;">
	                  				<input type="submit" value="JoinUs">
	               				</div>
	            			</form>
	         			</article>
	
					         
					<!-- My page : 개인정보 수정 -->
	         			<article id="ChangeInfo">
	            			<h2 class="major">개인정보 수정</h2>
	            			<form action="UpdateService" method="post">
	               				<h3>현재ID</h3>
	               				<input name="id" type="text" placeholder="ID를 입력하세요" required="required"> <br>
	               				<h3>PW</h3>
	               				<input name="pw" type="password" placeholder="변경할 PW를 입력하세요"> <br>
	               				<h3>NICK</h3>
					           	<input name="nick" type="text" placeholder="변경할 NICK을 입력하세요"> <br>
					           	<input type="submit" value="Change" class="button fit">
	            			</form>
	         			</article>
	
	         		<!-- My page : 기기관리 -->
	         			<article id="Product">
	            			<h2 class="major">기기관리</h2>
				            <form action="ProductService" method="post">
				               <input name="product" id="input_product" type="text" placeholder="제품번호를 입력하세요" required="required">		<br>
				               <div style="text-align: center;">
				               		<input type="button" value="제품번호중복체크" onclick="prodcheck()"> 
				               </div>		<br><br>
				               <select name="spice">
				                  <option value="">양념을 선택하세요.</option>
				                  <option value="소금">소금</option>
				                  <option value="설탕">설탕</option>
				                  <option value="후추">후추</option>
				               </select>	<br>
				               <div style="text-align: center;">
				               		<input type="submit" value="저장" onclick="alert('제품 등록이 완료 됐습니다.')"> <br>
				               </div>
				            </form> <br><br>
	            
	            
	           				<form class = "user">
								<table>
									<tr align = "center">
										<td>제품번호</td>
										<td>양념</td>
										<td colspan="2">양념입력</td>
										<td>전송성공여부</td>
										<td>제품삭제</td>
									</tr>
									<%for(ProductVO pvo:Pal){%>
									<tr>
										<td name="product" id="product2" align = "center"><%= pvo.getProduct() %></td>
										<td align = "center"><%= pvo.getSpice() %></td>
										<td><input size = "1" type="text" name="value" id="mysensor" value="0"></td>
										<td><button id="user_input" type="button" onclick="alert('전송완료')">전송</button></td>
										<td><span id="result"></span>	</td>
										<td align = "center"><a href="DeleteProduct?product=<%=pvo.getProduct()%>"
											onclick="if(!confirm('삭제 하시겠습니까?')){return false;}">삭제</a></td>
									</tr>
									<%}%>
								</table>
							</form>
	         			</article>

	
	         		<!-- Admin : MemberInfo -->
	         			<article id="MemberInfo">
	            			<h2 class="major">회원관리</h2>
					        <table>
					       		<tr>
					            	<td>ID</td>
					              	<td>PW</td>
					             	<td>NICK</td>
					              	<td>Delete</td>
					           	</tr>
					           	<%for(MemberVO mvo:al){%>
					          	<tr>
					              	<td><%=mvo.getid() %></td>
					               	<td><%=mvo.getpw() %></td>
					             	<td><%=mvo.getnick() %></td>
					              	<td><a href="DeleteService?id=<%=mvo.getid()%>" onclick="if(!confirm('삭제 하시겠습니까?')){return false;}">삭제</a></td>
					          	</tr>
					         	<% } %>
					       	</table>
	         			</article>
	
	      			<!-- Admin : 레시피 입력 -->
	      				<article id="recipepost">
	            			<h2 class="major">RecipePost</h2>
	            			<form action="RecipePost" method="post">
	               				<h3>요리 명</h3>
	               				<input name="rec_name" type="text" placeholder="요리 이름 입력" required="required">			<br>
	               				<h3>소금</h3> 
	               				<input name="salt" type="text" placeholder="소금 양 입력" required="required"> 				<br> 
	               				<h3>설탕</h3>
	               				<input name="sugar" type="text" placeholder="설탕 양 입력" required="required"> 				<br>
	               				<h3>후추</h3>
	               				<input name="pepper" type="text" placeholder="후추 양 입력" required="required"> 			<br>
	               				<div style="text-align: center;">
	                  				<input type="submit" value="작성" onclick="alert('성공적으로 레시피를 작성 하였습니다.')">
	               				</div>
	            			</form>
	         			</article>
					         
					         
					</div> <!-- 끝 -->

				<!-- Footer -->
					<footer id="footer">
						<p class="copyright">&copy; Good Spice : <a href="https://www.smhrd.or.kr">스마트인재개발원</a>.</p>
					</footer>

			</div>

		<!-- BG -->
			<div id="bg"></div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script src="assets/js/jquery-3.6.0.min.js"></script>
			<script>
	        	function menu(){
	            	$("#select").val("Recipe");                     
	            }
	        	
	        	function admin(){
                    $("#Adminpage").val("Admin");               
                          }
	        	
	        	function info() {
                    $("#selMypage").val("Mypage");
                 }
	        	
	        	
	        	/* id 중복 체크 */
	            function idcheck() {
	               let input = document.getElementById("input_id");

	               $.ajax({
	                  type : "post", // 데이터 요청 방식 get/post
	                  data : {
	                     "id" : input.value
	                  }, // 전송하는 데이터
	                  url : "IdCheckService", // 데이터를 요청하는 서버페이지 url
	                  dataType : "text", //응답데이터의 형식
	                  success : function(data) { // 성공했을 때, 함수 호출 function(전송 받은 값)

	                     if (data == "true") {
	                        //alert(sp.innerText="사용 불가능한 아이디 입니다.");
	                        alert("사용 불가능한 아이디 입니다.")
	                     } else {
	                        //alert(sp.innerText="사용 가능 한 아이디 입니다.");
	                        alert("사용 가능한 아이디 입니다.")
	                     }
	                  },
	                  error : function() { // 실패
	                     alert("통신실패")
	                  }
	               });
	            }
	        	
	        	
		        /* 제품 중복 체크 */
		        function prodcheck() {
		           let input_prod = document.getElementById("input_product");
	
		           $.ajax({
		              type : "post", // 데이터 요청 방식 get/post
		              data : {"id" : input_prod.value}, // 전송하는 데이터
		              url : "ProdCheckService", // 데이터를 요청하는 서버페이지 url
		              dataType : "text", //응답데이터의 형식
		              success : function(data) { // 성공했을 때, 함수 호출 function(전송 받은 값)
	
		                 if (data == "true") {
		                    alert("중복된 제품 번호가 있습니다. 다시 입력해주세요")
		                 } else {
		                    alert("사용 가능한 제품번호 입니다.")
		                 }
		              },
		              error : function() { // 실패
		                 alert("통신실패")
		              }
		           });
		        }
		        
		        
		        /* 아두이노 통신 */
		        $("#user_input").on('click',function(){
		           	var mysensor = $("#mysensor").val();
		      			$.ajax({
		      				url : "ArduinoSetValue",
		      				type : "get",
		      				data : {"mysensor" : mysensor},
		      				dataType : "json",
		      				success : function(data){
		      					$('#result').html("전송 성공 " + data.mysensor + "g");
		      				},
		      				error : function(){
		      					alert('error');
		      				}
		      			});
		      		});
		        
		        
		        function postDetail(post_num) {
					$.ajax({
						type : "post", // 데이터 전송 방식
						data : {"post_num" : post_num }, // 전송하는 데이터
						url :  "PostDetail", // 데이터를 전송하는 페이지
						dataType : "json", // 응답데이터의 형식
						success : function(res) {
							location.href = "main.jsp#post_one"
							$("#post_detail_name").html(res.post_name);
							$("#post_detail_id").html(res.mem_id);
							$("#post_detail_date").html(res.post_date);
							$("#post_detail_cont").html(res.post_cont);
						},
						 error : function() { // 실패
				               alert("잠시후 다시 시도해주세요");
				            }
					})
					}
	       </script>

	</body>
</html>
