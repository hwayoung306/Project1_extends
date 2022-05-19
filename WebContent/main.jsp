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
	// ȸ��
	   MemberVO vo = (MemberVO) session.getAttribute("member");
	   MemberDAO dao = new MemberDAO();
	   ArrayList<MemberVO> al = dao.selectAll();
	   
	// ��ǰ
	   ProductDAO Pdao = new ProductDAO();
	   ArrayList<ProductVO> Pal =new ArrayList<ProductVO>();
	   boolean ch = true;
	   if(vo!=null){
	      Pal = Pdao.selectAll(vo.getid());
	   }
	   
	// �Խ���
	   PostDAO Postdao = new PostDAO();
	   ArrayList<PostVO> Postal = Postdao.PostList();
	   
	// ����
	   QuesDAO Qdao = new QuesDAO();
	   ArrayList<QuesVO> Qal = Qdao.QuesList();
	   
	// ���
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
				                     <h2>�����ڴ� ȯ���մϴ�</h2>
				                  <%} else {%>
				                  <h2><%=vo.getid() %>�� ȯ���մϴ�</h2>
				                  <%} %>
				               <%} %>
				            </div>
						</div>
						
						
						<nav>
							<ul>
								<!-- �⺻ �޴� : Intro, Recipe(�ѽ�, �߽�, ���, �Ͻ�), Post, Q&A -->
								<li><a href="#intro">Intro</a></li>
								<li><select  id="select" onclick="menu()" 
												onchange="if(this.value) location.href=(this.value);">
					                    <option disabled selected>Recipe</option>
					                    <option value="#KOREA">�ѽ�</option>
					                    <option value="#CHINA">�߽�</option>
					                    <option value="#USA">���</option>
					                    <option value="#JAPAN">�Ͻ�</option>
				              		</select>
				              	</li>
								<li><a href="#POST">Post</a></li>
				                <li><a href="#QNA">Q&A</a></li>
								
								<!-- �α������� ���� ��� : + Login, Join-->
				                <%if (vo == null) {%>
				               	<li><a href="#Login">Login</a></li>
				               	<li><a href="#Join">Join</a></li>
				               
				               	<%} else {%>
				               	<!-- �α��� �� ��� : + Logout -->
				               	<% String GetId = vo.getid(); %>
				               	
				               		<!-- �α����� ���̵� admin�� ��� : + Adimn(������, ȸ������) -->
				                	<%if (GetId.equals("admin")) {%>
				                  	<li>
				                  		<select id="Adminpage" onclick="admin()"
				                  				onchange="if(this.value) location.href=(this.value);">
				                      		<option disabled selected>Admin</option>
				                        	<option value="#recipepost">������</option>
				                        	<option value="#MemberInfo">ȸ������</option>
				                  		</select>
				                  	</li>
				   
				   					<!-- �α����� ���̵� �Ϲ� ȸ���� ��� : + Mypage(��������, ������) -->
				   					<%} else { %>
				                  	<li>
				                  		<select id="selMypage" onclick="info()"
				                     			onchange="if(this.value) location.href=(this.value);">
				                     
				                        	<option disabled selected>Mypage</option>
				                       		<option value="#ChangeInfo">��������</option>
				                        	<option value="#Product">������</option>
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


						<!-- Intro ��ǰ�Ұ� -->
					         <article id="intro">
					            <h2 class="major">��ǰ�Ұ�</h2>
					            <span class="image main"><img src = "images/goodspice.jpg"></span>
					            <P align = "center">���� "<b>����Ʈ �����</b>"�� �丮�� ���� ���ְ� ����� ���� ����� ��ǰ�Դϴ�.<br> 
					            					�丮�� ���� ����� �� ���ߴ����� ���� �����ϰ�,<br>
					            					���� �Ϻ��ϰ� �� �� �ֵ��� ���� ��� �� ���Դϴ�.</P>
					            <p align = "center"><b>����� ��Ź�� �ູ�� �����ϱ⸦ �ٶ��ϴ�.</b></p>
					            <p align = "center">����ó : <a href="https://www.smhrd.or.kr/">����Ʈ���簳�߿�</a></p>
					         </article>
					
				
					   <!-- Recipe �ѽ� -->
					         <article id="KOREA">
					            <h2 class="major">�ѽ�</h2>
					
					            <div style="text-align: right;">
					               <a href="#CHINA">�߽�&ensp;</a>
					               <a href="#USA">���&ensp;</a>
					               <a href="#JAPAN">�Ͻ�</a>
					            </div>
					            
					            <span class="image main"> ��ġ� <a href="#kimchi"><img src="images/KOREA.jfif"></a></span> 
					            <span class="image main"> ����� <a href="#beensoup"><img src="images/been.jpg"></a></span> 
					            <span class="image main"> ��ġ������ <a href="#kimbok"><img src="images/bokk.jpg"></a></span>
					         </article>
					
						<!-- Recipe �߽� -->
					         <article id="CHINA">
					            <h2 class="major">�߽�</h2>
					
					            <div style="text-align: right;">
					               <a href="#KOREA">�ѽ�&ensp;</a>
					               <a href="#USA">���&ensp;</a> 
					               <a href="#JAPAN">�Ͻ�</a>
					            </div>
					            
					            <span class="image main"> ¥��� <a href=#jja><img src="images/CHINA.jfif"></a></span> 
					            <span class="image main"> «�� <a href=#bbong><img src="images/jjam.jfif"></a></span> 
					            <span class="image main"> ������ <a href=#tangsu><img src="images/tang.jfif"></a></span>
					         </article>
					
				 		<!-- Recipe ��� -->
					         <article id="USA">
					            <h2 class="major">���</h2>
					
					            <div style="text-align: right;">
					               <a href="#CHINA">�߽�&ensp;</a>
					               <a href="#KOREA">�ѽ�&ensp;</a>
					               <a href="#JAPAN">�Ͻ�</a>
					            </div>
					            
					            <span class="image main"> ������ũ <a href=#steak><img src="images/USA.jfif"></a></span>
					            <span class="image main"> ��ī�δϾ�ġ�� <a href=#cheese><img src="images/mac.jpg"></a></span>
					            <span class="image main"> ���İ�Ƽ <a href=#pasta><img src="images/spaghetti.jfif"></a></span>
					         </article>
					
						<!-- Recipe �Ͻ� -->
					    	<article id="JAPAN">
					        	<h2 class="major">�Ͻ�</h2>
					
					            <div style="text-align: right;">
					               <a href="#CHINA">�߽�&ensp;</a>
					               <a href="#USA">���&ensp;</a>
					               <a href="#KOREA">�ѽ�</a>
					            </div>
					            
					            <span class="image main"> �쵿 <a href=#udon><img src="images/udon.png"></a></span> 
					            <span class="image main"> �ʹ� <a href=#sushi><img src="images/JAPAN.jfif"></a></span>
					            <span class="image main"> ���ڳ�̾߳� <a href=#oko><img src="images/oko.jpg"></a></span>
					        </article>
					         
						<!-- �ѽ� : ��ġ� -->
					    	<article id="kimchi" class = "user">
								<h2 class="major"><a href="#KOREA">�ѽ�</a></h2>
									<div style="text-align: right;">
										<a href="#KOREA">�ѽ�&ensp;</a>
										<a href="#CHINA">�߽�&ensp;</a> 
										<a href="#USA">���&ensp;</a>
										<a href="#JAPAN">�Ͻ�</a>
									</div>
					
									<h3>��ġ�</h3>
									<span class="image main"> <a><img src="images/KOREA.jfif"></a></span>
									<div>
										<ul>
											<li>�ұ� 10g</li>
											<li>���� 25g</li>
											<li>���� 5g</li>
										</ul>
									</div>
					
									<div style="text-align: center;">
									<%if(vo!=null){ %>
										<a href="OutputSpice?REC_NUM=1&id=<%=vo.getid() %>">
											<button onclick = "alert('���� ����')">����</button>
										</a>
									<%} %>
									</div>
							</article>
							
						<!-- �ѽ� : ����� -->
					       	<article id="beensoup">
					            <h2 class="major"><a href=#KOREA>�ѽ�</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">�ѽ�&ensp;</a> 
					               <a href="#CHINA">�߽�&ensp;</a> 
					               <a href="#USA">���&ensp;</a> 
					               <a href="#JAPAN">�Ͻ�</a>
					            </div>
					            
					            <h3>�����</h3>
					            <span class="image main"><a><img src="images/been.jpg"></a></span>
					            <div>
					               <ul>
					                  <li>�ұ� 10g</li>
					                  <li>���� 10g</li>
					                  <li>���� 10g</li>
					               </ul>
					            </div>
					            
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=2&id=<%=vo.getid() %>">
										<button onclick = "alert('���� ����')">����</button>
									</a>
								<%} %>
								</div>
					        </article>
					
						<!-- �ѽ� : ��ġ������ -->
					        <article id="kimbok">
					            <h2 class="major"><a href=#KOREA>�ѽ�</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">�ѽ�&ensp;</a>
					               <a href="#CHINA">�߽�&ensp;</a>
					               <a href="#USA">���&ensp;</a>
					               <a href="#JAPAN">�Ͻ�</a>
					            </div>
					            
					            <h3>��ġ������</h3>
					            <span class="image main"><a><img src="images/bokk.jpg"></a></span>
					            <div>
					               <ul>
					                  <li>�غ����Դϴ�.</li>
					               </ul>
					            </div>
					            
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=3&id=<%=vo.getid() %>">
										<button onclick = "alert('���� ����')">����</button>
									</a>
								<%} %>
								</div>
					   		</article>
					
					 	<!-- �߽� : ¥��� -->
					    	<article id="jja">
					           	<h2 class="major"><a href=#CHINA>�߽�</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">�ѽ�&ensp;</a>
					               <a href="#CHINA">�߽�&ensp;</a>
					               <a href="#USA">���&ensp;</a>
					               <a href="#JAPAN">�Ͻ�</a>
					            </div>
					            <h3>¥���</h3>
					            <span class="image main"><a><img src="images/CHINA.jfif"></a></span>
					            <div>
					               <ul>
					                  <li>�غ����Դϴ�.</li>
					               </ul>
					            </div>
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=4&id=<%=vo.getid() %>">
										<button onclick = "alert('���� ����')">����</button>
									</a>
								<%} %>
								</div>
					        </article>
							
						<!-- �߽� : «�� -->
					    	<article id="bbong">
					       		<h2 class="major"><a href=#CHINA>�߽�</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">�ѽ�&ensp;</a>
					               <a href="#CHINA">�߽�&ensp;</a> 
					               <a href="#USA">���&ensp;</a>
					               <a href="#JAPAN">�Ͻ�</a>
					            </div>
					            
					            <h3>«��</h3>
					            <span class="image main"><a><img src="images/jjam.jfif"></a></span>
					            <div>
					               <ul>
					                  <li>�غ����Դϴ�.</li>
					               </ul>
					            </div>
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=5&id=<%=vo.getid() %>">
										<button onclick = "alert('���� ����')">����</button>
									</a>
								<%} %>
								</div>
					        </article>
					
						<!-- �߽� : ������ -->
					        <article id="tangsu">
					        	<h2 class="major"><a href=#CHINA>�߽�</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">�ѽ�&ensp;</a>
					               <a href="#CHINA">�߽�&ensp;</a> 
					               <a href="#USA">���&ensp;</a>
					               <a href="#JAPAN">�Ͻ�</a>
					            </div>
					            
					            <h3>������</h3>
					            <span class="image main"><a><img src="images/tang.jfif"></a></span>
					            <div>
					               <ul>
					                  <li>�غ����Դϴ�.</li>
					               </ul>
					            </div>
					            
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=6&id=<%=vo.getid() %>">
										<button onclick = "alert('���� ����')">����</button>
									</a>
								<%} %>
								</div>
					        </article>
					
						<!-- ��� : ������ũ -->
					        <article id="steak">
					        	<h2 class="major"><a href=#USA>���</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">�ѽ�&ensp;</a> 
					               <a href="#CHINA">�߽�&ensp;</a> 
					               <a href="#USA">���&ensp;</a>
					               <a href="#JAPAN">�Ͻ�</a>
					            </div>
					            
					            <h3>������ũ</h3>
					            <span class="image main"><a><img src="images/USA.jfif"></a></span>
					            <div>
					               <ul>
					                  <li>�غ����Դϴ�.</li>
					               </ul>
					            </div>
					            
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=7&id=<%=vo.getid() %>">
										<button onclick = "alert('���� ����')">����</button>
									</a>
								<%} %>
								</div>
					         </article>
					         
						<!-- ��� : �ƾ�ġ�� -->
					         <article id="cheese">
					            <h2 class="major"><a href=#USA>���</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">�ѽ�&ensp;</a>
					               <a href="#CHINA">�߽�&ensp;</a>
					               <a href="#USA">���&ensp;</a>
					               <a href="#JAPAN">�Ͻ�</a>
					            </div>
					            
					            <h3>��ī�δϾ�ġ��</h3>
					            <span class="image main"><a><img src="images/mac.jpg"></a></span>
					            <div>
					               <ul>
					                  <li>�غ����Դϴ�.</li>
					               </ul>
					            </div>
					            
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=8&id=<%=vo.getid() %>">
										<button onclick = "alert('���� ����')">����</button>
									</a>
								<%} %>
								</div>
					        </article>
					
						<!-- ��� : ���İ�Ƽ -->
					         <article id="pasta">
					            <h2 class="major"><a href=#USA>���</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">�ѽ�&ensp;</a>
					               <a href="#CHINA">�߽�&ensp;</a>
					               <a href="#USA">���&ensp;</a>
					               <a href="#JAPAN">�Ͻ�</a>
					            </div>
					            
					            <h3>���İ�Ƽ</h3>
					            <span class="image main"><a><img src="images/spaghetti.jfif"></a></span>
					            <div>
					               <ul>
					                  <li>�غ����Դϴ�.</li>
					               </ul>
					            </div>
					            
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=9&id=<%=vo.getid() %>">
										<button onclick = "alert('���� ����')">����</button>
									</a>
								<%} %>
								</div>
					        </article>
					
						<!-- �Ͻ� : �ʹ� -->
					        <article id="sushi">
					            <h2 class="major"><a href=#JAPAN>�Ͻ�</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">�ѽ�&ensp;</a>
					               <a href="#CHINA">�߽�&ensp;</a>
					               <a href="#USA">���&ensp;</a>
					               <a href="#JAPAN">�Ͻ�</a>
					            </div>
					            
					            <h3>�ʹ�</h3>
					            <span class="image main"><a><img src="images/JAPAN.jfif"></a></span>
					            <div>
					               <ul>
					                  <li>�غ����Դϴ�.</li>
					               </ul>
					            </div>
					            
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=10&id=<%=vo.getid() %>">
										<button onclick = "alert('���� ����')">����</button>
									</a>
								<%} %>
								</div>
					        </article>
					
						<!-- �Ͻ� : �쵿 -->
					        <article id="udong">
					        	<h2 class="major"><a href=#JAPAN>�Ͻ�</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">�ѽ�&ensp;</a>
					               <a href="#CHINA">�߽�&ensp;</a>
					               <a href="#USA">���&ensp;</a>
					               <a href="#JAPAN">�Ͻ�</a>
					            </div>
					            
					            <h3>�쵿</h3>
					            <span class="image main"><a><img src="images/udon.png"></a></span>
					            <div>
					               <ul>
					                  <li>�غ����Դϴ�.</li>
					               </ul>
					            </div>
					            
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=11&id=<%=vo.getid() %>">
										<button onclick = "alert('���� ����')">����</button>
									</a>
								<%} %>
								</div>
					        </article>
					
						<!-- �� �� : ������̾߳� -->
					        <article id="oko">
					            <h2 class="major"><a href=#JAPAN>�Ͻ�</a></h2>
					            <div style="text-align: right;">
					               <a href="#KOREA">�ѽ�&ensp;</a>
					               <a href="#CHINA">�߽�&ensp;</a>
					               <a href="#USA">���&ensp;</a>
					               <a href="#JAPAN">�Ͻ�</a>
					            </div>
					            
					            <h3>���ڳ�̾߳�</h3>
					            <span class="image main"><a><img src="images/oko.jpg"></a></span>
					            <div>
					               <ul>
					                  <li>�غ����Դϴ�.</li>
					               </ul>
					            </div>
					            <div style="text-align: center;">
								<%if(vo!=null){ %>
									<a href="OutputSpice?REC_NUM=12&id=<%=vo.getid() %>">
										<button onclick = "alert('���� ����')">����</button>
									</a>
								<%} %>
								</div>
					        </article>     
					       
					         
					 	<!-- Board : �Խ��� ��� -->
	         				<article id="POST">
	            				<h1 class="major">�Խ���</h1>
	                     		<table>
				                	<tr>
				                    	<td style="text-align: center; width : 15%">��ȣ</td>
				                        <td style="text-align: center; width : 50%">����</td>
				                        <td style="text-align: center; width : 20%">�ۼ���</td>
				                        <td style="text-align: center; width : 15%">�ۼ���</td>
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
	                  				
	               				<!-- �۾��� ��ư -->
	                  			<div style="text-align: right;"><button onclick="location.href='main.jsp#post_up'">�۾���</button></div>
	         				</article>
	         
	         			<!-- Board : �۾��� ������ -->
	         				<article id= "post_up">
	         					<h1 class="major">�Խ���</h1>
	               				<form method="post" action="writeAction.jsp">
		                  			<table>
		                        		<tr>
		                          			<td><input class="form-control" name="post_name" type="text"
		                          						placeholder="�� ����" maxlength="50" required="required"></td>
		                        		</tr>
		                        		<tr>
		                           			<td><textarea class="form-control" name="post_cont" placeholder="�� ����"  maxlength="2048"
		                           							style="height: 350px;" required="required"></textarea></td>
		                        		</tr>
		                  			</table>
		                  			<!-- ���� ��ư-->
		                  			<div style="text-align: right;"><input type="submit" class="btn btn-primary pull-right" value="����"></div>
	               				</form>
	         				</article>
	
	      				<!-- Board : �� �󼼺��� -->
	         				<article id="post_one">
	            				<h1 class="major">�Խ���</h1>
	                  			<table>
	                       	 		<tr>
	                           			<td style="width: 20%;">�� ����</td>
	                           			<td id="post_detail_name" colspan="2"></td>
	                        		</tr>
	                        		<tr>
	                           			<td>�ۼ���</td>
	                           			<td id="post_detail_id" colspan="2"></td>
	                        		</tr>
	                        		<tr>
			                           	<td>�ۼ�����</td>
			                           	<td id="post_detail_date" colspan="2"></td>
	                        		</tr>
	                        		<tr>
	                           			<td>����</td>
	                           			<td id="post_detail_cont" colspan="2" style="height: 200px; text-align: left;"></td>
	                        		</tr>
	                  			</table>
	                  			<div style="text-align: right;"><button onclick="location.href='main.jsp#POST'">���</button></div>
	         				</article>         
					        
					         
						<!-- Q&A : ���� ��� -->
	         				<article id="QNA">
	            				<h1 class="major">Q&A</h1>
	                     		<table>
	                        		<tr>
			                           <td  style="text-align: center; width : 15%">��ȣ</td>
			                           <td  style="text-align: center; width : 50%">����</td>
			                           <td  style="text-align: center; width : 20%">�ۼ���</td>
			                           <td  style="text-align: center; width : 15%">�ۼ���</td>
	                        		</tr>
	                  	
	                        		<tr>
			                           <td></td>
			                           <td><a href = "main.jsp#ques_one"></a></td>
			                           <td></td>
			                           <td></td>
	                        		</tr>
	                     		</table>
	            
	               				<!-- ���� �ۼ� ��ư -->
	                  			<div style="text-align: right;"><button onclick="location.href='main.jsp#ques_up'">�۾���</button></div>
	         				</article>
	         
	         			<!-- Q&A : ���� �ۼ� -->
	         			<article id= "ques_up">
	         				<h1 class="major">Q&A</h1>
	               			<form method="post" action="quesWriteAction.jsp">
	                  			<table>
	                        		<tr>
	                           			<td><input class="form-control" name="ques_name" type="text" 
	                           						placeholder="���� ����"  maxlength="50" required="required"></td>
	                        		</tr>
	                        		<tr>
	                           			<td><textarea class="form-control" name="ques_cont" placeholder="���� ����"
	                           						 maxlength="2048" style="height: 350px;" required="required"></textarea></td>
	                        		</tr>
	                  			</table>
	                  			<!-- �۾��� ��ư -->
	                  			<div style="text-align: right;"><input type="submit" class="btn btn-primary pull-right" value="����"></div>
	               			</form>
	         			</article>
	   
	
	         		<!-- Q&A : ���� �� -->
	         			<article id="ques_one">
	            			<h1 class="major">Q&A</h1>
	                  		<table>
			                	<tr>
			                    	<td style="width: 20%;">���� ����</td>
			                    	<td colspan="2"></td>
			                	</tr>
			                 	<tr>
			                       	<td>�ۼ���</td>
			                     	<td colspan="2"></td>
			                 	</tr>
			                   	<tr>
			                    	<td>�ۼ�����</td>
			                   		<td colspan="2"></td>
			                 	</tr>
			                  	<tr>
			                     	<td>����</td>
			                  		<td colspan="2" style="height: 200px; text-align: left;"></td>
			                   	</tr>
	                  		</table>
	                  		<div style="text-align: right;"><button onclick="location.href='main.jsp#QNA'">���</button></div>    <br>
	         			 	
	         			 	<!-- ��ۺ��°� -->
	            			<table>
			                    <tr>
			                       <td style="text-align: center; width : 15%" >��ȣ</td>
			                       <td style="text-align: center; width : 50%">����</td>
			                       <td style="text-align: center; width : 20%">�ۼ���</td>
			                       <td style="text-align: center; width : 15%">�ۼ���</td>
			                    </tr>
		                        <tr>
		                           <td style="text-align: center;"></td>
		                           <td></td>
		                           <td style="text-align: center;"></td>
		                           <td style="text-align: center;"></td>
		                        </tr>
	                  		</table>
	            
	            			<!--��� ���� ĭ -->
	            			<form method="post" action="ansWriteAction.jsp">
	                  			<table>
	                        		<tr>
	                           			<td><textarea class="form-control" name="ans_cont" placeholder="��� �ۼ�" maxlength="100"
	                           						style="height: 50px; resize: none; overflow-y:hidden;;" required="required"></textarea></td>
	                        		</tr>
	                  			</table>
	                  			
		                  		<!-- ���� ��ư -->
		                  		<div style="text-align: right;"><input type="submit" value="����"></div>
	               			</form>
	        			</article>	         
					         
					         
					<!-- Login -->
	         			<article id="Login">
	            			<h2 class="major">Login</h2>
	
	            			<form action="LoginService" method="post">
	               				<h3>ID</h3>
	               				<input name="id" type="text" placeholder="ID�� �Է��ϼ���" required="required"> <br>
	               				<h3>PW</h3>
	               				<input name="pw" type="password" placeholder="PW�� �Է��ϼ���" required="required"> <br>
	               				<div style="text-align: center;">
	                  				<input type="submit" value="LogIn">
	               				</div>
	            			</form>
	         			</article>
	 
	 
	         		<!-- Join -->
	         			<article id="Join">
	            			<h2 class="major">Join</h2>
	
	            			<form action="JoinService" method="post">
	               				<input name="id" id="input_id" type="text" placeholder="ID�� �Է��ϼ���" required="required">   <br> 
	               				<div style="text-align: center;">
	               					<input type="button" value="Id�ߺ�üũ" onclick="idcheck()"> 
	               				</div> 		<br> 
	               				<input name="pw" type="password" placeholder="PW�� �Է��ϼ���" required="required">    	<br> 
	               				<input name="nick" type="text" placeholder="NICK�� �Է��ϼ���" required="required"> 		<br>
	               				<div style="text-align: center;">
	                  				<input type="submit" value="JoinUs">
	               				</div>
	            			</form>
	         			</article>
	
					         
					<!-- My page : �������� ���� -->
	         			<article id="ChangeInfo">
	            			<h2 class="major">�������� ����</h2>
	            			<form action="UpdateService" method="post">
	               				<h3>����ID</h3>
	               				<input name="id" type="text" placeholder="ID�� �Է��ϼ���" required="required"> <br>
	               				<h3>PW</h3>
	               				<input name="pw" type="password" placeholder="������ PW�� �Է��ϼ���"> <br>
	               				<h3>NICK</h3>
					           	<input name="nick" type="text" placeholder="������ NICK�� �Է��ϼ���"> <br>
					           	<input type="submit" value="Change" class="button fit">
	            			</form>
	         			</article>
	
	         		<!-- My page : ������ -->
	         			<article id="Product">
	            			<h2 class="major">������</h2>
				            <form action="ProductService" method="post">
				               <input name="product" id="input_product" type="text" placeholder="��ǰ��ȣ�� �Է��ϼ���" required="required">		<br>
				               <div style="text-align: center;">
				               		<input type="button" value="��ǰ��ȣ�ߺ�üũ" onclick="prodcheck()"> 
				               </div>		<br><br>
				               <select name="spice">
				                  <option value="">����� �����ϼ���.</option>
				                  <option value="�ұ�">�ұ�</option>
				                  <option value="����">����</option>
				                  <option value="����">����</option>
				               </select>	<br>
				               <div style="text-align: center;">
				               		<input type="submit" value="����" onclick="alert('��ǰ ����� �Ϸ� �ƽ��ϴ�.')"> <br>
				               </div>
				            </form> <br><br>
	            
	            
	           				<form class = "user">
								<table>
									<tr align = "center">
										<td>��ǰ��ȣ</td>
										<td>���</td>
										<td colspan="2">����Է�</td>
										<td>���ۼ�������</td>
										<td>��ǰ����</td>
									</tr>
									<%for(ProductVO pvo:Pal){%>
									<tr>
										<td name="product" id="product2" align = "center"><%= pvo.getProduct() %></td>
										<td align = "center"><%= pvo.getSpice() %></td>
										<td><input size = "1" type="text" name="value" id="mysensor" value="0"></td>
										<td><button id="user_input" type="button" onclick="alert('���ۿϷ�')">����</button></td>
										<td><span id="result"></span>	</td>
										<td align = "center"><a href="DeleteProduct?product=<%=pvo.getProduct()%>"
											onclick="if(!confirm('���� �Ͻðڽ��ϱ�?')){return false;}">����</a></td>
									</tr>
									<%}%>
								</table>
							</form>
	         			</article>

	
	         		<!-- Admin : MemberInfo -->
	         			<article id="MemberInfo">
	            			<h2 class="major">ȸ������</h2>
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
					              	<td><a href="DeleteService?id=<%=mvo.getid()%>" onclick="if(!confirm('���� �Ͻðڽ��ϱ�?')){return false;}">����</a></td>
					          	</tr>
					         	<% } %>
					       	</table>
	         			</article>
	
	      			<!-- Admin : ������ �Է� -->
	      				<article id="recipepost">
	            			<h2 class="major">RecipePost</h2>
	            			<form action="RecipePost" method="post">
	               				<h3>�丮 ��</h3>
	               				<input name="rec_name" type="text" placeholder="�丮 �̸� �Է�" required="required">			<br>
	               				<h3>�ұ�</h3> 
	               				<input name="salt" type="text" placeholder="�ұ� �� �Է�" required="required"> 				<br> 
	               				<h3>����</h3>
	               				<input name="sugar" type="text" placeholder="���� �� �Է�" required="required"> 				<br>
	               				<h3>����</h3>
	               				<input name="pepper" type="text" placeholder="���� �� �Է�" required="required"> 			<br>
	               				<div style="text-align: center;">
	                  				<input type="submit" value="�ۼ�" onclick="alert('���������� �����Ǹ� �ۼ� �Ͽ����ϴ�.')">
	               				</div>
	            			</form>
	         			</article>
					         
					         
					</div> <!-- �� -->

				<!-- Footer -->
					<footer id="footer">
						<p class="copyright">&copy; Good Spice : <a href="https://www.smhrd.or.kr">����Ʈ���簳�߿�</a>.</p>
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
	        	
	        	
	        	/* id �ߺ� üũ */
	            function idcheck() {
	               let input = document.getElementById("input_id");

	               $.ajax({
	                  type : "post", // ������ ��û ��� get/post
	                  data : {
	                     "id" : input.value
	                  }, // �����ϴ� ������
	                  url : "IdCheckService", // �����͸� ��û�ϴ� ���������� url
	                  dataType : "text", //���䵥������ ����
	                  success : function(data) { // �������� ��, �Լ� ȣ�� function(���� ���� ��)

	                     if (data == "true") {
	                        //alert(sp.innerText="��� �Ұ����� ���̵� �Դϴ�.");
	                        alert("��� �Ұ����� ���̵� �Դϴ�.")
	                     } else {
	                        //alert(sp.innerText="��� ���� �� ���̵� �Դϴ�.");
	                        alert("��� ������ ���̵� �Դϴ�.")
	                     }
	                  },
	                  error : function() { // ����
	                     alert("��Ž���")
	                  }
	               });
	            }
	        	
	        	
		        /* ��ǰ �ߺ� üũ */
		        function prodcheck() {
		           let input_prod = document.getElementById("input_product");
	
		           $.ajax({
		              type : "post", // ������ ��û ��� get/post
		              data : {"id" : input_prod.value}, // �����ϴ� ������
		              url : "ProdCheckService", // �����͸� ��û�ϴ� ���������� url
		              dataType : "text", //���䵥������ ����
		              success : function(data) { // �������� ��, �Լ� ȣ�� function(���� ���� ��)
	
		                 if (data == "true") {
		                    alert("�ߺ��� ��ǰ ��ȣ�� �ֽ��ϴ�. �ٽ� �Է����ּ���")
		                 } else {
		                    alert("��� ������ ��ǰ��ȣ �Դϴ�.")
		                 }
		              },
		              error : function() { // ����
		                 alert("��Ž���")
		              }
		           });
		        }
		        
		        
		        /* �Ƶ��̳� ��� */
		        $("#user_input").on('click',function(){
		           	var mysensor = $("#mysensor").val();
		      			$.ajax({
		      				url : "ArduinoSetValue",
		      				type : "get",
		      				data : {"mysensor" : mysensor},
		      				dataType : "json",
		      				success : function(data){
		      					$('#result').html("���� ���� " + data.mysensor + "g");
		      				},
		      				error : function(){
		      					alert('error');
		      				}
		      			});
		      		});
		        
		        
		        function postDetail(post_num) {
					$.ajax({
						type : "post", // ������ ���� ���
						data : {"post_num" : post_num }, // �����ϴ� ������
						url :  "PostDetail", // �����͸� �����ϴ� ������
						dataType : "json", // ���䵥������ ����
						success : function(res) {
							location.href = "main.jsp#post_one"
							$("#post_detail_name").html(res.post_name);
							$("#post_detail_id").html(res.mem_id);
							$("#post_detail_date").html(res.post_date);
							$("#post_detail_cont").html(res.post_cont);
						},
						 error : function() { // ����
				               alert("����� �ٽ� �õ����ּ���");
				            }
					})
					}
	       </script>

	</body>
</html>
