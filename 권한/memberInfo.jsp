<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Togather</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="/assets/img/favicon.png" rel="icon" />
    <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
      rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link href="/assets/vendor/animate.css/animate.min.css" rel="stylesheet" />
    <link href="/assets/vendor/aos/aos.css" rel="stylesheet" />
    <link
      href="/assets/vendor/bootstrap/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />

    <link
      href="/assets/vendor/bootstrap-icons/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="/assets/css/style.css" rel="stylesheet" />
    <!-- alert  -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<!-- alert -->
    <script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  	<script type="text/javascript">
  	function gradeChange(num){ 
  		var checkNum= num;
  		if(checkNum==1){
	  		Swal.fire({
				  title: '운영진으로 바꾸시나요?',
				  icon: 'question',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes'
				}).then((result) => {
					if (result.isConfirmed) {
						var mnum= ${memberInfo.mnum};
						var gseq = ${gseq};
						var result = {"mnum":mnum,"gseq":gseq,"num":checkNum};
						$.ajax({
							url: "../groupTab/gradeChange.json",
							type: "POST",
							data: result,
							success: function(data){
								console.log(data);
								Swal.fire({
									title:"권한 변경 완료",
									icon:"success"
									}).then((result) => {
										if(result){
											opener.location.reload();
											window.close();
										}
								});									
							}
						});
					}
				});
  		}else{
  			Swal.fire({
				  title: '회원으로 바꾸시나요?',
				  icon: 'question',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes'
				}).then((result) => {
					if (result.isConfirmed) {
						var mnum= ${memberInfo.mnum};
						var gseq = ${gseq};
						var result = {"mnum":mnum,"gseq":gseq,"num":checkNum};
						$.ajax({
							url: "../groupTab/gradeChange.json",
							type: "POST",
							data: result,
							success: function(data){
								console.log(data);
								Swal.fire({
									title:"권한 변경 완료",
									icon:"success"
									}).then((result) => {
										if(result){
											opener.location.reload();
											window.close();
										}
								});									
							}
						});
					}
				});
  		}
  	}
	function kickout(){
		Swal.fire({
			  title: '강퇴 하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
				if (result.isConfirmed) {
					var mnum = ${memberInfo.mnum};
					var gseq = ${gseq};
					var result = {"mnum":mnum,"gseq":gseq};
					$.ajax({
						url: "../groupTab/kickout.json",
						type: "POST",
						data: result,
						success: function(data){
							console.log(data);
							Swal.fire({
								title:"강퇴완료",
								icon:"success"
								}).then((result) => {
									if(result){
										opener.location.reload();
										window.close();
									}
							});									
						}
					});
				}
			});
			
			
	}
	  
	  function blocking(){
  		Swal.fire({
  			  title: '차단 하시겠습니까?',
  			  icon: 'question',
  			  showCancelButton: true,
  			  confirmButtonColor: '#3085d6',
  			  cancelButtonColor: '#d33',
  			  confirmButtonText: 'Yes'
  			}).then((result) => {
  			  if (result.isConfirmed) {
  				var blocking = ${m.mnum};
  			    var blocked = ${memberInfo.mnum};
  			    var result = {"blocking":blocking,"blocked":blocked};
	  		  		$(function(){
		  		  		$.ajax({
							url: "../member/blocking.json",
							type: "POST",
							data: result,
							success: function(data){
								console.log(data);
								if(data==1){
									Swal.fire({
										title:"차단완료",
										icon:"success"
										}).then((result) => {
											if(result){
												location.reload();
											}
										});									
								}
							}
						});
	  		  		});
  			  }  			  
  			});
  	}
	  
	  function blockingCancel(){
		    var blocking = ${m.mnum};
		    var blocked = ${memberInfo.mnum};
		    var result = {"blocking":blocking,"blocked":blocked};
	    	$(function(){
				$.ajax({
					url: "../member/blockingCancel.json",
					type: "POST",
					data: result,
					success: function(data){
						console.log(data);
						if(data==1){
							Swal.fire({
								title:"차단 해제 완료",
								icon:"success"
								}).then((result) => {
									if(result){
										location.reload();
									}
								});
						}
					}
				});
			});
	  }
   </script>
  </head>
  
  <body>
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top">
      <div class="container d-flex align-items-center">
        <h1 class="logo me-auto"><a href="index.html">Togather</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
        <!-- .navbar -->

        <c:choose>
        	<c:when test="${empty fn:trim(blockedCheck)}">
        		<a href="javascript:void(0)" onclick="location.href='javascript:blocking()'" class="get-started-btn">차단하기</a>
      		</c:when>
      		<c:otherwise>
      			<a href="javascript:void(0)" onclick="location.href='javascript:blockingCancel()'" class="get-started-btn">차단해제하기</a>
      		</c:otherwise>
      	</c:choose>
      </div>
    </header>
    <!-- End Header -->

    <main id="main">
      <!-- ======= Breadcrumbs ======= -->
      <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
          <h1>${memberInfo.mname }</h1>
        </div>
      </div>
      <!-- End Breadcrumbs -->
		
      <!-- ======= Contact Section ======= -->
      <section id="contact" class="contact">
        <div data-aos="fade-up">
        </div>
		<c:choose>
			<c:when test="${empty fn:trim(blockedCheck)}">
		        <div class="container" data-aos="fade-up">
		          <div class="row mt-5">
		            <div class="col-lg-4">
		              <div class="info">
		                <div class="address">
		
		                  <h4>이름 : </h4>
		                </div>
		                <div class="email">
		
		                  <h4>생일</h4>
		                </div>
		                <div class="phone">
		
		                  <h4>거주지역</h4>
		                </div>
		              </div>
		            </div>
		
		            <div class="col-lg-8 mt-5 mt-lg-0">
		              <form
		                action="forms/contact.php"
		                method="post"
		                role="form"
		                class="php-email-form"
		              >
		                <div class="row">
		                  <div class="col-md-6 form-group">
		                    <h4> ${memberInfo.mname }</h4>
		                  </div>
		                  <div class="col-md-6 form-group mt-3 mt-md-0">
		                  </div>
		                </div>
		                <div class="form-group mt-3">
		                  <h4>${memberInfo.birth }</h4>
		                </div>
		                <div class="form-group mt-3">
		                  <h4>${memberInfo.maddr }</h4>
		                </div>
				
              		
              	
                <div class="text-center">
                <c:if test="${grade ==0 || grade==1}">
                	<div id="div1" class="btn-group">
									<button id="button1"
									  type="button"
									  class="btn btn-outline-light dropdown-toggle"
									  data-bs-toggle="dropdown"
									  aria-expanded="false"
									  style="color: black; border-color: black;background-color:#fff">
									<span id='span1'>권한</span>
									</button>
										<ul id="ul1" class="dropdown-menu">	
											<li><a  class='dropdown-item' onclick="javascript:gradeChange(1)" data-value='운영진'>운영진</a></li>
											<li><a  class='dropdown-item' onclick="javascript:gradeChange(2)" data-value='회원'>회원</a></li>
										</ul>
								  </div>
							</c:if>
                	<c:if test="${grade ==0 || grade==1}">
                		<a type="button" onclick="location.href='javascript:kickout()'" class="get-started-btn">강퇴하기</a>
                	</c:if>
                    <a type="button" onclick="location.href='sendMessageForm?to_mnum=${m.mnum}&to_mname=${m.mname}&from_mnum=${memberInfo.mnum}&from_mname=${memberInfo.mname}&gseq=${gseq}'" class="get-started-btn">Send Message</a>
                </div>
              </form>
              
            
            </div>
          </div>
        </div>
        </c:when>
        <c:otherwise>
        	<div class="container" data-aos="fade-up">
		        <div class="row mt-5">
		            <div class="col-lg-4">
		              <div class="info">
		                <div class="address">
		                  <h2>차단한 회원입니다</h2>
		                </div>
		              </div>
		            </div>
		          </div>
		     </div>
        </c:otherwise>
        </c:choose>
      </section>
      <!-- End Contact Section -->
    </main>
    <!-- End #main -->


    <div id="preloader"></div>
 
    <!-- Vendor JS Files -->
    <script src="/assets/vendor/purecounter/purecounter.js"></script>
    <script src="/assets/vendor/aos/aos.js"></script>
    <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="/assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="/assets/js/main.js"></script>
  </body>
</html>
