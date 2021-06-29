<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    /* 	System.out.println(request.getRequestURL());
    	System.out.println(request.getRequestURI());
    	System.out.println(request.getServletPath());
    	String nowu = request.getRequestURI().toString(); */
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffee</title>
<link href="coffe.css" rel="stylesheet">
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container d-flex flex-column">
	<div class="row">
		<div class="col">
			<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
			  <div class="container-fluid">
			    <a class="navbar-brand" href="#">Coffee</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			      <div class="navbar-nav">
			        <a class="nav-link active" aria-current="page" href="#">Top</a>
			        <a class="nav-link" href="#c-types">coffee types</a>
			        <a class="nav-link" href="#f-shop">franchise</a>
			      </div>
			    </div>
			  </div>
			</nav>
		</div>
	</div>
	
	<div class="row">
		<div class="col">
			<section class="content01">
				<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active" data-bs-interval="10000">
				      <img src="../myimages/coffe01.jpg" class="d-block w-100" alt="coffe01">
				    </div>
				    <div class="carousel-item" data-bs-interval="2000">
				      <img src="../myimages/coffe02.jpg" class="d-block w-100" alt="coffe02">
				    </div>
				    <div class="carousel-item">
				      <img src="../myimages/coffe03.jpg" class="d-block w-100" alt="coffe03">
				    </div>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
			</section>
		</div>
	</div>
	
	<div class="row">
		<div class="col">
			<section class="content02 d-flex flex-column justify-content-center">
				<span class="fs-2 fst-italic">
					Ei! wie schmeckt der Coffee süße,
					Lieblicher als tausend Küsse,
					Milder als Muskatenwein.
					Coffee, Coffee muss ich haben,
				</span>
				<span class="text-center">
					아! 커피는 얼마나 달콤한가.
					천 번의 키스보다 사랑스럽고
					머스캣 와인보다 부드럽구나.
					커피, 커피, 나는 커피를 마셔야 한다.
				</span>
					<span class="text-end">요한 제바스티안 바흐, '커피 칸타타' 中</span>
			</section>
		</div>
	</div>
</div>
	
<div id="c-types" class="wrapper">
	<div class="container d-flex flex-column main_content">
		<div class="row">
			<div class="col">
				<section class="content03 d-flex flex-column">
					<div class="row row-cols-1 row-cols-md-3 g-4">
					  <div class="col">
					    <div class="card">
					      <img src="../myimages/coffe01.jpg" class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title">Card title</h5>
					        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					      </div>
					    </div>
					  </div>
					  <div class="col">
					    <div class="card">
					      <img src="../myimages/coffe01.jpg" class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title">Card title</h5>
					        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					      </div>
					    </div>
					  </div>
					  <div class="col">
					    <div class="card">
					      <img src="../myimages/coffe01.jpg" class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title">Card title</h5>
					        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
					      </div>
					    </div>
					  </div>
					  <div class="col">
					    <div class="card">
					      <img src="../myimages/coffe01.jpg" class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title">Card title</h5>
					        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					      </div>
					    </div>
					  </div>
					  <div class="col">
					    <div class="card">
					      <img src="../myimages/coffe01.jpg" class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title">Card title</h5>
					        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					      </div>
					    </div>
					  </div>
					  <div class="col">
					    <div class="card">
					      <img src="../myimages/coffe01.jpg" class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title">Card title</h5>
					        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					      </div>
					    </div>
					  </div>
					  <div class="col">
					    <div class="card">
					      <img src="../myimages/coffe01.jpg" class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title">Card title</h5>
					        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					      </div>
					    </div>
					  </div>
					  <div class="col">
					    <div class="card">
					      <img src="../myimages/coffe01.jpg" class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title">Card title</h5>
					        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					      </div>
					    </div>
					  </div>
					  <div class="col">
					    <div class="card">
					      <img src="../myimages/coffe01.jpg" class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title">Card title</h5>
					        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					      </div>
					    </div>
					  </div>
					</div>
				</section>
			</div>
		</div>
	</div>
</div>


	<div id="f-shop" class="container d-flex flex-column main_content">
		<div class="row">
			<div class="col">
				<section class="content04">
					<div class="section_div_wrapper d-flex flex-wrap justify-content-around">
						<div class="btn btn-outline-light">
							<div class="img-wrapper d-flex flex-column justify-content-center img-thumbnail">
								<img src="https://w.namu.la/s/62223555ff374704aa337bb299929204693c936dc4cf8d45ec0844b189605b317667a6956e0c50c46c69600a18b652f53f85e3358a66865b8d57b8d7a00ad19c7bee3c21c440fcce90d9c662818c6d17d281d679922d413b2e1a899bb5d24614" alt="스타벅스">
							</div>
						</div>
						<div class="btn btn-outline-light">
							<div class="img-wrapper d-flex flex-column justify-content-center img-thumbnail">
								<img src="https://w.namu.la/s/e28f4b9af72b4b78359a24a570682c4a75d3ea6341e6ec972b954444f49ca9f0927565e2bdbaf12eff68622bad1e11e2823435fdb69da603b34151eb3643a34644aa84b8ece870ae67c4e5db2ef94cfc17dd45b7ffafecefffd398d75fc708e4" alt="커피빈">
							</div>
						</div>
						<div class="btn btn-outline-light">
							<div class="img-wrapper d-flex flex-column justify-content-center img-thumbnail">
								<img src="https://w.namu.la/s/f8a8fa9925c4985941cd4dc16c67fceb308b3e35a2d45ade92ba938aab453f5e1f53654c401ecaddfbbf68c2d1c877ab864e990cf19ac84938bf5bb4d6ee9d1da25c7090469fe0568b32c9b350308c676eb24615efc2eefc81a887f76d04fa2827aa39dca18ec0cb866d95084834c740" alt="이디야">
							</div>
						</div>
						<div class="btn btn-outline-light">
							<div class="img-wrapper d-flex flex-column justify-content-center img-thumbnail">
								<img src="https://ww.namu.la/s/6b2e330d1e417395c462881a4a8128f8a0d586ed4d5a3e471b6e0acd8568d2a3962aa908ff74260871bb16702326d159066cd201af42bef0a0fb22dba17755a7dcce0a9dad34a48042748e2fe4756b50dfb373ef7a021c514271b45ad5871d65" alt="탐앤탐스">
							</div>
						</div>
						<div class="btn btn-outline-light">
							<div class="img-wrapper d-flex flex-column justify-content-center img-thumbnail">
								<img src="https://w.namu.la/s/bd8d5ef83e6521572a2f48211779c61d5bab0476b8d8bb5e70f5233e30cbd9cd4385732405bc451a351c67d360f3c5cb953348a4569fcf6f678cfa0e98a6452b08a4d31f3095ad364e0e8d9fe40bad666202110c8354d3c3a081afb3b83c5fcd" alt="할리스">
							</div>
						</div>
						<div class="btn btn-outline-light">
							<div class="img-wrapper d-flex flex-column justify-content-center img-thumbnail">
								<img src="https://w.namu.la/s/1c76b66a17a84fd2c102d03d897635b0a1c180a05b6540b29101ab06dc039ac59d63b651d1d13a066f66f69480dda9a7be3a2ffa82dfce211edeffe86bbbd99c933fd237d1190a934e2fe6a4c8d875eff4f628fd0fb43f58eefb9a2626ab6dc2" alt="투썸플레이스">
							</div>
						</div>
						<div class="btn btn-outline-light">
							<div class="img-wrapper d-flex flex-column justify-content-center img-thumbnail">
								<img src="https://w.namu.la/s/5a382c8f5a12a61260c8ec675cc2dfd2d7e9307b5e15f9f515472cea73932be17ba1e020ee5fa79689991ac1a96d3aba2d11e373164ae5b49697c612bdaa2cf8f920dbe842548ffb85b5cc036302688a699012927bfd79ed7f592cab9faefc95" alt="엔제리너스">
							</div>
						</div>
						<div class="btn btn-outline-light">
							<div class="img-wrapper d-flex flex-column justify-content-center img-thumbnail">
								<img src="https://ww.namu.la/s/50d7d195ee87776b5b5eb575a7ad1f0db326725876ad091c1effaca4a965c1ce1e6790608e47ea8e9e677c31c9cc7a4b8c98e9badd05bed90b89b61b3e3b534d88b41185d1ed10a5458d60581a59ae5b921fc818220752622a79fbdbc0cc2ef7" alt="빽다방">
							</div>
						</div>
						<div class="btn btn-outline-light">
							<div class="img-wrapper d-flex flex-column justify-content-center img-thumbnail">
								<img src="https://w.namu.la/s/c1e0f2bd60604fafadfa62b92f3d765b61542c34fc3c2242d8d767121c9044ab8c313b6dc2a78325b0d561762446c5a1151236a611397cccf8dbede2a7a12afa1dc9a2493ca2ba3c27dbd94f6a21a01d1172475491aad15506e2f903cdebf602" alt="커피베이">
							</div>
						</div>
						<div class="btn btn-outline-light">
							<div class="img-wrapper d-flex flex-column justify-content-center img-thumbnail">
								<img src="https://ww.namu.la/s/b9f99df82e6701290c52e8e30fde07e77279ba8494e9e339a08342fb71ed9b21deb2437b16d498fbd3e5454c15a7dc58f1b9223a53efa0e6429ad30cf186c786a1da4a13ec8d5dc2edce8229580cfad29d9259feec0e0b7a1ee3ab290b56301e" alt="요거프레소">
							</div>
						</div>
						<div class="btn btn-outline-light">
							<div class="img-wrapper d-flex flex-column justify-content-center img-thumbnail">
								<img src="https://w.namu.la/s/bc527880dc95cad72fb367ef8e1f38da710079a2e9dfadcd1c456e604574e654b415ee2b38a6e285a4c5f1c526fcbda41ab7e10381788e024a8fa376ae07813b57d54ad71cc87e20a8fb9cedcb6041ea5e1c1f07c706899b455c1303333591b74c9f40bd5b1f5d2c99256ae4fdb39434" alt="메가MGC커피">
							</div>
							</div>
						<div class="btn btn-outline-light">
							<div class="img-wrapper d-flex flex-column justify-content-center img-thumbnail">
								<img src="https://ww.namu.la/s/1081c9623fc947f4d23f58a12393dcc11e7c691e9711cffc7d935ce5c9e6cf25f8471dddcb6340f93a6c42f41ca27987cf1d6d848b58a98b288aaa527bbc7f67771fcca2867b01fe317b9651b5749db445ae22ab6c2003f0944afc7220e6d8e6" alt="띠아모">
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>