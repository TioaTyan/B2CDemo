﻿<%@ Page Title="首页_B2CDemo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="B2C_NetShop._Default" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HalfPageContentPlaceHolder" runat="server">
	<script>
		$(function () {
			$("#banner-left-arrow,#banner-right-arrow,#banner-small-left-arrow,#banner-small-right-arrow").css("display", "none");
			$("#banner-modal").hover(function () {
				$("#banner-left-arrow,#banner-right-arrow").css("display", "block");
			}, function () {
				$("#banner-left-arrow,#banner-right-arrow").css("display", "none");
			});

			$("#banner-small-modal").hover(function () {
				$("#banner-small-left-arrow,#banner-small-right-arrow").css("display", "block");
			}, function () {
				$("#banner-small-left-arrow,#banner-small-right-arrow").css("display", "none");
			});


			$(".footer_goods_detail").hover(function () {
				console.log($(this).is(":visible"));
				$(this).find(".book_price").slideDown();
			}, function () {
				$(this).find(".book_price").stop(true, false).slideUp();
			});
			$("#notice .tabh_0").hover(
				function () {
					$(this).removeClass("first");
					$(this).addClass("on");
					$("#notice .tabh_1").removeClass("on");
					$("#notice .tab_1").show();
					$("#notice .tab_2").hide();
				}
			);
			$("#notice .tabh_1").hover(
				function () {
					$(this).removeClass("first");
					$(this).addClass("on");
					$("#notice .tabh_0").removeClass("on");
					$("#notice .tab_2").show();
					$("#notice .tab_1").hide();
				}
			);
		});
	</script>
	<link href="IndexStyle/default-banner-login-style.css" rel="stylesheet" />
	<div>
		<div>
			<div id="banner">
				<div id="myCarousel" class="carousel slide">
					<!-- 轮播（Carousel）指标 -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<!-- 轮播（Carousel）项目 -->
					<div class="carousel-inner">
						<div class="item active">
							<img src="img/DefaultImg/4.jpg" alt="First slide">
							<asp:DataList ID="DataList1" runat="server">
							</asp:DataList>
						&nbsp;</div>
						<div class="item">
							<img src="img/DefaultImg/5.jpg" alt="Second slide">
						</div>
						<div class="item">
							<img src="img/DefaultImg/6.jpg" alt="Third slide">
						</div>
					</div>
					<!-- 轮播（Carousel）导航 -->
					<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
				<div id="banner-modal" class="carousel slide">
					<!-- 轮播（Carousel）指标 -->
					<!-- <ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active">1</li>
				<li data-target="#myCarousel" data-slide-to="1">2</li>
			</ol> -->
					<!-- 轮播（Carousel）项目 -->
					<div class="carousel-inner">
						<div class="item active">
							<a href="#">
								<img class="product-ad" src="img/product-ad-img/02.jpg" alt="First slide">
								<span class="cover"></span>
							</a>
							<a href="#">
								<img class="product-ad" src="img/product-ad-img/02.jpg" alt="First slide">
								<span class="cover"></span></a>
							<a href="#">
								<img class="product-ad" src="img/product-ad-img/03.jpg" alt="First slide">
								<span class="cover"></span></a>
							<a href="#">
								<img class="product-ad" src="img/product-ad-img/04.jpg" alt="First slide">
								<span class="cover"></span></a>
						</div>
						<div class="item">
							<a href="#">
								<img class="product-ad" src="img/product-ad-img/05.jpg" alt="Second slide">
								<span class="cover"></span>
							</a>
							<a href="#">
								<img class="product-ad" src="img/product-ad-img/06.jpg" alt="Second slide">
								<span class="cover"></span></a>
							<a href="#">
								<img class="product-ad" src="img/product-ad-img/07.jpg" alt="Second slide">
								<span class="cover"></span></a>
							<a href="#">
								<img class="product-ad" src="img/product-ad-img/08.jpg" alt="Second slide">
								<span class="cover"></span></a>
						</div>
					</div>
					<a id="banner-left-arrow" class="left carousel-control" href="#banner-modal" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a id="banner-right-arrow" class="right carousel-control" href="#banner-modal" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div id="div_right">
				<div id="user_info_container" style="display: none">
					<div id="user_img">
						<a href="User/Info.aspx" target="_blank">
							<%--<img id="" src="Account/UserImg/DefaultUserImg.png" style="width: 50px; height: 50px">--%>
							<asp:Image ID="Image1" runat="server" Style="width: 50px; height: 50px" ImageUrl="~/User/ImagesUpload/DefaultImage.png" /></a>
					</div>
					<div id="user_info">
						<div id="user_info_name">
							<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
						</div>
						<div id="user_info_btn">
							<asp:HyperLink ID="HyperLink1" runat="server" CssClass="user_info_btn_a">HL1</asp:HyperLink>
							<asp:HyperLink ID="HyperLink2" runat="server" CssClass="user_info_btn_a">HL2</asp:HyperLink>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<a href="#">
					<img src="img/product-ad-img/sponsor.jpg" alt="Alternate Text" height="185px" width="202px" /></a>
				<div id="notice">
					<div class="home_notice_gg">
						<div class="head  headhome_notice_gg">
							<ul class="tab_aa">
								<li class="tabh_0  first" type="bar"><span>信息公告</span></li>
								<li class="tabh_1 on" type="bar"><a href="http://blog.dangdang.com/?page_id=3382" target="_blank" dd_name="服务公告"><span>服务公告</span></a></li>
							</ul>


						</div>
						<div class="tab_content_aa tab_content_aahome_notice_gg ">
							<div class="content tab_1" type="item" ddt-area="9270" dd_name="信息公告">
								<div id="logo_content">
									<ul id="cxgg_content">
										<li>
											<a href="http://shop.dangdang.com/21540" target="_blank" title="笛莎大牌日，限时4件2折" dd_name="信息公告1">
												<span>笛莎大牌日，限时4件2折</span>
											</a>
										</li>
										<li>
											<a href="http://shop.dangdang.com/21611" target="_blank" title="珀莱雅约惠日 限时3件4折" dd_name="信息公告2">
												<span>珀莱雅约惠日 限时3件4折</span>
											</a>
										</li>
										<li>
											<a href="http://book.dangdang.com/520aidu" target="_blank" title="百万图书每满100减50" dd_name="信息公告3">
												<span>百万图书每满100减50</span>
											</a>
										</li>
										<li>
											<a href="http://shop.dangdang.com/19384" target="_blank" title="飞利浦儿童节350减40" dd_name="信息公告4">
												<span>飞利浦儿童节350减40</span>
											</a>
										</li>
										<li>
											<a href="http://baby.dangdang.com/20190514_haei" target="_blank" title="礼品童书每满100减50" dd_name="信息公告5">
												<span>礼品童书每满100减50</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="content tab_2" type="item" style="display: block;" ddt-area="9272" dd_name="服务公告">
								<div id="logo_content">
									<ul id="cxgg_content">
										<li>
											<a href="http://blog.dangdang.com/?p=28129%20%3E%3Cspan%20style=" target="_blank" title="快钱网“光大银行”支付关闭通知"
												dd_name="服务公告1">
												<span>快钱网“光大银行”支付关闭通知</span>
											</a>
										</li>
										<li>
											<a href="http://book.dangdang.com/20161128_zl3t" target="_blank" title="当当阅读器 海量电子书随时读" dd_name="服务公告2">
												<span>当当阅读器 海量电子书随时读</span>
											</a>
										</li>
										<li>
											<a href="http://cashier.dangdang.com/exchangeApply" target="_blank" title="话费卡兑换当当礼品卡" dd_name="服务公告3">
												<span>话费卡兑换当当礼品卡</span>
											</a>
										</li>
										<li>
											<a href="http://giftcard.dangdang.com/goods?type=mall" target="_blank" title="多种商品，礼品卡支付更优惠！" dd_name="服务公告4">
												<span>多种商品，礼品卡支付更优惠！</span>
											</a>
										</li>
										<li>
											<a href="http://blog.dangdang.com/?p=22276" target="_blank" title="关于假冒客服诈骗的声明" dd_name="服务公告5">
												<span style="color: #ff2832">关于假冒客服诈骗的声明</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="banner-small-modal" class="carousel slide">

					<!-- 轮播（Carousel）项目 -->
					<div class="carousel-inner">
						<div class="item active">
							<a href="#">
								<img class="product-ad-small" src="img/product-ad-img/a.jpg" alt="First slide"></a>
						</div>
						<div class="item">
							<a href="#">
								<img class="product-ad-small" src="img/product-ad-img/b.jpg" alt="Second slide"></a>
						</div>
						<div class="item">
							<a href="#">
								<img class="product-ad-small" src="img/product-ad-img/c.jpg" alt="Third slide"></a>
						</div>
					</div>
					<!-- 轮播（Carousel）导航 -->
					<a id="banner-small-left-arrow" class="left carousel-control" href="#banner-small-modal" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a id="banner-small-right-arrow" class="right carousel-control" href="#banner-small-modal" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	
	<div id="footer" style="display: none;">
		<div id="footer_1st">
			<div class="footer_type">
				<h2>商城精选</h2>
				<p>精选图书，值得一看</p>
			</div>
			<div class="footer_btn"><a target="_blank" class="btn btn-default" href="Goods/refinement.aspx">查看更多 &raquo;</a></div>
			<div class="footer_goods_frame">
				<%--datalist test start--%>
				<asp:DataList ID="DataList_RefinementGoods" runat="server" RepeatDirection="Horizontal">
					<ItemTemplate>

						<div class="footer_goods_detail">
							<a style="display: block;" href="<%# Eval("BookUrl") %>"><%--bookurl--%>
								<%--bookimg--%>
								<div class="product-card">
									<img src="<%# Eval("picUrl") %>" alt="Alternate Text" class="bookImg" />
									<span class="book_name"><%# Eval("BookName") %></span> <%--bookname--%>
									<span class="book_author"><%# Eval("Author") %>&nbsp;著</span> <%--bookauthor--%>
									<div class="book_price">售价：<%# Eval("HotPrice") %>&nbsp;元</div>
									<%--hotprice--%>
							</a>
						</div>

					</ItemTemplate>
				</asp:DataList>
				<%--datalist test end--%>
			</div>
			<div class="clear"></div>
		</div>
		<div id="footer_2nd">
			<div class="footer_type">
				<h2>商城热卖</h2>
				<p>人气图书，每天更新</p>
			</div>
			<div class="footer_btn"><a target="_blank" class="btn btn-default" href="Goods/hot.aspx">查看更多 &raquo;</a></div>
			<div class="footer_goods_frame">
				<%--datalist test start--%>
				<asp:DataList ID="DataList_HotGoods" runat="server" RepeatDirection="Horizontal">
					<ItemTemplate>
						<%--bookimg--%>
						<div class="footer_goods_detail">
							<div class="product-card">
								<a href="<%# Eval("BookUrl") %>"><%--bookurl--%>
									<img src="<%# Eval("picUrl") %>" alt="Alternate Text" class="bookImg" />
									<%--bookimg--%>
									<span class="book_name"><%# Eval("BookName") %></span> <%--bookname--%>
									<span class="book_author"><%# Eval("Author") %>&nbsp;著</span> <%--bookauthor--%>
									<div class="book_price">售价：<%# Eval("HotPrice") %>&nbsp;元</div>
									<%--hotprice--%></a>
							</div>
						</div>
					</ItemTemplate>
				</asp:DataList>
				<%--datalist test end--%>
			</div>
			<div class="clear"></div>
		</div>
		<div id="footer_3rd">
			<div class="footer_type">
				<h2>商城折扣</h2>
				<p>折扣图书，低至一折</p>
			</div>
			<div class="footer_btn"><a target="_blank" class="btn btn-default" href="Goods/discount.aspx">查看更多 &raquo;</a></div>
			<div class="footer_goods_frame">
				<%--datalist test start--%>
				<asp:DataList ID="DataList_DiscountGoods" runat="server" RepeatDirection="Horizontal">
					<ItemTemplate>
						<div class="footer_goods_detail">
							<a href="<%# Eval("BookUrl") %>"><%--bookurl--%>
								<%--bookimg--%>
								<div class="product-card">
									<a href="#">
										<img src="<%# Eval("picUrl") %>" alt="Alternate Text" class="bookImg" />
									</a>
									<span class="book_name"><%# Eval("BookName") %></span> <%--bookname--%>
									<span class="book_author"><%# Eval("Author") %>&nbsp;著</span> <%--bookauthor--%>
									<div class="book_price">售价：<%# Eval("HotPrice") %>&nbsp;元</div>
									<%--hotprice--%>
							</a>
						</div>
						</div>
					</ItemTemplate>
				</asp:DataList>
				<%--datalist test end--%>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<script type="text/javascript">
		$(".tab_2").css("display", "block");
		$(".tab_2").siblings().css("display", "none");
		$(function () {
			$(".bd_body .tab_box_aa li").hover(function () {
				var clz = $(this).attr("class");
				clz = clz.substr(5, 1);
				var i = parseInt(clz) + 1;
				$(this).addClass("on").siblings().removeClass("on");
				$(".left-tab_" + String(i)).css("display", "block");
				$(".left-tab_" + String(i)).siblings().css("display", "none");
				console.log(".left-tab_" + String(i));
			});

			$(".bd_body .floor_tab_bang .tab_aa li").hover(function () {
				var clz = $(this).attr("class");
				clz = clz.substr(5, 1);
				var i = parseInt(clz) + 1;
				$(this).addClass("on").siblings().removeClass("on");
				$(".floor_tab_bang .tab_" + String(i)).css("display", "block");
				$(".floor_tab_bang .tab_" + String(i)).siblings().css("display", "none");
			});

			$(".bd_body .list_ab .bar").hover(function () {
				var clz = $(this).attr("class");
				clz = clz.substr(4, 2);
				$(this).addClass("hidden");
				$(this).siblings().removeClass("hidden");
				$(this).next().attr("style", "display:list-item;");
				$(this).next().siblings(".item").css("display", "none");

			});
		});
	</script>
	<style type="text/css">!
		.bd_body {
			width: 1200px;
			margin: 0 auto;
			background-color: #fff;
		}

		html {
			font-size: 12px;
		}

		a {
			text-decoration: none;
			color: #666;
		}


		body,
		ul,
		li,
		ol,
		p,
		dl,
		dd,
		h1,
		h2,
		h3,
		h4,
		h5,
		h6,
		img,
		iframe,
		form {
			margin: 0;
			padding: 0;
			list-style-type: none;
			border: 0;
		}

		.book_new {
			height: 499px;
			overflow: hidden;
			position: relative;
			margin: 0 auto 30px;
		}

			.book_new .home_screen_head {
				position: absolute;
				top: 0;
				left: 0;
				overflow: hidden;
				width: 910px;
				height: 44px;
				border-bottom: 2px solid #000;
				color: #323232;
				font: bold 20px/44px "Microsoft YaHei";
			}

			.book_new .tab_box_aa {
				position: absolute;
				top: 56px;
				left: 0;
				width: 910px;
				height: 443px;
			}

			.book_new .floor_tab_bang {
				width: 278px;
				height: 497px;
				position: absolute;
				right: 0;
				top: 0;
				border: 1px solid #e6e6e6;
				overflow: hidden;
			}

			/*--------------------------------------*/
			/*--------------.home_screen_head------------------------*/

			.book_new .home_screen_head a,
			.book_new .home_screen_head a:hover {
				color: #323232;
				text-decoration: none;
				cursor: pointer;
			}

			.book_new .home_screen_head span {
				font-size: 16px;
				position: relative;
				top: -3px;
			}



			/*--------------------------------------*/
			/*--------------.tab_box_aa ------------------------*/
			/*--------------.head ------------------------*/
			.book_new .tab_box_aa .head {
				height: 44px;
				width: 655px;
				border-right: 1px solid #e6e6e6;
				position: absolute;
				top: -56px;
				right: 0;
			}

				.book_new .tab_box_aa .head .tab_aa {
					float: right;
				}

			.book_new .tab_box_aa .tab_aa li {
				float: left;
				width: 114px;
				height: 42px;
				padding-top: 1px;
				border: 1px solid #e6e6e6;
				border-width: 1px 0 0 1px;
				text-align: center;
				background-color: #f5f5f5;
				font: 14px/42px "Microsoft YaHei";
				color: #646464;
				cursor: default;
				overflow: hidden;
			}

				.book_new .tab_box_aa .tab_aa li.first {
					margin-right: 0;
				}

			/*--------------.tab_box_aa ------------------------*/
			/*--------------.tab_content_aa tab_content_aa  ------------------------*/
			.book_new .tab_box_aa .tab_content_aa {
				border-top: 1px solid #e6e6e6;
				border-bottom: 1px solid #e6e6e6;
				width: 910px;
				height: 441px;
				overflow: hidden;
				position: relative;
			}

			.book_new .tab_box_aa .tab_aa li.on {
				font-weight: bold;
				background-color: #fff;
				width: 112px;
				border: 2px solid #000;
				border-bottom: 0;
				padding: 0 0 2px 0;
				margin-bottom: -2px;
				color: #525252;
			}

		.con {
			clear: both;
		}

		.book_new .tab_box_aa .tab_content_aa .book_left_pic {
			width: 238px;
			height: 441px;
			border: 1px solid #e6e6e6;
			border-width: 0 1px;
			position: absolute;
			top: 0;
			left: 0;
			display: block;
			overflow: hidden;
			text-align: center;
		}

		.book_new .book_tab_img {
			position: absolute;
			bottom: 0;
			left: 1px;
			width: 237px;
			padding-left: 1px;
			background-color: #fff;
			background: url(http://img63.ddimg.cn/upload_img/00111/home/home_bg_1509.png) 0 0;
		}

			.book_new .book_tab_img li {
				float: left;
				width: 63px;
				height: 28px;
				line-height: 28px;
				padding-left: 16px;
				overflow: hidden;
			}

				.book_new .book_tab_img li a,
				.book_new .book_tab_img li a:hover {
					color: #323232;
					font: 12px/28px "Microsoft YaHei";
				}

					.book_new .book_tab_img li a:hover {
						color: #ff2832;
					}

		/*--------------.tab_box_aa ------------------------*/
		/*--------------.tab_content_aa tab_content_aa  ------------------------*/
		/*--------------.roll_aa  ------------------------*/
		.book_new .roll_aa {
			width: 335px;
			height: 220px;
			border-right: 1px solid #e6e6e6;
			border-bottom: 1px solid #e6e6e6;
			top: 0;
			left: 240px;
			overflow: hidden;
			position: absolute;
		}

		.book_new .mix_marquee_tab {
			position: absolute;
			bottom: 6px;
			left: 50%;
			z-index: 666;
		}

			.book_new .mix_marquee_tab li.current {
				background: #5e5e5e;
			}

			.book_new .mix_marquee_tab li {
				float: left;
				width: 10px;
				height: 3px;
				margin-right: 4px;
				_display: inline;
				font-size: 0;
				line-height: 9px;
				overflow: hidden;
				background: #fff;
			}

		.book_new .roll_aa .btn_brand_prev,
		.book_new .roll_aa .btn_brand_next {
			display: block;
			position: absolute;
			width: 30px;
			height: 43px;
			top: 7px;
			background-image: url(http://img60.ddimg.cn/upload_img/00111/home/home_sprite_1507.png);
			background-repeat: no-repeat;
			background-color: #000;
			z-index: 20;
			cursor: pointer;
			opacity: 0.2;
			filter: alpha(opacity=20);
		}

		.book_new .roll_aa .btn_brand_prev {
			left: 0;
			background-position: 0px -83px;
		}

		.book_new .roll_aa .btn_brand_next {
			right: 0;
			background-position: -36px -83px;
		}

		.book_new .book_upper2 {
			position: absolute;
			top: 0;
			right: 0;
			height: 220px;
			overflow: hidden;
			border-bottom: 1px solid #e6e6e6;
		}

			.book_new .book_upper2 .pic,
			.book_new .book_lower4 .pic {
				float: left;
				width: 166px;
				height: 220px;
				overflow: hidden;
				border-right: 1px solid #e6e6e6;
			}

			.book_new .book_upper2 .list_aa {
				float: left;
				width: 166px;
				height: 220px;
				border-right: 1px solid #e6e6e6;
				position: relative;
			}

			.book_new .book_upper2 li .img,
			.book_new .book_lower4 li .img {
				display: block;
				width: 150px;
				height: 150px;
				overflow: hidden;
				text-align: center;
				margin: 7px auto 0;
			}

			.book_new .book_upper2 li .name,
			.book_new .book_lower4 li .name {
				height: 16px;
				line-height: 16px;
				width: 150px;
				margin: 5px auto 0;
				overflow: hidden;
			}

			.book_new .book_upper2 li .price,
			.book_new .book_lower4 li .price {
				width: 150px;
				margin: 3px auto 0;
			}

			.book_new .book_upper2 li .rob,
			.book_new .book_lower4 li .rob {
				color: #ff2832;
				font: 14px Arial;
				display: inline-block;
				margin-right: 10px;
			}

			.book_new .book_upper2 li .price_r,
			.book_new .book_lower4 li .price_r {
				font: 12px Arial;
				color: #969696;
				text-decoration: line-through;
			}



		.book_new .book_lower4 {
			position: absolute;
			top: 221px;
			right: 0;
			width: 668px;
			height: 220px;
			overflow: hidden;
		}

			.book_new .book_lower4 .list_aa {
				float: left;
				width: 166px;
				height: 220px;
				border-right: 1px solid #e6e6e6;
				position: relative;
			}

			.book_new .book_upper2 li .img,
			.book_new .book_lower4 li .img {
				display: block;
				width: 150px;
				height: 150px;
				overflow: hidden;
				text-align: center;
				margin: 7px auto 0;
			}

		/*--------------.tab_box_aa ------------------------*/
		/*--------------.tab_content_aa floor_tab_bang   ------------------------*/
		/*head*/
		.book_new .floor_tab_bang .headfloor_tab_bang {
			height: 46px;
			width: 280px;
		}

			.book_new .floor_tab_bang .headfloor_tab_bang li {
				float: left;
				height: 46px;
				width: 139px;
				border-right: 1px solid #e6e6e6;
				text-align: center;
				color: #464646;
				font: 16px/46px "Microsoft YaHei", Simsun;
				background-color: #f5f5f5;
				cursor: default;
				border-bottom: 1px solid #e6e6e6;
			}

				.book_new .floor_tab_bang .headfloor_tab_bang li.on {
					background-color: #fff;
					border-bottom: 1px solid #fff;
				}

		.book_new .book_top li.line2 .num,
		.book_new .book_top li.line3 .num {
			color: #ff3228;
		}

		/*content*/
		.book_new .book_top ul {
			height: 429px;
			width: 278px;
			overflow: hidden;
		}

		.book_new .book_top li {
			border-bottom: 1px solid #e5e5e5;
			width: 278px;
			clear: both;
			vertical-align: top;
		}

			.book_new .book_top li.item {
				height: 132px;
			}

			.book_new .book_top li.bar {
				height: 32px;
				line-height: 32px;
			}

			.book_new .book_top li.line1 .num {
				color: #ff3228;
				font-weight: bold;
			}

			.book_new .book_top li .num {
				float: left;
				width: 25px;
				height: 33px;
				font: 12px/33px Arial;
				padding-left: 15px;
				background: #fff;
				margin-bottom: -1px;
				overflow: hidden;
			}


			.book_new .book_top li .img {
				width: 90px;
				height: 90px;
				overflow: hidden;
				float: left;
				margin: 15px 0 0;
			}

				.book_new .book_top li .img img {
					width: 90px;
					height: 90px;
				}

			.book_new .book_top li .name {
				float: left;
				width: 140px;
				height: 32px;
				line-height: 32px;
				overflow: hidden;
			}

			.book_new .book_top li.item .name {
				height: 100px;
				margin: 15px 0 0 5px;
				_display: inline;
			}

				.book_new .book_top li.item .name a {
					line-height: 20px;
				}

					.book_new .book_top li.item .name a span {
						display: block;
						color: #969696;
					}

					.book_new .book_top li.item .name a span {
						display: block;
						color: #969696;
					}

				.book_new .book_top li.item .name a {
					line-height: 20px;
					display: block;
				}
	</style>
	<div class="bd_body">
		<div class="book_new " type="ajax" page_id="317715" domain="mixpage.dangdang.com" areaid="0" page_type="3" areatype="0"
			name="m3208542_pid0_t15677" dd_name="图书A版" hvid="31192" component_map_id="3208542" ddt-area="3208542" is_loaded="true">
			<!-- use cache-->
			<div id="component_3208542"></div>
			<div class="home_screen_head clearfix" id="f_title">
				<a href="http://book.dangdang.com/" target="_blank" dd_name="图书">图书</a>

				<span>.</span>
				<a href="http://e.dangdang.com/" target="_blank" dd_name="电子书">电子书</a>
				<span>.</span>
				<a href="http://e.dangdang.com/new_original_index_page.html" target="_blank" dd_name="">网络文学</a>
			</div>



			<div class="tab_box_aa " id="component_map_id_3208542_part_id_9339" name="m3208542_pid9370_p9339" js="true"
				itemclass="" action="hover" delay="0" speed="0" rand="0" area="0" barclass="on" updown="1" level="2" ddt-area="9339">
				<div class="head  head">
					<ul class="tab_aa">
						<li class="tabh_0  first" type="bar"><span>最新上架</span></li>
						<li class="tabh_1" type="bar"><span>独家畅品</span></li>
						<li class="tabh_2 on" type="bar"><span>重点推荐</span></li>
						<li class="tabh_3" type="bar"><span>电子书</span></li>
						<li class="tabh_4" type="bar"><span>网络文学</span></li>
					</ul>


				</div>
				<div class="tab_content_aa tab_content_aa ">
					<div class="content left-tab_1" type="item" ddt-area="9354" dd_name="最新上架" style="display: none;">
						<div class=" " name="m3208542_pid9370_9354_t15678">
							<div class="con " name="m3208542_pid9370_9354_t15679">
								<a class="book_left_pic book_left_pic_1  pic" ddt-area="9341" href="http://baby.dangdang.com/20190430_ln31"
									title="礼品童书 每满100减50" target="_blank" nname="mixpage-317715-15640_8_1" dd_src="lcdt238x441-1558317845_d37f59646f4883cc"
									dd_name="图书A版_左_专题_TAB1">
									<img src="http://img62.ddimg.cn/upload_img/00678/zsts/lcdt238x441-1558317845.jpg"
										title="礼品童书 每满100减50" alt="礼品童书 每满100减50" ddt-pit="1" ddt-src="lcdt238x441-1558317845_d37f59646f4883cc"></a>
								<ul class="book_tab_img">
									<li nname="mixpage-317715-15640_8_1" class="line line1 on" ddt-area="9342" ddt-pit="1">
										<a dd_name="图书A版_左_分类_TAB1" dd_src="" href="http://book.dangdang.com/children?ref=book-01-A" target="_blank"
											class="" title="童书">童书</a> </li>
									<li nname="mixpage-317715-15640_8_2" class="line line2 " ddt-area="9342" ddt-pit="2">
										<a dd_name="图书A版_左_分类_TAB1" dd_src="" href="http://book.dangdang.com/study" target="_blank" class="" title="中小学教辅">中小学教辅</a>
									</li>
									<li nname="mixpage-317715-15640_8_3" class="line line3 " ddt-area="9342" ddt-pit="3">
										<a dd_name="图书A版_左_分类_TAB1" dd_src="" href="http://book.dangdang.com/language" target="_blank" class=""
											title="外语">外语</a>
									</li>
									<li nname="mixpage-317715-15640_8_4" class="line line4 " ddt-area="9342" ddt-pit="4">
										<a dd_name="图书A版_左_分类_TAB1" dd_src="" href="http://book.dangdang.com/exam" target="_blank" class="" title="考试">考试</a>
									</li>
									<li nname="mixpage-317715-15640_8_5" class="line line5 " ddt-area="9342" ddt-pit="5">
										<a dd_name="图书A版_左_分类_TAB1" dd_src="" href="http://book.dangdang.com/01.03.htm" target="_blank" class=""
											title="小说">小说</a> </li>
									<li nname="mixpage-317715-15640_8_6" class="line line6 " ddt-area="9342" ddt-pit="6">
										<a dd_name="图书A版_左_分类_TAB1" dd_src="" href="http://book.dangdang.com/01.05.htm" target="_blank" class=""
											title="文学">文学</a> </li>
									<li nname="mixpage-317715-15640_8_7" class="line line7 " ddt-area="9342" ddt-pit="7">
										<a dd_name="图书A版_左_分类_TAB1" dd_src="" href="http://book.dangdang.com/01.01.htm" target="_blank" class=""
											title="青春文学">青春文学</a> </li>
									<li nname="mixpage-317715-15640_8_8" class="line line8 " ddt-area="9342" ddt-pit="8">
										<a dd_name="图书A版_左_分类_TAB1" dd_src="" href="http://book.dangdang.com/01.21.htm" target="_blank" class=""
											title="成功/励志">成功/励志</a> </li>
									<li nname="mixpage-317715-15640_8_9" class="line line9 " ddt-area="9342" ddt-pit="9">
										<a dd_name="图书A版_左_分类_TAB1" dd_src="" href="http://book.dangdang.com/01.22.htm" target="_blank" class=""
											title="管理">管理</a> </li>
									<li class="line line10 " ddt-area="9342" ddt-pit="10">
										<a dd_name="图书A版_左_分类_TAB1" dd_src="" href="http://book.dangdang.com/01.36.htm" target="_blank" class=""
											title="历史">历史</a> </li>
									<li nname="mixpage-317715-15640_8_11" class="line line11 " ddt-area="9342" ddt-pit="11">
										<a dd_name="图书A版_左_分类_TAB1" dd_src="" href="http://book.dangdang.com/01.15.htm" target="_blank" class=""
											title="亲子/家教">亲子/家教</a> </li>
									<li nname="mixpage-317715-15640_8_12" class="line line12 " ddt-area="9342" ddt-pit="12">
										<a dd_name="图书A版_左_分类_TAB1" dd_src="" href="http://category.dangdang.com/cp01.00.00.00.00.00.html" target="_blank"
											class="" title="全部分类>">全部分类&gt;</a> </li>
								</ul>
								<div class="roll_aa " id="mapid_3208542_parent_9370_9354_9345_part_9345" marquee="true" name="m3208542_pid9370_9354_9345_p9345"
									js="true" action="newclickroll" delay="500" prevnoneclass="btn_prev_none" nextnoneclass="btn_next_none" page="0"
									speed="5000" display_count="1" is_display_tab="1" noend="1" ddt-area="9345">



									<!-- <div class="btn_brand_prev" type="rollpre" style="display: none;"></div>
										<div class="btn_brand_next" type="rollnext" style="display: none;"></div>
										<ul class="mix_marquee_tab" style="margin-left: -12px;">
											<li class="current">1</li>
											<li class="">2</li>
										</ul>
										<div class="over">

											<ul class="" style="left: 0px;">
												<li class="_li_1" nname="mixpage-317715-15640_8_1" ddt-pit="1" dd_name="图书A版_轮播banner区_TAB1"><a href="http://book.dangdang.com/20190214_kfqo"
													 target="_blank" class="pic" title="豆瓣读书榜单" dd_src="lou-1558507603_4c3eab7be5d5d6b4" dd_name="图书A版_轮播banner区_TAB1"><img
														 src="http://img63.ddimg.cn/upload_img/00779/xmj/lou-1558507603.jpg" alt="豆瓣读书榜单" ddt-src="lou-1558507603_4c3eab7be5d5d6b4"></a></li>
												<li class="_li_2" nname="mixpage-317715-15640_8_2" ddt-pit="2" dd_name="图书A版_轮播banner区_TAB1"><a href="http://baby.dangdang.com/2019new5"
													 target="_blank" class="pic" title="童书5月新书速递" dd_src="lcbanner-1556618423_b9a441d70e1f9f79" dd_name="图书A版_轮播banner区_TAB1"><img
														 src="http://img60.ddimg.cn/upload_img/00678/zsts/lcbanner-1556618423.jpg" alt="童书5月新书速递" ddt-src="lcbanner-1556618423_b9a441d70e1f9f79"></a></li>
											</ul>
										</div> -->
								</div>
								<div class="book_upper2 " name="m3208542_pid9370_9354_9348_t15680">
									<ul class="list_aa " id="component_3208542__9370_9354_9348_9346__9346" ddt-area="9346">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="26484418_b83081951f4df886" dd_name="图书A版_上商品区1_TAB1"
											title="世纪高教 张剑黄皮书考研英语二2020历年考研（二）真题解析及复习思路（经典试卷版)(2017-2019)MBA/MPA/MPAcc等专业学位专用" class="img" href="http://product.dangdang.com/26484418.html"
											target="_blank">
											<img src="http://img3m8.ddimg.cn/37/3/26484418-1_l_4.jpg" alt="世纪高教 张剑黄皮书考研英语二2020历年考研（二）真题解析及复习思路（经典试卷版)(2017-2019)MBA/MPA/MPAcc等专业学位专用"
												dd_src="26484418_b83081951f4df886" ddt-src="26484418_b83081951f4df886"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="26484418_b83081951f4df886" ddt-src="26484418_b83081951f4df886" dd_name="图书A版_上商品区1_TAB1"
													title="世纪高教 张剑黄皮书考研英语二2020历年考研（二）真题解析及复习思路（经典试卷版)(2017-2019)MBA/MPA/MPAcc等专业学位专用" href="http://product.dangdang.com/26484418.html"
													target="_blank">世纪高教 张剑黄皮书考研英语二2020历年考研（二）真题解析及复习思路（经典试卷版)(2017-2019)MBA/MPA/MPAcc等专业学位专用</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">39</span><span class="tail">.80</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">39</span><span class="tail">.80</span></span>
											</p>
										</li>
									</ul>
									<ul class="list_aa " id="component_3208542__9370_9354_9348_9347__9347" ddt-area="9347">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="27859553_ab092bb145826874" dd_name="图书A版_上商品区2_TAB1"
											title="给孩子讲的中国故事（全20册）" class="img" href="http://product.dangdang.com/27859553.html" target="_blank">
											<img
												src="http://img3m3.ddimg.cn/62/33/27859553-1_l_5.jpg" alt="给孩子讲的中国故事（全20册）" dd_src="27859553_ab092bb145826874"
												ddt-src="27859553_ab092bb145826874"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="27859553_ab092bb145826874" ddt-src="27859553_ab092bb145826874" dd_name="图书A版_上商品区2_TAB1"
													title="给孩子讲的中国故事（全20册）" href="http://product.dangdang.com/27859553.html" target="_blank">给孩子讲的中国故事（全20册）</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">301</span><span class="tail">.60</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">338</span><span class="tail">.00</span></span>
											</p>
										</li>
									</ul>
								</div>
								<div class="book_lower4 " name="m3208542_pid9370_9354_9353_t15681">
									<ul class="list_aa " id="component_3208542__9370_9354_9353_9349__9349" ddt-area="9349">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="26921715_76c574f59a84513a" dd_name="图书A版_下商品区1_TAB1"
											title="人生海海" class="img" href="http://product.dangdang.com/26921715.html" target="_blank">
											<img src="http://img3m5.ddimg.cn/51/34/26921715-1_l_2.jpg"
												alt="人生海海" dd_src="26921715_76c574f59a84513a" ddt-src="26921715_76c574f59a84513a"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="26921715_76c574f59a84513a" ddt-src="26921715_76c574f59a84513a" dd_name="图书A版_下商品区1_TAB1"
													title="人生海海" href="http://product.dangdang.com/26921715.html" target="_blank">人生海海</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">55</span><span class="tail">.00</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">55</span><span class="tail">.00</span></span><span
														class="ebookprice_n"><span class="ebookprice_title">电子书</span><span class="sign">¥</span><span class="num">24</span><span
															class="tail">.99</span></span>
											</p>
										</li>
									</ul>
									<ul class="list_aa " id="component_3208542__9370_9354_9353_9350__9350" ddt-area="9350">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="27847259_ec4e5ecd335e6f59" dd_name="图书A版_下商品区2_TAB1"
											title="那一年 （左手韩新书亲笔签名版 畅销书漫画家左手韩10周年青春成长纪念之作人生最大的谎言就是你不行）" class="img" href="http://product.dangdang.com/27847259.html"
											target="_blank">
											<img src="http://img3m9.ddimg.cn/44/23/27847259-1_l_8.jpg" alt="那一年 （左手韩新书亲笔签名版 畅销书漫画家左手韩10周年青春成长纪念之作人生最大的谎言就是你不行）"
												dd_src="27847259_ec4e5ecd335e6f59" ddt-src="27847259_ec4e5ecd335e6f59"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="27847259_ec4e5ecd335e6f59" ddt-src="27847259_ec4e5ecd335e6f59" dd_name="图书A版_下商品区2_TAB1"
													title="那一年 （左手韩新书亲笔签名版 畅销书漫画家左手韩10周年青春成长纪念之作人生最大的谎言就是你不行）" href="http://product.dangdang.com/27847259.html"
													target="_blank">那一年 （左手韩新书亲笔签名版 畅销书漫画家左手韩10周年青春成长纪念之作人生最大的谎言就是你不行）</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">42</span><span class="tail">.40</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">46</span><span class="tail">.00</span></span>
											</p>
										</li>
									</ul>
									<ul class="list_aa " id="component_3208542__9370_9354_9353_9351__9351" ddt-area="9351">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="26923748_1c727cd764550cd1" dd_name="图书A版_下商品区3_TAB1"
											title="玫瑰：黄有维的水彩玫瑰课（精华版）（全彩）" class="img" href="http://product.dangdang.com/26923748.html" target="_blank">
											<img
												src="http://img3m8.ddimg.cn/5/32/26923748-1_l_15.jpg" alt="玫瑰：黄有维的水彩玫瑰课（精华版）（全彩）" dd_src="26923748_1c727cd764550cd1"
												ddt-src="26923748_1c727cd764550cd1"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="26923748_1c727cd764550cd1" ddt-src="26923748_1c727cd764550cd1" dd_name="图书A版_下商品区3_TAB1"
													title="玫瑰：黄有维的水彩玫瑰课（精华版）（全彩）" href="http://product.dangdang.com/26923748.html" target="_blank">玫瑰：黄有维的水彩玫瑰课（精华版）（全彩）</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">83</span><span class="tail">.20</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">99</span><span class="tail">.00</span></span>
											</p>
										</li>
									</ul>
									<ul class="list_aa " id="component_3208542__9370_9354_9353_9352__9352" ddt-area="9352">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="27858576_2b3645c0a6863e8c" dd_name="图书A版_下商品区4_TAB1"
											title="资治通鉴（白话本）（全十册）" class="img" href="http://product.dangdang.com/27858576.html" target="_blank">
											<img
												src="http://img3m6.ddimg.cn/75/18/27858576-1_l_2.jpg" alt="资治通鉴（白话本）（全十册）" dd_src="27858576_2b3645c0a6863e8c"
												ddt-src="27858576_2b3645c0a6863e8c"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="27858576_2b3645c0a6863e8c" ddt-src="27858576_2b3645c0a6863e8c" dd_name="图书A版_下商品区4_TAB1"
													title="资治通鉴（白话本）（全十册）" href="http://product.dangdang.com/27858576.html" target="_blank">资治通鉴（白话本）（全十册）</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">661</span><span class="tail">.30</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">698</span><span class="tail">.00</span></span>
											</p>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="content left-tab_2" type="item" style="display: display;" ddt-area="9356" dd_name="独家畅品">
						<div class=" " name="m3208542_pid9370_9356_t15678">
							<div class="con " name="m3208542_pid9370_9356_t15679">
								<a class="book_left_pic book_left_pic_1  pic" ddt-area="9341" href="http://baby.dangdang.com/20190430_ln31"
									title="童书 每满100减50" target="_blank" nname="mixpage-317715-15640_8_1" dd_src="lcdt238x441-1558317845_ce24e7ee86e3385a"
									dd_name="图书A版_左_专题_TAB2">
									<img src="http://img62.ddimg.cn/upload_img/00678/zsts/lcdt238x441-1558317845.jpg"
										title="童书 每满100减50" alt="童书 每满100减50" ddt-pit="1" ddt-src="lcdt238x441-1558317845_ce24e7ee86e3385a"></a>
								<ul class="book_tab_img">
									<li nname="mixpage-317715-15640_8_1" class="line line1 on" ddt-area="9342" ddt-pit="1">
										<a dd_name="图书A版_左_分类_TAB2" dd_src="" href="http://book.dangdang.com/children?ref=book-01-A" target="_blank"
											class="" title="童书">童书</a> </li>
									<li nname="mixpage-317715-15640_8_2" class="line line2 " ddt-area="9342" ddt-pit="2">
										<a dd_name="图书A版_左_分类_TAB2" dd_src="" href="http://book.dangdang.com/study" target="_blank" class="" title="中小学教辅">中小学教辅</a>
									</li>
									<li nname="mixpage-317715-15640_8_3" class="line line3 " ddt-area="9342" ddt-pit="3">
										<a dd_name="图书A版_左_分类_TAB2" dd_src="" href="http://book.dangdang.com/language" target="_blank" class=""
											title="外语">外语</a>
									</li>
									<li nname="mixpage-317715-15640_8_4" class="line line4 " ddt-area="9342" ddt-pit="4">
										<a dd_name="图书A版_左_分类_TAB2" dd_src="" href="http://book.dangdang.com/exam" target="_blank" class="" title="考试">考试</a>
									</li>
									<li nname="mixpage-317715-15640_8_5" class="line line5 " ddt-area="9342" ddt-pit="5">
										<a dd_name="图书A版_左_分类_TAB2" dd_src="" href="http://book.dangdang.com/01.03.htm" target="_blank" class=""
											title="小说">小说</a> </li>
									<li nname="mixpage-317715-15640_8_6" class="line line6 " ddt-area="9342" ddt-pit="6">
										<a dd_name="图书A版_左_分类_TAB2" dd_src="" href="http://book.dangdang.com/01.05.htm" target="_blank" class=""
											title="文学">文学</a> </li>
									<li nname="mixpage-317715-15640_8_7" class="line line7 " ddt-area="9342" ddt-pit="7">
										<a dd_name="图书A版_左_分类_TAB2" dd_src="" href="http://book.dangdang.com/01.01.htm" target="_blank" class=""
											title="青春文学">青春文学</a> </li>
									<li nname="mixpage-317715-15640_8_8" class="line line8 " ddt-area="9342" ddt-pit="8">
										<a dd_name="图书A版_左_分类_TAB2" dd_src="" href="http://book.dangdang.com/01.21.htm" target="_blank" class=""
											title="成功/励志">成功/励志</a> </li>
									<li nname="mixpage-317715-15640_8_9" class="line line9 " ddt-area="9342" ddt-pit="9">
										<a dd_name="图书A版_左_分类_TAB2" dd_src="" href="http://book.dangdang.com/01.22.htm" target="_blank" class=""
											title="管理">管理</a> </li>
									<li class="line line10 " ddt-area="9342" ddt-pit="10">
										<a dd_name="图书A版_左_分类_TAB2" dd_src="" href="http://book.dangdang.com/01.36.htm" target="_blank" class=""
											title="历史">历史</a> </li>
									<li nname="mixpage-317715-15640_8_11" class="line line11 " ddt-area="9342" ddt-pit="11">
										<a dd_name="图书A版_左_分类_TAB2" dd_src="" href="http://book.dangdang.com/01.15.htm" target="_blank" class=""
											title="亲子/家教">亲子/家教</a> </li>
									<li nname="mixpage-317715-15640_8_12" class="line line12 " ddt-area="9342" ddt-pit="12">
										<a dd_name="图书A版_左_分类_TAB2" dd_src="" href="http://category.dangdang.com/cp01.00.00.00.00.00.html" target="_blank"
											class="" title="全部分类>">全部分类&gt;</a> </li>
								</ul>
								<div class="roll_aa " id="mapid_3208542_parent_9370_9356_9345_part_9345" marquee="true" name="m3208542_pid9370_9356_9345_p9345"
									js="true" action="newclickroll" delay="500" prevnoneclass="btn_prev_none" nextnoneclass="btn_next_none" page="0"
									speed="5000" display_count="1" is_display_tab="1" noend="1" ddt-area="9345">



									<div class="btn_brand_prev" type="rollpre" style="display: none;"></div>
									<div class="btn_brand_next" type="rollnext" style="display: none;"></div>
									<ul class="mix_marquee_tab" style="margin-left: -12px;">
										<li class="">1</li>
										<li class="current">2</li>
									</ul>
									<div class="over">

										<ul class="" style="left: 0px;">
											<li class="_li_2" nname="mixpage-317715-15640_8_2" ddt-pit="2" dd_name="图书A版_轮播banner区_TAB2"><a href="http://baby.dangdang.com/20190514_haei-3-6"
												target="_blank" class="pic" title="3-6岁童书每满100减50" dd_src="lcbanner3-6-1558317845_7cb5135139aa9989"
												dd_name="图书A版_轮播banner区_TAB2">
												<img src="http://img60.ddimg.cn/upload_img/00678/zsts/lcbanner3-6-1558317845.jpg"
													alt="3-6岁童书每满100减50" ddt-src="lcbanner3-6-1558317845_7cb5135139aa9989"></a></li>
											<li class="_li_1" nname="mixpage-317715-15640_8_1" ddt-pit="1" dd_name="图书A版_轮播banner区_TAB2"><a href="http://book.dangdang.com/20180731_0hu0"
												target="_blank" class="pic" title="生活49元5件" dd_src="bannerdangshou0107-1546838986_98df333a48e28b3e"
												dd_name="图书A版_轮播banner区_TAB2">
												<img src="http://img63.ddimg.cn/upload_img/00727/wangsiyu/bannerdangshou0107-1546838986.jpg"
													alt="生活49元5件" ddt-src="bannerdangshou0107-1546838986_98df333a48e28b3e"></a></li>
										</ul>
									</div>
								</div>
								<div class="book_upper2 " name="m3208542_pid9370_9356_9348_t15680">
									<ul class="list_aa " id="component_3208542__9370_9356_9348_9346__9346" ddt-area="9346">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="23980643_3db94ff2ab2b052c" dd_name="图书A版_上商品区1_TAB2"
											title="就喜欢你看不惯我 又干不掉我的样子2(霸气吾皇率蠢萌巴扎黑、伪深邃的牛能强势归来！当当独家附赠4张吾皇密旨，另有3张呆萌表情贴纸+2本萌宠手账)" class="img" href="http://product.dangdang.com/23980643.html"
											target="_blank">
											<img src="http://img3m3.ddimg.cn/71/18/23980643-1_l_15.jpg" alt="就喜欢你看不惯我 又干不掉我的样子2(霸气吾皇率蠢萌巴扎黑、伪深邃的牛能强势归来！当当独家附赠4张吾皇密旨，另有3张呆萌表情贴纸+2本萌宠手账)"
												dd_src="23980643_3db94ff2ab2b052c" ddt-src="23980643_3db94ff2ab2b052c"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="23980643_3db94ff2ab2b052c" ddt-src="23980643_3db94ff2ab2b052c" dd_name="图书A版_上商品区1_TAB2"
													title="就喜欢你看不惯我 又干不掉我的样子2(霸气吾皇率蠢萌巴扎黑、伪深邃的牛能强势归来！当当独家附赠4张吾皇密旨，另有3张呆萌表情贴纸+2本萌宠手账)" href="http://product.dangdang.com/23980643.html"
													target="_blank">就喜欢你看不惯我 又干不掉我的样子2(霸气吾皇率蠢萌巴扎黑、伪深邃的牛能强势归来！当当独家附赠4张吾皇密旨，另有3张呆萌表情贴纸+2本萌宠手账)</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">41</span><span class="tail">.40</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">46</span><span class="tail">.00</span></span>
											</p>
										</li>
									</ul>
									<ul class="list_aa " id="component_3208542__9370_9356_9348_9347__9347" ddt-area="9347">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="24030562_e35fdb08f59367e6" dd_name="图书A版_上商品区2_TAB2"
											title="百年童话绘本（平装30册）" class="img" href="http://product.dangdang.com/24030562.html" target="_blank">
											<img
												src="http://img3m2.ddimg.cn/94/24/24030562-1_l_20.jpg" alt="百年童话绘本（平装30册）" dd_src="24030562_e35fdb08f59367e6"
												ddt-src="24030562_e35fdb08f59367e6"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="24030562_e35fdb08f59367e6" ddt-src="24030562_e35fdb08f59367e6" dd_name="图书A版_上商品区2_TAB2"
													title="百年童话绘本（平装30册）" href="http://product.dangdang.com/24030562.html" target="_blank">百年童话绘本（平装30册）</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">155</span><span class="tail">.40</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">444</span><span class="tail">.00</span></span>
											</p>
										</li>
									</ul>
								</div>
								<div class="book_lower4 " name="m3208542_pid9370_9356_9353_t15681">
									<ul class="list_aa " id="component_3208542__9370_9356_9353_9349__9349" ddt-area="9349">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="24187699_a6ad5d73423e8f6a" dd_name="图书A版_下商品区1_TAB2"
											title="《崔玉涛图解家庭育儿（最新升级版）》（套装全10册）[精选套装]" class="img" href="http://product.dangdang.com/24187699.html"
											target="_blank">
											<img src="http://img3m9.ddimg.cn/19/22/24187699-1_l_7.jpg" alt="《崔玉涛图解家庭育儿（最新升级版）》（套装全10册）[精选套装]"
												dd_src="24187699_a6ad5d73423e8f6a" ddt-src="24187699_a6ad5d73423e8f6a"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="24187699_a6ad5d73423e8f6a" ddt-src="24187699_a6ad5d73423e8f6a" dd_name="图书A版_下商品区1_TAB2"
													title="《崔玉涛图解家庭育儿（最新升级版）》（套装全10册）[精选套装]" href="http://product.dangdang.com/24187699.html" target="_blank">《崔玉涛图解家庭育儿（最新升级版）》（套装全10册）[精选套装]</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">315</span><span class="tail">.90</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">376</span><span class="tail">.00</span></span>
											</p>
										</li>
									</ul>
									<ul class="list_aa " id="component_3208542__9370_9356_9353_9350__9350" ddt-area="9350">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="24003255_01498038b0fa175f" dd_name="图书A版_下商品区2_TAB2"
											title="我们仨（当当网独家布面精装珍藏版）" class="img" href="http://product.dangdang.com/24003255.html" target="_blank">
											<img
												src="http://img3m5.ddimg.cn/12/23/24003255-1_l_5.jpg" alt="我们仨（当当网独家布面精装珍藏版）" dd_src="24003255_01498038b0fa175f"
												ddt-src="24003255_01498038b0fa175f"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="24003255_01498038b0fa175f" ddt-src="24003255_01498038b0fa175f" dd_name="图书A版_下商品区2_TAB2"
													title="我们仨（当当网独家布面精装珍藏版）" href="http://product.dangdang.com/24003255.html" target="_blank">我们仨（当当网独家布面精装珍藏版）</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">38</span><span class="tail">.70</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">43</span><span class="tail">.00</span></span>
											</p>
										</li>
									</ul>
									<ul class="list_aa " id="component_3208542__9370_9356_9353_9351__9351" ddt-area="9351">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="26922459_ad64fb51673bcce2" dd_name="图书A版_下商品区3_TAB2"
											title="边城：沈从文小说精粹（一曲爱与美的田园牧歌）" class="img" href="http://product.dangdang.com/26922459.html" target="_blank">
											<img
												src="http://img3m9.ddimg.cn/3/1/26922459-1_l_3.jpg" alt="边城：沈从文小说精粹（一曲爱与美的田园牧歌）" dd_src="26922459_ad64fb51673bcce2"
												ddt-src="26922459_ad64fb51673bcce2"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="26922459_ad64fb51673bcce2" ddt-src="26922459_ad64fb51673bcce2" dd_name="图书A版_下商品区3_TAB2"
													title="边城：沈从文小说精粹（一曲爱与美的田园牧歌）" href="http://product.dangdang.com/26922459.html" target="_blank">边城：沈从文小说精粹（一曲爱与美的田园牧歌）</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">30</span><span class="tail">.10</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">32</span><span class="tail">.00</span></span>
											</p>
										</li>
									</ul>
									<ul class="list_aa " id="component_3208542__9370_9356_9353_9352__9352" ddt-area="9352">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="25548039_64ccceee28694c38" dd_name="图书A版_下商品区4_TAB2"
											title="南怀瑾著作选集（南怀瑾先生生前亲笔签约授权，亲加审阅的定本，套装15册）" class="img" href="http://product.dangdang.com/25548039.html"
											target="_blank">
											<img src="http://img3m9.ddimg.cn/0/20/25548039-1_l_5.jpg" alt="南怀瑾著作选集（南怀瑾先生生前亲笔签约授权，亲加审阅的定本，套装15册）"
												dd_src="25548039_64ccceee28694c38" ddt-src="25548039_64ccceee28694c38"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="25548039_64ccceee28694c38" ddt-src="25548039_64ccceee28694c38" dd_name="图书A版_下商品区4_TAB2"
													title="南怀瑾著作选集（南怀瑾先生生前亲笔签约授权，亲加审阅的定本，套装15册）" href="http://product.dangdang.com/25548039.html" target="_blank">南怀瑾著作选集（南怀瑾先生生前亲笔签约授权，亲加审阅的定本，套装15册）</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">661</span><span class="tail">.30</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">698</span><span class="tail">.00</span></span>
											</p>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="content left-tab_3" type="item" style="display: none;" ddt-area="9358" dd_name="重点推荐">
						<div class=" " name="m3208542_pid9370_9358_t15678">
							<div class="con " name="m3208542_pid9370_9358_t15679">
								<a class="book_left_pic book_left_pic_1  pic" ddt-area="9341" href="http://book.dangdang.com/20190522_fayt"
									title="自出版" target="_blank" nname="mixpage-317715-15640_8_1" dd_src="9001320089129550_f5dd85b333601c06"
									dd_name="图书A版_左_专题_TAB3">
									<img src="http://img50.ddimg.cn/9001320089129550.jpg" title="自出版" alt="自出版" ddt-pit="1"
										ddt-src="9001320089129550_f5dd85b333601c06"></a>
								<ul class="book_tab_img">
									<li nname="mixpage-317715-15640_8_1" class="line line1 on" ddt-area="9342" ddt-pit="1">
										<a dd_name="图书A版_左_分类_TAB3" dd_src="" href="http://book.dangdang.com/children?ref=book-01-A" target="_blank"
											class="" title="童书">童书</a> </li>
									<li nname="mixpage-317715-15640_8_2" class="line line2 " ddt-area="9342" ddt-pit="2">
										<a dd_name="图书A版_左_分类_TAB3" dd_src="" href="http://book.dangdang.com/study" target="_blank" class="" title="中小学教辅">中小学教辅</a>
									</li>
									<li nname="mixpage-317715-15640_8_3" class="line line3 " ddt-area="9342" ddt-pit="3">
										<a dd_name="图书A版_左_分类_TAB3" dd_src="" href="http://book.dangdang.com/language" target="_blank" class=""
											title="外语">外语</a>
									</li>
									<li nname="mixpage-317715-15640_8_4" class="line line4 " ddt-area="9342" ddt-pit="4">
										<a dd_name="图书A版_左_分类_TAB3" dd_src="" href="http://book.dangdang.com/exam" target="_blank" class="" title="考试">考试</a>
									</li>
									<li nname="mixpage-317715-15640_8_5" class="line line5 " ddt-area="9342" ddt-pit="5">
										<a dd_name="图书A版_左_分类_TAB3" dd_src="" href="http://book.dangdang.com/01.03.htm" target="_blank" class=""
											title="小说">小说</a> </li>
									<li nname="mixpage-317715-15640_8_6" class="line line6 " ddt-area="9342" ddt-pit="6">
										<a dd_name="图书A版_左_分类_TAB3" dd_src="" href="http://book.dangdang.com/01.05.htm" target="_blank" class=""
											title="文学">文学</a> </li>
									<li nname="mixpage-317715-15640_8_7" class="line line7 " ddt-area="9342" ddt-pit="7">
										<a dd_name="图书A版_左_分类_TAB3" dd_src="" href="http://book.dangdang.com/01.01.htm" target="_blank" class=""
											title="青春文学">青春文学</a> </li>
									<li nname="mixpage-317715-15640_8_8" class="line line8 " ddt-area="9342" ddt-pit="8">
										<a dd_name="图书A版_左_分类_TAB3" dd_src="" href="http://book.dangdang.com/01.21.htm" target="_blank" class=""
											title="成功/励志">成功/励志</a> </li>
									<li nname="mixpage-317715-15640_8_9" class="line line9 " ddt-area="9342" ddt-pit="9">
										<a dd_name="图书A版_左_分类_TAB3" dd_src="" href="http://book.dangdang.com/01.22.htm" target="_blank" class=""
											title="管理">管理</a> </li>
									<li class="line line10 " ddt-area="9342" ddt-pit="10">
										<a dd_name="图书A版_左_分类_TAB3" dd_src="" href="http://book.dangdang.com/01.36.htm" target="_blank" class=""
											title="历史">历史</a> </li>
									<li nname="mixpage-317715-15640_8_11" class="line line11 " ddt-area="9342" ddt-pit="11">
										<a dd_name="图书A版_左_分类_TAB3" dd_src="" href="http://book.dangdang.com/01.15.htm" target="_blank" class=""
											title="亲子/家教">亲子/家教</a> </li>
									<li nname="mixpage-317715-15640_8_12" class="line line12 " ddt-area="9342" ddt-pit="12">
										<a dd_name="图书A版_左_分类_TAB3" dd_src="" href="http://category.dangdang.com/cp01.00.00.00.00.00.html" target="_blank"
											class="" title="全部分类>">全部分类&gt;</a> </li>
								</ul>
								<div class="roll_aa " id="mapid_3208542_parent_9370_9358_9345_part_9345" marquee="true" name="m3208542_pid9370_9358_9345_p9345"
									js="true" action="newclickroll" delay="500" prevnoneclass="btn_prev_none" nextnoneclass="btn_next_none" page="0"
									speed="5000" display_count="1" is_display_tab="1" noend="1" ddt-area="9345">



									<div class="btn_brand_prev" type="rollpre" style="display: none;"></div>
									<div class="btn_brand_next" type="rollnext" style="display: none;"></div>
									<ul class="mix_marquee_tab" style="margin-left: -12px;">
										<li class="current">1</li>
										<li class="">2</li>
									</ul>
									<div class="over">

										<ul class="" style="left: 0px;">
											<li class="_li_1" nname="mixpage-317715-15640_8_1" ddt-pit="1" dd_name="图书A版_轮播banner区_TAB3"><a href="http://book.dangdang.com/20190522_ojjv"
												target="_blank" class="pic" title="艺术传记" dd_src="335x220_0519-1558275199_8ba7a41b45e2c834" dd_name="图书A版_轮播banner区_TAB3">
												<img
													src="http://img62.ddimg.cn/upload_img/00726/0122/335x220_0519-1558275199.jpg" alt="艺术传记" ddt-src="335x220_0519-1558275199_8ba7a41b45e2c834"></a></li>
											<li class="_li_2" nname="mixpage-317715-15640_8_2" ddt-pit="2" dd_name="图书A版_轮播banner区_TAB3"><a href="http://baby.dangdang.com/20190514_haei-7-10"
												target="_blank" class="pic" title="7-10岁童书每满100减50" dd_src="lcbanner7-10-1558317845_f527f4ee58661389"
												dd_name="图书A版_轮播banner区_TAB3">
												<img src="http://img60.ddimg.cn/upload_img/00678/zsts/lcbanner7-10-1558317845.jpg"
													alt="7-10岁童书每满100减50" ddt-src="lcbanner7-10-1558317845_f527f4ee58661389"></a></li>
										</ul>
									</div>
								</div>
								<div class="book_upper2 " name="m3208542_pid9370_9358_9348_t15680">
									<ul class="list_aa " id="component_3208542__9370_9358_9348_9346__9346" ddt-area="9346">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="26314845_cc65d07b217ac597" dd_name="图书A版_上商品区1_TAB3"
											title="漫威电影宇宙十周年纪念礼盒" class="img" href="http://product.dangdang.com/26314845.html" target="_blank">
											<img
												src="http://img3m5.ddimg.cn/51/1/26314845-1_l_4.jpg" alt="漫威电影宇宙十周年纪念礼盒" dd_src="26314845_cc65d07b217ac597"
												ddt-src="26314845_cc65d07b217ac597"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="26314845_cc65d07b217ac597" ddt-src="26314845_cc65d07b217ac597" dd_name="图书A版_上商品区1_TAB3"
													title="漫威电影宇宙十周年纪念礼盒" href="http://product.dangdang.com/26314845.html" target="_blank">漫威电影宇宙十周年纪念礼盒</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">148</span><span class="tail">.50</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">198</span><span class="tail">.00</span></span>
											</p>
										</li>
									</ul>
									<ul class="list_aa " id="component_3208542__9370_9358_9348_9347__9347" ddt-area="9347">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="26912902_d0e2cb904dcde388" dd_name="图书A版_上商品区2_TAB3"
											title="宫西达也超级绘本（全11册）" class="img" href="http://product.dangdang.com/26912902.html" target="_blank">
											<img
												src="http://img3m2.ddimg.cn/49/27/26912902-1_l_3.jpg" alt="宫西达也超级绘本（全11册）" dd_src="26912902_d0e2cb904dcde388"
												ddt-src="26912902_d0e2cb904dcde388"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="26912902_d0e2cb904dcde388" ddt-src="26912902_d0e2cb904dcde388" dd_name="图书A版_上商品区2_TAB3"
													title="宫西达也超级绘本（全11册）" href="http://product.dangdang.com/26912902.html" target="_blank">宫西达也超级绘本（全11册）</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">72</span><span class="tail">.50</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">186</span><span class="tail">.00</span></span>
											</p>
										</li>
									</ul>
								</div>
								<div class="book_lower4 " name="m3208542_pid9370_9358_9353_t15681">
									<ul class="list_aa " id="component_3208542__9370_9358_9353_9349__9349" ddt-area="9349">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="25283331_776f3a6d5da96fdf" dd_name="图书A版_下商品区1_TAB3"
											title="游戏力畅销版套装（全3册）[精选套装]" class="img" href="http://product.dangdang.com/25283331.html" target="_blank">
											<img
												src="http://img3m1.ddimg.cn/18/10/25283331-1_l_3.jpg" alt="游戏力畅销版套装（全3册）[精选套装]" dd_src="25283331_776f3a6d5da96fdf"
												ddt-src="25283331_776f3a6d5da96fdf"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="25283331_776f3a6d5da96fdf" ddt-src="25283331_776f3a6d5da96fdf" dd_name="图书A版_下商品区1_TAB3"
													title="游戏力畅销版套装（全3册）[精选套装]" href="http://product.dangdang.com/25283331.html" target="_blank">游戏力畅销版套装（全3册）[精选套装]</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">113</span><span class="tail">.60</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">142</span><span class="tail">.00</span></span>
											</p>
										</li>
									</ul>
									<ul class="list_aa " id="component_3208542__9370_9358_9353_9350__9350" ddt-area="9350">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="22499229_5ff9ed58bbcee851" dd_name="图书A版_下商品区2_TAB3"
											title="" class="img" href="http://product.dangdang.com/22499229.html" target="_blank">
											<img src="http://img3m9.ddimg.cn/93/10/22499229-1_l_4.jpg"
												alt="" dd_src="22499229_5ff9ed58bbcee851" ddt-src="22499229_5ff9ed58bbcee851"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="22499229_5ff9ed58bbcee851" ddt-src="22499229_5ff9ed58bbcee851" dd_name="图书A版_下商品区2_TAB3"
													title="" href="http://product.dangdang.com/22499229.html" target="_blank">朱镕基讲话实录（全四册平装、双色印刷）
														团购电话:4001066666转6</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">196</span><span class="tail">.00</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">196</span><span class="tail">.00</span></span>
											</p>
										</li>
									</ul>
									<ul class="list_aa " id="component_3208542__9370_9358_9353_9351__9351" ddt-area="9351">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="27849094_ae6c30f860c4fdf5" dd_name="图书A版_下商品区3_TAB3"
											title="阿城作品（4册）（2019插图典藏本）" class="img" href="http://product.dangdang.com/27849094.html" target="_blank">
											<img
												src="http://img3m4.ddimg.cn/97/8/27849094-1_l_2.jpg" alt="阿城作品（4册）（2019插图典藏本）" dd_src="27849094_ae6c30f860c4fdf5"
												ddt-src="27849094_ae6c30f860c4fdf5"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="27849094_ae6c30f860c4fdf5" ddt-src="27849094_ae6c30f860c4fdf5" dd_name="图书A版_下商品区3_TAB3"
													title="阿城作品（4册）（2019插图典藏本）" href="http://product.dangdang.com/27849094.html" target="_blank">阿城作品（4册）（2019插图典藏本）</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">144</span><span class="tail">.00</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">192</span><span class="tail">.00</span></span>
											</p>
										</li>
									</ul>
									<ul class="list_aa " id="component_3208542__9370_9358_9353_9352__9352" ddt-area="9352">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="25288392_56779d7a4a9dbc66" dd_name="图书A版_下商品区4_TAB3"
											title="稻盛和夫阿米巴经营经典套装" class="img" href="http://product.dangdang.com/25288392.html" target="_blank">
											<img
												src="http://img3m2.ddimg.cn/30/2/25288392-1_l_1.jpg" alt="稻盛和夫阿米巴经营经典套装" dd_src="25288392_56779d7a4a9dbc66"
												ddt-src="25288392_56779d7a4a9dbc66"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="25288392_56779d7a4a9dbc66" ddt-src="25288392_56779d7a4a9dbc66" dd_name="图书A版_下商品区4_TAB3"
													title="稻盛和夫阿米巴经营经典套装" href="http://product.dangdang.com/25288392.html" target="_blank">稻盛和夫阿米巴经营经典套装</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">74</span><span class="tail">.70</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">84</span><span class="tail">.00</span></span>
											</p>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="content left-tab_4" type="item" style="display: none;" ddt-area="10020" dd_name="电子书">
						<div class=" " name="m3208542_pid9370_10020_t15678">
							<div class="con " name="m3208542_pid9370_10020_t15679">
								<a class="book_left_pic book_left_pic_1  pic" ddt-area="9341" href="http://book.dangdang.com/20190521_kbiz"
									title="电子书" target="_blank" nname="mixpage-317715-15640_8_1" dd_src="left_logo-74_ce136bd855fc8630" dd_name="图书A版_左_专题_TAB4">
									<img
										src="http://img62.ddimg.cn/ddreader/dangebook/left_logo-74.jpg" title="电子书" alt="电子书" ddt-pit="1" ddt-src="left_logo-74_ce136bd855fc8630"></a>
								<ul class="book_tab_img">
									<li nname="mixpage-317715-15640_8_1" class="line line1 on" ddt-area="9342" ddt-pit="1">
										<a dd_name="图书A版_左_分类_TAB4" dd_src="" href="http://e.dangdang.com/new_original_index_page.html" target="_blank"
											class="" title="网文">网文</a> </li>
									<li nname="mixpage-317715-15640_8_2" class="line line2 " ddt-area="9342" ddt-pit="2">
										<a dd_name="图书A版_左_分类_TAB4" dd_src="" href="http://e.dangdang.com/classification_list_page.html?category=XS2&amp;dimension=dd_sale&amp;order=0"
											target="_blank" class="" title="小说">小说</a> </li>
									<li nname="mixpage-317715-15640_8_3" class="line line3 " ddt-area="9342" ddt-pit="3">
										<a dd_name="图书A版_左_分类_TAB4" dd_src="" href="http://e.dangdang.com/classification_list_page.html?category=JG&amp;dimension=dd_sale&amp;order=0"
											target="_blank" class="" title="经管励志">经管励志</a> </li>
									<li nname="mixpage-317715-15640_8_4" class="line line4 " ddt-area="9342" ddt-pit="4">
										<a dd_name="图书A版_左_分类_TAB4" dd_src="" href="http://e.dangdang.com/classification_list_page.html?category=WY1&amp;dimension=dd_sale&amp;order=0"
											target="_blank" class="" title="文艺">文艺</a> </li>
									<li nname="mixpage-317715-15640_8_5" class="line line5 " ddt-area="9342" ddt-pit="5">
										<a dd_name="图书A版_左_分类_TAB4" dd_src="" href="http://e.dangdang.com/classification_list_page.html?category=SK&amp;dimension=dd_sale&amp;order=0"
											target="_blank" class="" title="社科">社科</a> </li>
									<li nname="mixpage-317715-15640_8_6" class="line line6 " ddt-area="9342" ddt-pit="6">
										<a dd_name="图书A版_左_分类_TAB4" dd_src="" href="http://e.dangdang.com/classification_list_page.html?category=SH&amp;dimension=dd_sale&amp;order=0"
											target="_blank" class="" title="生活">生活</a> </li>
									<li nname="mixpage-317715-15640_8_7" class="line line7 " ddt-area="9342" ddt-pit="7">
										<a dd_name="图书A版_左_分类_TAB4" dd_src="" href="http://e.dangdang.com/rank_detail_page.html?listType=ddds_sale&amp;channelType=all"
											target="_blank" class="" title="新书榜">新书榜</a> </li>
									<li nname="mixpage-317715-15640_8_8" class="line line8 " ddt-area="9342" ddt-pit="8">
										<a dd_name="图书A版_左_分类_TAB4" dd_src="" href="http://e.dangdang.com/rank_detail_page.html?listType=ddds_sale&amp;channelType=all"
											target="_blank" class="" title="畅销榜">畅销榜</a> </li>
									<li nname="mixpage-317715-15640_8_9" class="line line9 " ddt-area="9342" ddt-pit="9">
										<a dd_name="图书A版_左_分类_TAB4" dd_src="" href="http://e.dangdang.com/index_page.html" target="_blank" class=""
											title="查看所有">查看所有</a> </li>
								</ul>
								<div class="roll_aa " id="mapid_3208542_parent_9370_10020_9345_part_9345" marquee="true" name="m3208542_pid9370_10020_9345_p9345"
									js="true" action="newclickroll" delay="500" prevnoneclass="btn_prev_none" nextnoneclass="btn_next_none" page="0"
									speed="5000" display_count="1" is_display_tab="1" noend="1" ddt-area="9345">



									<div class="btn_brand_prev" type="rollpre" style="display: none;"></div>
									<div class="btn_brand_next" type="rollnext" style="display: none;"></div>
									<ul class="mix_marquee_tab" style="margin-left: -19px;">
										<li class="">1</li>
										<li class="">2</li>
										<li class="current">3</li>
									</ul>
									<div class="over">

										<ul class="" style="left: 0px;">
											<li class="_li_3" nname="mixpage-317715-15640_8_3" ddt-pit="3" dd_name="图书A版_轮播banner区_TAB4"><a href="http://category.dangdang.com/cp98.01.00.00.00.00-lp-hp5.html"
												target="_blank" class="pic" title="轮播3" dd_src="dslc-lz-3_0b8e76e88b220223" dd_name="图书A版_轮播banner区_TAB4">
												<img
													src="http://img63.ddimg.cn/ebook/201709/dslc-lz-3.jpg" alt="轮播3" ddt-src="dslc-lz-3_0b8e76e88b220223"></a></li>
											<li class="_li_1" nname="mixpage-317715-15640_8_1" ddt-pit="1" dd_name="图书A版_轮播banner区_TAB4"><a href="http://book.dangdang.com/20161128_zl3t"
												target="_blank" class="pic" title="轮播1" dd_src="0616ydq_4f5e11a3ea80e2b4" dd_name="图书A版_轮播banner区_TAB4">
												<img
													src="http://img60.ddimg.cn/ddreader/dangebook/0616ydq.jpg" alt="轮播1" ddt-src="0616ydq_4f5e11a3ea80e2b4"></a></li>
											<li class="_li_2" nname="mixpage-317715-15640_8_2" ddt-pit="2" dd_name="图书A版_轮播banner区_TAB4"><a href="http://e.dangdang.com/rank_detail_page.html?listType=ddds_sale&amp;channelType=all&amp;timeDimension=1"
												target="_blank" class="pic" title="轮播2" dd_src="dslc-lz-2_5cecfed482cacfa9" dd_name="图书A版_轮播banner区_TAB4">
												<img
													src="http://img60.ddimg.cn/ebook/201709/dslc-lz-2.jpg" alt="轮播2" ddt-src="dslc-lz-2_5cecfed482cacfa9"></a></li>
										</ul>
									</div>
								</div>
								<div class="book_upper2 " name="m3208542_pid9370_10020_9348_t15680">
									<ul class="list_aa " id="component_3208542__9370_10020_9348_9346__9346" ddt-area="9346">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="1901104637_6e4abb94d1e65a45"
											dd_name="图书A版_上商品区1_TAB4" title="三体全集(全3册)" class="img" href="http://product.dangdang.com/1901104637.html"
											target="_blank">
											<img src="http://img3m7.ddimg.cn/14/15/1901104637-1_l_4.jpg" alt="三体全集(全3册)" dd_src="1901104637_6e4abb94d1e65a45"
												ddt-src="1901104637_6e4abb94d1e65a45"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="1901104637_6e4abb94d1e65a45" ddt-src="1901104637_6e4abb94d1e65a45" dd_name="图书A版_上商品区1_TAB4"
													title="三体全集(全3册)" href="http://product.dangdang.com/1901104637.html" target="_blank">三体全集(全3册)</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">29</span><span class="tail">.99</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">93</span><span class="tail">.00</span></span>
											</p>
										</li>
									</ul>
									<ul class="list_aa " id="component_3208542__9370_10020_9348_9347__9347" ddt-area="9347">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="1901119065_bc670fdb3466ee54"
											dd_name="图书A版_上商品区2_TAB4" title="半生缘（刘嘉玲、蒋欣、郑元畅、郭晓冬主演同名电视剧即将热映！一场旧上海的爱情悲歌，谱就时代与人心的无可奈何。）" class="img" href="http://product.dangdang.com/1901119065.html"
											target="_blank">
											<img src="http://img3m5.ddimg.cn/87/13/1901119065-1_l_1.jpg" alt="半生缘（刘嘉玲、蒋欣、郑元畅、郭晓冬主演同名电视剧即将热映！一场旧上海的爱情悲歌，谱就时代与人心的无可奈何。）"
												dd_src="1901119065_bc670fdb3466ee54" ddt-src="1901119065_bc670fdb3466ee54"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="1901119065_bc670fdb3466ee54" ddt-src="1901119065_bc670fdb3466ee54" dd_name="图书A版_上商品区2_TAB4"
													title="半生缘（刘嘉玲、蒋欣、郑元畅、郭晓冬主演同名电视剧即将热映！一场旧上海的爱情悲歌，谱就时代与人心的无可奈何。）" href="http://product.dangdang.com/1901119065.html"
													target="_blank">半生缘（刘嘉玲、蒋欣、郑元畅、郭晓冬主演同名电视剧即将热映！一场旧上海的爱情悲歌，谱就时代与人心的无可奈何。）</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">12</span><span class="tail">.99</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">33</span><span class="tail">.00</span></span>
											</p>
										</li>
									</ul>
								</div>
								<div class="book_lower4 " name="m3208542_pid9370_10020_9353_t15681">
									<ul class="list_aa " id="component_3208542__9370_10020_9353_9349__9349" ddt-area="9349">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="1901127340_cd171e759dd42da6"
											dd_name="图书A版_下商品区1_TAB4" title="升维：让你人生出众的另类通道" class="img" href="http://product.dangdang.com/1901127340.html"
											target="_blank">
											<img src="http://img3m0.ddimg.cn/46/0/1901127340-1_l_1.jpg" alt="升维：让你人生出众的另类通道" dd_src="1901127340_cd171e759dd42da6"
												ddt-src="1901127340_cd171e759dd42da6"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="1901127340_cd171e759dd42da6" ddt-src="1901127340_cd171e759dd42da6" dd_name="图书A版_下商品区1_TAB4"
													title="升维：让你人生出众的另类通道" href="http://product.dangdang.com/1901127340.html" target="_blank">升维：让你人生出众的另类通道</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">16</span><span class="tail">.99</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">26</span><span class="tail">.99</span></span>
											</p>
										</li>
									</ul>
									<ul class="list_aa " id="component_3208542__9370_10020_9353_9350__9350" ddt-area="9350">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="1901123632_acc41b60bb6be7da"
											dd_name="图书A版_下商品区2_TAB4" title="共情的力量" class="img" href="http://product.dangdang.com/1901123632.html"
											target="_blank">
											<img src="http://img3m2.ddimg.cn/1/29/1901123632-1_l_1.jpg" alt="共情的力量" dd_src="1901123632_acc41b60bb6be7da"
												ddt-src="1901123632_acc41b60bb6be7da"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="1901123632_acc41b60bb6be7da" ddt-src="1901123632_acc41b60bb6be7da" dd_name="图书A版_下商品区2_TAB4"
													title="共情的力量" href="http://product.dangdang.com/1901123632.html" target="_blank">共情的力量</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">18</span><span class="tail">.99</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">18</span><span class="tail">.99</span></span>
											</p>
										</li>
									</ul>
									<ul class="list_aa " id="component_3208542__9370_10020_9353_9351__9351" ddt-area="9351">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="1901123848_ab81a1b540d7834c"
											dd_name="图书A版_下商品区3_TAB4" title="美国陷阱" class="img" href="http://product.dangdang.com/1901123848.html"
											target="_blank">
											<img src="http://img3m8.ddimg.cn/19/23/1901123848-1_l_1.jpg" alt="美国陷阱" dd_src="1901123848_ab81a1b540d7834c"
												ddt-src="1901123848_ab81a1b540d7834c"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="1901123848_ab81a1b540d7834c" ddt-src="1901123848_ab81a1b540d7834c" dd_name="图书A版_下商品区3_TAB4"
													title="美国陷阱" href="http://product.dangdang.com/1901123848.html" target="_blank">美国陷阱</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">24</span><span class="tail">.99</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">40</span><span class="tail">.80</span></span>
											</p>
										</li>
									</ul>
									<ul class="list_aa " id="component_3208542__9370_10020_9353_9352__9352" ddt-area="9352">
										<li class="line1" nname="mixpage-317715-15640_8_1" ddt-pit="1"><a dd_src="1901124051_bf4c2e179c313369"
											dd_name="图书A版_下商品区4_TAB4" title="能力陷阱(樊登读书力荐好书！教你如何摆脱能力陷阱，花更多时间进行策略性思考！)" class="img" href="http://product.dangdang.com/1901124051.html"
											target="_blank">
											<img src="http://img3m1.ddimg.cn/24/4/1901124051-1_l_1.jpg" alt="能力陷阱(樊登读书力荐好书！教你如何摆脱能力陷阱，花更多时间进行策略性思考！)"
												dd_src="1901124051_bf4c2e179c313369" ddt-src="1901124051_bf4c2e179c313369"></a>
											<div class="icon_pop"></div>
											<p class="name">
												<a dd_src="1901124051_bf4c2e179c313369" ddt-src="1901124051_bf4c2e179c313369" dd_name="图书A版_下商品区4_TAB4"
													title="能力陷阱(樊登读书力荐好书！教你如何摆脱能力陷阱，花更多时间进行策略性思考！)" href="http://product.dangdang.com/1901124051.html" target="_blank">能力陷阱(樊登读书力荐好书！教你如何摆脱能力陷阱，花更多时间进行策略性思考！)</a>
											</p>
											<p class="price">
												<span class="rob"><span class="sign">¥</span><span class="num">26</span><span class="tail">.99</span></span><span
													class="price_r"><span class="sign">¥</span><span class="num">44</span><span class="tail">.99</span></span>
											</p>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="content left-tab_5" type="item" style="display: none;" ddt-area="10073" dd_name="网络文学">
						<div class=" " name="m3208542_pid9370_10073_t15678">
							<div class="con " name="m3208542_pid9370_10073_t15679">
								<a class="book_left_pic book_left_pic_1  pic" ddt-area="10052" href="http://e.dangdang.com/special_page.html?stId=4160"
									title="" target="_blank" nname="mixpage-317715-15640_8_1" dd_src="bzaddd_c23fb62ad26a5c8b" dd_name="图书A版_左_专题_TAB5">
									<img
										src="http://img61.ddimg.cn/ww/zx/12/bzaddd.jpg" ddt-pit="1" ddt-src="bzaddd_c23fb62ad26a5c8b"></a>
								<ul class="book_tab_img">
									<li nname="mixpage-317715-15640_8_1" class="line line1 on" ddt-area="10053" ddt-pit="1">
										<a dd_name="图书A版_左_分类_TAB5" dd_src="" href="http://e.dangdang.com/classification_list_page.html?category=XHQH&amp;dimension=sale&amp;order=0"
											target="_blank" class="" title="玄幻奇幻">玄幻奇幻</a> </li>
									<li nname="mixpage-317715-15640_8_2" class="line line2 " ddt-area="10053" ddt-pit="2">
										<a dd_name="图书A版_左_分类_TAB5" dd_src="" href="http://e.dangdang.com/classification_list_page.html?category=XDDS&amp;dimension=sale&amp;order=0"
											target="_blank" class="" title="现代都市">现代都市</a> </li>
									<li nname="mixpage-317715-15640_8_3" class="line line3 " ddt-area="10053" ddt-pit="3">
										<a dd_name="图书A版_左_分类_TAB5" dd_src="" href="http://e.dangdang.com/classification_list_page.html?category=WXXX&amp;dimension=sale&amp;order=0"
											target="_blank" class="" title="武侠仙侠">武侠仙侠</a> </li>
									<li nname="mixpage-317715-15640_8_4" class="line line4 " ddt-area="10053" ddt-pit="4">
										<a dd_name="图书A版_左_分类_TAB5" dd_src="" href="http://e.dangdang.com/classification_list_page.html?category=LSJS&amp;dimension=sale&amp;order=0"
											target="_blank" class="" title="历史军事">历史军事</a> </li>
									<li nname="mixpage-317715-15640_8_5" class="line line5 " ddt-area="10053" ddt-pit="5">
										<a dd_name="图书A版_左_分类_TAB5" dd_src="" href="http://e.dangdang.com/classification_list_page.html?category=XDYQ&amp;dimension=sale&amp;order=0"
											target="_blank" class="" title="现代言情">现代言情</a> </li>
									<li nname="mixpage-317715-15640_8_6" class="line line6 " ddt-area="10053" ddt-pit="6">
										<a dd_name="图书A版_左_分类_TAB5" dd_src="" href="http://e.dangdang.com/classification_list_page.html?category=CYCS&amp;dimension=sale&amp;order=0"
											target="_blank" class="" title="穿越重生">穿越重生</a> </li>
									<li nname="mixpage-317715-15640_8_7" class="line line7 " ddt-area="10053" ddt-pit="7">
										<a dd_name="图书A版_左_分类_TAB5" dd_src="" href="http://e.dangdang.com/classification_list_page.html?category=GZYQ&amp;dimension=sale&amp;order=0"
											target="_blank" class="" title="古装言情">古装言情</a> </li>
									<li nname="mixpage-317715-15640_8_8" class="line line8 " ddt-area="10053" ddt-pit="8">
										<a dd_name="图书A版_左_分类_TAB5" dd_src="" href="http://e.dangdang.com/classification_list_page.html?category=QCXY&amp;dimension=sale&amp;order=0"
											target="_blank" class="" title="青春校园">青春校园</a> </li>
								</ul>
								<div class="roll_aa " id="mapid_3208542_parent_9370_10073_10054_part_10054" marquee="true" name="m3208542_pid9370_10073_10054_p10054"
									js="true" action="newclickroll" delay="500" prevnoneclass="btn_prev_none" nextnoneclass="btn_next_none" page="0"
									speed="5000" display_count="1" is_display_tab="1" noend="1" ddt-area="10054">



									<div class="btn_brand_prev" type="rollpre" style="display: none;"></div>
									<div class="btn_brand_next" type="rollnext" style="display: none;"></div>
									<ul class="mix_marquee_tab" style="margin-left: -12px;">
										<li class="">1</li>
										<li class="current">2</li>
									</ul>
									<div class="over">

										<ul class="" style="left: 0px;">
											<li class="_li_2" nname="mixpage-317715-15640_8_2" ddt-pit="2" dd_name="图书A版_轮播banner区_TAB5"><a href="http://e.dangdang.com/special_page.html?stId=4159"
												target="_blank" class="pic" title="轮播2" dd_src="jpg _5eb55742e8c8fe67" dd_name="图书A版_轮播banner区_TAB5">
												<img
													src="http://img62.ddimg.cn/ww/zx/12/scgdd.jpg" alt="轮播2" ddt-src="jpg _5eb55742e8c8fe67"></a></li>
											<li class="_li_1" nname="mixpage-317715-15640_8_1" ddt-pit="1" dd_name="图书A版_轮播banner区_TAB5"><a href="http://e.dangdang.com/special_page.html?stId=4158"
												target="_blank" class="pic" title="轮播1" dd_src="jpg _5eb55742e8c8fe67" dd_name="图书A版_轮播banner区_TAB5">
												<img
													src="http://img62.ddimg.cn/ww/zx/12/lddsdd.jpg" alt="轮播1" ddt-src="jpg _5eb55742e8c8fe67"></a></li>
										</ul>
									</div>
								</div>
								<div class="book_upper2 " name="m3208542_pid9370_10073_10070_t15680">
									<a class=" _1  pic" ddt-area="10059" href="http://e.dangdang.com/products/1980217243.html" title="" target="_blank"
										nname="mixpage-317715-15640_8_1" dd_src="jpg _ea5ada4480c5ab0c" dd_name="图书A版_上图2-1_TAB5">
										<img src="http://img62.ddimg.cn/ww/zx/11/dlsdd.jpg"
											ddt-pit="1" ddt-src="jpg _ea5ada4480c5ab0c"></a>
									<a class=" _1  pic" ddt-area="10064" href="http://e.dangdang.com/products/1980217535.html" title="" target="_blank"
										nname="mixpage-317715-15640_8_1" dd_src="jpg _42bb4a748f3d5cfb" dd_name="图书A版_上图2-2_TAB5">
										<img src="http://img62.ddimg.cn/ww/zx/11/cjgsdd.jpg"
											ddt-pit="1" ddt-src="jpg _42bb4a748f3d5cfb"></a>
								</div>
								<div class="book_lower4 " name="m3208542_pid9370_10073_10071_t15681">
									<a class=" _1  pic" ddt-area="10065" href="http://e.dangdang.com/products/1980118924.html" title="" target="_blank"
										nname="mixpage-317715-15640_8_1" dd_src="jpg _d32aac2d86273ce4" dd_name="图书A版_下图4-1_TAB5">
										<img src="http://img60.ddimg.cn/ww/zx/11/qzdsdd.jpg"
											ddt-pit="1" ddt-src="jpg _d32aac2d86273ce4"></a>
									<a class=" _1  pic" ddt-area="10066" href="http://e.dangdang.com/products/1980437170.html" title="" target="_blank"
										nname="mixpage-317715-15640_8_1" dd_src="jpg _4e0071dea4e28b34" dd_name="图书A版_下图4-2_TAB5">
										<img src="http://img61.ddimg.cn/ww/zx/11/khsdd.jpg"
											ddt-pit="1" ddt-src="jpg _4e0071dea4e28b34"></a>
									<a class=" _1  pic" ddt-area="10067" href="http://e.dangdang.com/products/1980224561.html" title="" target="_blank"
										nname="mixpage-317715-15640_8_1" dd_src="jpg _35340214aefec1b9" dd_name="图书A版_下图4-3_TAB5">
										<img src="http://img62.ddimg.cn/ww/zx/11/gxjdd.jpg"
											ddt-pit="1" ddt-src="jpg _35340214aefec1b9"></a>
									<a class=" _1  pic" ddt-area="10068" href="http://e.dangdang.com/products/1980433921.html" title="" target="_blank"
										nname="mixpage-317715-15640_8_1" dd_src="jpg _bc436f39478969d7" dd_name="图书A版_下图4-4_TAB5">
										<img src="http://img60.ddimg.cn/ww/zx/11/shxmdd.jpg"
											ddt-pit="1" ddt-src="jpg _bc436f39478969d7"></a>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

			<div class="floor_tab_bang " id="component_map_id_3208542_part_id_9371" name="m3208542_pid9377_p9371" js="true"
				itemclass="" action="hover" delay="0" speed="0" rand="0" area="1" barclass="on" updown="1" level="2" ddt-area="9371">
				<div class="head  headfloor_tab_bang">
					<ul class="tab_aa">
						<li class="tabh_0  first on" type="bar"><a href="http://bang.dangdang.com/books/bestsellers/01.00.00.00.00.00-recent7-0-0-1-1"
							target="_blank" dd_name="图书畅销榜"><span>图书畅销榜</span></a></li>
						<li class="tabh_1" type="bar"><a href="http://bang.dangdang.com/books/childrensbooks/01.41.00.00.00.00-24hours-0-0-1-1-newhotsell"
							target="_blank" dd_name="童书新书榜"><span>童书新书榜</span></a></li>
					</ul>


				</div>
				<div class="tab_content_aa tab_content_aafloor_tab_bang ">
					<div class="content tab_1" type="item" ddt-area="9374" dd_name="图书畅销榜" style="display: block;">
						<div class="book_top " name="m3208542_pid9377_9374_t15685">
							<style type="text/css">
								.hidden {
									display: none;
								}
							</style>
							<ul class="list_ab" id="component_3208542__9377_9374_9373__9373" accordion="true" js="true" speed="0" area="0"
								rand="0" delay="0" action="hover" itemclass="" barclass="hidden" level="2">
								<li class="line1 bar hidden" ddt-pit="1" type="bar"><span class="num num1">1</span>
									<p class="name">
										<a title="神奇校车·图画书版（全12册，新增《科学博览会》1册）" href="http://product.dangdang.com/25252408.html?ref=mixpage-317715-15640_8-0"
											target="_blank" dd_name="1">神奇校车·图画书版（全12册，新增《科学博览会》1册）<span></span></a>
									</p>
								</li>
								<li class="line1 item" ddt-pit="1" type="item" style="display: list-item;"><span class="num num1">1</span><a
									class="img" href="http://product.dangdang.com/25252408.html" target="_blank" dd_name="1"><img src="http://img3m8.ddimg.cn/82/19/25252408-1_l.jpg"
										alt="神奇校车·图画书版（全12册，新增《科学博览会》1册）"></a>
									<p class="name">
										<a title="神奇校车·图画书版（全12册，新增《科学博览会》1册）" href="http://product.dangdang.com/25252408.html?ref=mixpage-317715-15640_8-0"
											target="_blank" dd_name="1">神奇校车·图画书版（全12册，新增《科学博览会》1册）<span>风靡全世界的“神奇校车”再次出发！搭乘神奇校车，</span></a>
									</p>
								</li>
								<li class="line2 bar" ddt-pit="2" type="bar"><span class="num num2">2</span>
									<p class="name">
										<a title="人间失格（日本小说家太宰治的自传体小说）" href="http://product.dangdang.com/23761145.html?ref=mixpage-317715-15640_8-1"
											target="_blank" dd_name="2">人间失格（日本小说家太宰治的自传体小说）<span></span></a>
									</p>
								</li>
								<li class="line2 item" ddt-pit="2" type="item" style="display: none;"><span class="num num2">2</span><a class="img"
									href="http://product.dangdang.com/23761145.html" target="_blank" dd_name="2"><img src="http://img3m5.ddimg.cn/56/4/23761145-1_l.jpg"
										alt="人间失格（日本小说家太宰治的自传体小说）"></a>
									<p class="name">
										<a title="人间失格（日本小说家太宰治的自传体小说）" href="http://product.dangdang.com/23761145.html?ref=mixpage-317715-15640_8-1"
											target="_blank" dd_name="2">人间失格（日本小说家太宰治的自传体小说）<span>超燃！“丧文化”流行，《人间失格》成了现象级畅销书，创当当3</span></a>
									</p>
								</li>
								<li class="line3 bar" ddt-pit="3" type="bar"><span class="num num3">3</span>
									<p class="name">
										<a title="夏洛的网（新）" href="http://product.dangdang.com/23546266.html?ref=mixpage-317715-15640_8-2"
											target="_blank" dd_name="3">夏洛的网（新）<span></span></a>
									</p>
								</li>
								<li class="line3 item" ddt-pit="3" type="item" style="display: none;"><span class="num num3">3</span><a class="img"
									href="http://product.dangdang.com/23546266.html" target="_blank" dd_name="3"><img src="http://img3m6.ddimg.cn/7/21/23546266-1_l.jpg"
										alt="夏洛的网（新）"></a>
									<p class="name">
										<a title="夏洛的网（新）" href="http://product.dangdang.com/23546266.html?ref=mixpage-317715-15640_8-2"
											target="_blank" dd_name="3">夏洛的网（新）<span>“美国*伟大的十部儿童文学名著”之首，全球行销千万册，关于爱、友谊、生死，一本读到流泪</span></a>
									</p>
								</li>
								<li class="line4 bar" ddt-pit="4" type="bar"><span class="num num4">4</span>
									<p class="name">
										<a title="神奇校车·桥梁书版（全20册）" href="http://product.dangdang.com/23444350.html?ref=mixpage-317715-15640_8-3"
											target="_blank" dd_name="4">神奇校车·桥梁书版（全20册）<span></span></a>
									</p>
								</li>
								<li class="line4 item" ddt-pit="4" type="item" style="display: none;"><span class="num num4">4</span><a class="img"
									href="http://product.dangdang.com/23444350.html" target="_blank" dd_name="4"><img src="http://img3m0.ddimg.cn/61/3/23444350-1_l.jpg"
										alt="神奇校车·桥梁书版（全20册）"></a>
									<p class="name">
										<a title="神奇校车·桥梁书版（全20册）" href="http://product.dangdang.com/23444350.html?ref=mixpage-317715-15640_8-3"
											target="_blank" dd_name="4">神奇校车·桥梁书版（全20册）<span>（新老版本交替发货）美国Scholastic学子出版社金牌畅销系列，继续打造神奇</span></a>
									</p>
								</li>
								<li class="line5 bar" ddt-pit="5" type="bar"><span class="num num5">5</span>
									<p class="name">
										<a title="流浪的地球（刘慈欣著，无删节无改写，大人孩子均可阅读，此版本当当网销量遥遥领先！根据本书改编的同名电影2019春节上映。）" href="http://product.dangdang.com/25259300.html?ref=mixpage-317715-15640_8-4"
											target="_blank" dd_name="5">流浪的地球（刘慈欣著，无删节无改写，大人孩子均可阅读，此版本当当网销量遥遥领先！根据本书改编的同名电影2019春节上映。）<span></span></a>
									</p>
								</li>
								<li class="line5 item" ddt-pit="5" type="item" style="display: none;"><span class="num num5">5</span><a class="img"
									href="http://product.dangdang.com/25259300.html" target="_blank" dd_name="5"><img src="http://img3m0.ddimg.cn/44/29/25259300-1_l.jpg"
										alt="流浪的地球（刘慈欣著，无删节无改写，大人孩子均可阅读，此版本当当网销量遥遥领先！根据本书改编的同名电影2019春节上映。）"></a>
									<p class="name">
										<a title="流浪的地球（刘慈欣著，无删节无改写，大人孩子均可阅读，此版本当当网销量遥遥领先！根据本书改编的同名电影2019春节上映。）" href="http://product.dangdang.com/25259300.html?ref=mixpage-317715-15640_8-4"
											target="_blank" dd_name="5">流浪的地球（刘慈欣著，无删节无改写，大人孩子均可阅读，此版本当当网销量遥遥领先！根据本书改编的同名电</a>
									</p>
								</li>
								<li class="line6 bar" ddt-pit="6" type="bar"><span class="num num6">6</span>
									<p class="name">
										<a title="银火箭少年科幻系列 （8册。亚洲首位“雨果奖”得主刘慈欣主编，根据《流浪地球》改编的电影大年初一上映。套装内图书获银河奖特等奖等多项国际大奖，全球销量超500万册）"
											href="http://product.dangdang.com/25259302.html?ref=mixpage-317715-15640_8-5" target="_blank" dd_name="6">银火箭少年科幻系列
												（8册。亚洲首位“雨果奖”得主刘慈欣主编，根据《流浪地球》改编的电影大年初一上映。套装内图书获银河奖特等奖等多项国际大奖，全球销量超500万册）<span></span></a>
									</p>
								</li>
								<li class="line6 item" ddt-pit="6" type="item" style="display: none;"><span class="num num6">6</span><a class="img"
									href="http://product.dangdang.com/25259302.html" target="_blank" dd_name="6"><img src="http://img3m2.ddimg.cn/46/31/25259302-1_l.jpg"
										alt="银火箭少年科幻系列 （8册。亚洲首位“雨果奖”得主刘慈欣主编，根据《流浪地球》改编的电影大年初一上映。套装内图书获银河奖特等奖等多项国际大奖，全球销量超500万册）"></a>
									<p class="name">
										<a title="银火箭少年科幻系列 （8册。亚洲首位“雨果奖”得主刘慈欣主编，根据《流浪地球》改编的电影大年初一上映。套装内图书获银河奖特等奖等多项国际大奖，全球销量超500万册）"
											href="http://product.dangdang.com/25259302.html?ref=mixpage-317715-15640_8-5" target="_blank" dd_name="6">银火箭少年科幻系列&nbsp;（8册。亚洲首位“雨果奖”得主刘慈欣主编，根据《流浪地球》改编的电影大年初一上映。</a>
									</p>
								</li>
								<li class="line7 bar" ddt-pit="7" type="bar"><span class="num num7">7</span>
									<p class="name">
										<a title="我喜欢生命本来的样子(周国平经典散文作品集)" href="http://product.dangdang.com/24198400.html?ref=mixpage-317715-15640_8-6"
											target="_blank" dd_name="7">我喜欢生命本来的样子(周国平经典散文作品集)<span></span></a>
									</p>
								</li>
								<li class="line7 item" ddt-pit="7" type="item" style="display: none;"><span class="num num7">7</span><a class="img"
									href="http://product.dangdang.com/24198400.html" target="_blank" dd_name="7"><img src="http://img3m0.ddimg.cn/28/30/24198400-1_l.jpg"
										alt="我喜欢生命本来的样子(周国平经典散文作品集)"></a>
									<p class="name">
										<a title="我喜欢生命本来的样子(周国平经典散文作品集)" href="http://product.dangdang.com/24198400.html?ref=mixpage-317715-15640_8-6"
											target="_blank" dd_name="7">我喜欢生命本来的样子(周国平经典散文作品集)<span>影响和改变万千年轻人对人生的思考和生活的态度！上市半年以</span></a>
									</p>
								</li>
								<li class="line8 bar" ddt-pit="8" type="bar"><span class="num num8">8</span>
									<p class="name">
										<a title="丰子恺万般滋味，都是生活" href="http://product.dangdang.com/25308985.html?ref=mixpage-317715-15640_8-7"
											target="_blank" dd_name="8">丰子恺万般滋味，都是生活<span></span></a>
									</p>
								</li>
								<li class="line8 item" ddt-pit="8" type="item" style="display: none;"><span class="num num8">8</span><a class="img"
									href="http://product.dangdang.com/25308985.html" target="_blank" dd_name="8"><img src="http://img3m5.ddimg.cn/31/23/25308985-1_l.jpg"
										alt="丰子恺万般滋味，都是生活"></a>
									<p class="name">
										<a title="丰子恺万般滋味，都是生活" href="http://product.dangdang.com/25308985.html?ref=mixpage-317715-15640_8-7"
											target="_blank" dd_name="8">丰子恺万般滋味，都是生活<span>（回馈升级：现在下单即有机会获帆布包等丰子恺文创礼品一份，详见彩图）丰子恺</span></a>
									</p>
								</li>
								<li class="line9 bar" ddt-pit="9" type="bar"><span class="num num9">9</span>
									<p class="name">
										<a title="写给儿童的中国历史（全14册）" href="http://product.dangdang.com/23427436.html?ref=mixpage-317715-15640_8-8"
											target="_blank" dd_name="9">写给儿童的中国历史（全14册）<span></span></a>
									</p>
								</li>
								<li class="line9 item" ddt-pit="9" type="item" style="display: none;"><span class="num num9">9</span><a class="img"
									href="http://product.dangdang.com/23427436.html" target="_blank" dd_name="9"><img src="http://img3m6.ddimg.cn/76/35/23427436-1_l.jpg"
										alt="写给儿童的中国历史（全14册）"></a>
									<p class="name">
										<a title="写给儿童的中国历史（全14册）" href="http://product.dangdang.com/23427436.html?ref=mixpage-317715-15640_8-8"
											target="_blank" dd_name="9">写给儿童的中国历史（全14册）<span>第十届文津奖获奖图书，畅销台湾三十载，贯通上下五千年。学会了解自己，评</span></a>
									</p>
								</li>
								<li class="line10 bar" ddt-pit="10" type="bar"><span class="num num10">10</span>
									<p class="name">
										<a title="活着（2017年新版）" href="http://product.dangdang.com/25137790.html?ref=mixpage-317715-15640_8-9"
											target="_blank" dd_name="10">活着（2017年新版）<span></span></a>
									</p>
								</li>
								<li class="line10 item" ddt-pit="10" type="item" style="display: none;"><span class="num num10">10</span><a
									class="img" href="http://product.dangdang.com/25137790.html" target="_blank" dd_name="10"><img src="http://img3m0.ddimg.cn/7/27/25137790-1_l.jpg"
										alt="活着（2017年新版）"></a>
									<p class="name">
										<a title="活着（2017年新版）" href="http://product.dangdang.com/25137790.html?ref=mixpage-317715-15640_8-9"
											target="_blank" dd_name="10">活着（2017年新版）<span>余华是我国当代著名作家，也是享誉世界的小说家，曾荣获众多国内外奖项。《活着》是其</span></a>
									</p>
								</li>
							</ul>
						</div>
					</div>
					<div class="content tab_2" type="item" style="display: none;" dd_name="童书新书榜">
						<div class="book_top ">
							<style type="text/css">
								.hidden {
									display: none;
								}
							</style>
							<ul class="list_ab" id="component_3208542__9377_9376_9373__9373" accordion="true" js="true" speed="0" area="0"
								rand="0" delay="0" action="hover" itemclass="" barclass="hidden" level="2">
								<li class="line1 bar" ddt-pit="1" type="bar"><span class="num num1">1</span>
									<p class="name">
										<a title="我的神奇马桶（奇思妙趣三部曲）（全3册）" href="http://product.dangdang.com/27849730.html?ref=mixpage-317715-15640_8-0"
											target="_blank" dd_name="1">我的神奇马桶（奇思妙趣三部曲）（全3册）<span></span></a>
									</p>
								</li>
								<li class="line1 item" ddt-pit="1" type="item" style="display: none;"><span class="num num1">1</span><a class="img"
									href="http://product.dangdang.com/27849730.html" target="_blank" dd_name="1"><img src="http://img3m0.ddimg.cn/40/15/27849730-1_l.jpg"
										alt="我的神奇马桶（奇思妙趣三部曲）（全3册）"></a>
									<p class="name">
										<a title="我的神奇马桶（奇思妙趣三部曲）（全3册）" href="http://product.dangdang.com/27849730.html?ref=mixpage-317715-15640_8-0"
											target="_blank" dd_name="1">我的神奇马桶（奇思妙趣三部曲）（全3册）<span>从神奇马桶、百变浴缸到梦幻被子，脑洞大开，步步升级！意想不到</span></a>
									</p>
								</li>
								<li class="line2 bar" ddt-pit="2" type="bar"><span class="num num2">2</span>
									<p class="name">
										<a title="一看就会的思维导图启蒙绘本（歪歪兔童书馆出品）" href="http://product.dangdang.com/27854383.html?ref=mixpage-317715-15640_8-1"
											target="_blank" dd_name="2">一看就会的思维导图启蒙绘本（歪歪兔童书馆出品）<span></span></a>
									</p>
								</li>
								<li class="line2 item" ddt-pit="2" type="item" style="display: none;"><span class="num num2">2</span><a class="img"
									href="http://product.dangdang.com/27854383.html" target="_blank" dd_name="2"><img src="http://img3m3.ddimg.cn/40/6/27854383-1_l.jpg"
										alt="一看就会的思维导图启蒙绘本（歪歪兔童书馆出品）"></a>
									<p class="name">
										<a title="一看就会的思维导图启蒙绘本（歪歪兔童书馆出品）" href="http://product.dangdang.com/27854383.html?ref=mixpage-317715-15640_8-1"
											target="_blank" dd_name="2">一看就会的思维导图启蒙绘本（歪歪兔童书馆出品）<span>训练思维能力，大幅提升学习力。用绘本故事形象演示8种神</span></a>
									</p>
								</li>
								<li class="line3 bar" ddt-pit="3" type="bar"><span class="num num3">3</span>
									<p class="name">
										<a title="生活中的科学超厉害系列（套装全3册）（在生活中培养小小科学家，凯迪克金奖作者作品）" href="http://product.dangdang.com/27863701.html?ref=mixpage-317715-15640_8-2"
											target="_blank" dd_name="3">生活中的科学超厉害系列（套装全3册）（在生活中培养小小科学家，凯迪克金奖作者作品）<span></span></a>
									</p>
								</li>
								<li class="line3 item" ddt-pit="3" type="item" style="display: none;"><span class="num num3">3</span><a class="img"
									href="http://product.dangdang.com/27863701.html" target="_blank" dd_name="3"><img src="http://img3m1.ddimg.cn/52/0/27863701-1_l.jpg"
										alt="生活中的科学超厉害系列（套装全3册）（在生活中培养小小科学家，凯迪克金奖作者作品）"></a>
									<p class="name">
										<a title="生活中的科学超厉害系列（套装全3册）（在生活中培养小小科学家，凯迪克金奖作者作品）" href="http://product.dangdang.com/27863701.html?ref=mixpage-317715-15640_8-2"
											target="_blank" dd_name="3">生活中的科学超厉害系列（套装全3册）（在生活中培养小小科学家，凯迪克金奖作者作品）<span>从马桶开始，认识整</span></a>
									</p>
								</li>
								<li class="line4 bar" ddt-pit="4" type="bar"><span class="num num4">4</span>
									<p class="name">
										<a title="我的爸爸在火星（媲美《流浪地球》，治愈万千读者的儿童科幻佳作。接棒《许愿地球仪》，再次唱响勇气和希望的生命教育之书。）" href="http://product.dangdang.com/26923897.html?ref=mixpage-317715-15640_8-3"
											target="_blank" dd_name="4">我的爸爸在火星（媲美《流浪地球》，治愈万千读者的儿童科幻佳作。接棒《许愿地球仪》，再次唱响勇气和希望的生命教育之书。）<span></span></a>
									</p>
								</li>
								<li class="line4 item" ddt-pit="4" type="item" style="display: none;"><span class="num num4">4</span><a class="img"
									href="http://product.dangdang.com/26923897.html" target="_blank" dd_name="4"><img src="http://img3m7.ddimg.cn/55/33/26923897-1_l.jpg"
										alt="我的爸爸在火星（媲美《流浪地球》，治愈万千读者的儿童科幻佳作。接棒《许愿地球仪》，再次唱响勇气和希望的生命教育之书。）"></a>
									<p class="name">
										<a title="我的爸爸在火星（媲美《流浪地球》，治愈万千读者的儿童科幻佳作。接棒《许愿地球仪》，再次唱响勇气和希望的生命教育之书。）" href="http://product.dangdang.com/26923897.html?ref=mixpage-317715-15640_8-3"
											target="_blank" dd_name="4">我的爸爸在火星（媲美《流浪地球》，治愈万千读者的儿童科幻佳作。接棒《许愿地球仪》，再次唱响勇气和希望</a>
									</p>
								</li>
								<li class="line5 bar" ddt-pit="5" type="bar"><span class="num num5">5</span>
									<p class="name">
										<a title="DK幼儿百科全书系列套装（全2册）那些重要的事+那些重要的动物" href="http://product.dangdang.com/27847393.html?ref=mixpage-317715-15640_8-4"
											target="_blank" dd_name="5">DK幼儿百科全书系列套装（全2册）那些重要的事+那些重要的动物<span></span></a>
									</p>
								</li>
								<li class="line5 item" ddt-pit="5" type="item" style="display: none;"><span class="num num5">5</span><a class="img"
									href="http://product.dangdang.com/27847393.html" target="_blank" dd_name="5"><img src="http://img3m3.ddimg.cn/79/9/27847393-1_l.jpg"
										alt="DK幼儿百科全书系列套装（全2册）那些重要的事+那些重要的动物"></a>
									<p class="name">
										<a title="DK幼儿百科全书系列套装（全2册）那些重要的事+那些重要的动物" href="http://product.dangdang.com/27847393.html?ref=mixpage-317715-15640_8-4"
											target="_blank" dd_name="5">DK幼儿百科全书系列套装（全2册）那些重要的事+那些重要的动物<span>专为学龄前儿童设计的百科全书，献给对一切</span></a>
									</p>
								</li>
								<li class="line6 bar" ddt-pit="6" type="bar"><span class="num num6">6</span>
									<p class="name">
										<a title="我的第一本量子物理学（一本敲开物理大门的科普全图解，让孩子爱上求知与思考。）" href="http://product.dangdang.com/26923241.html?ref=mixpage-317715-15640_8-5"
											target="_blank" dd_name="6">我的第一本量子物理学（一本敲开物理大门的科普全图解，让孩子爱上求知与思考。）<span></span></a>
									</p>
								</li>
								<li class="line6 item" ddt-pit="6" type="item" style="display: none;"><span class="num num6">6</span><a class="img"
									href="http://product.dangdang.com/26923241.html" target="_blank" dd_name="6"><img src="http://img3m1.ddimg.cn/92/6/26923241-1_l.jpg"
										alt="我的第一本量子物理学（一本敲开物理大门的科普全图解，让孩子爱上求知与思考。）"></a>
									<p class="name">
										<a title="我的第一本量子物理学（一本敲开物理大门的科普全图解，让孩子爱上求知与思考。）" href="http://product.dangdang.com/26923241.html?ref=mixpage-317715-15640_8-5"
											target="_blank" dd_name="6">我的第一本量子物理学（一本敲开物理大门的科普全图解，让孩子爱上求知与思考。）<span>一本可以仰望“黑洞”，</span></a>
									</p>
								</li>
								<li class="line7 bar" ddt-pit="7" type="bar"><span class="num num7">7</span>
									<p class="name">
										<a title="拯救温斯洛（荣获纽伯瑞、卡内基双料殿堂级童书大奖，美国著名儿童文坛巨匠莎朗·克里奇生命教育力作！媲美《天蓝色的彼岸》）" href="http://product.dangdang.com/26924306.html?ref=mixpage-317715-15640_8-6"
											target="_blank" dd_name="7">拯救温斯洛（荣获纽伯瑞、卡内基双料殿堂级童书大奖，美国著名儿童文坛巨匠莎朗·克里奇生命教育力作！媲美《天蓝色的彼岸》）<span></span></a>
									</p>
								</li>
								<li class="line7 item" ddt-pit="7" type="item" style="display: none;"><span class="num num7">7</span><a class="img"
									href="http://product.dangdang.com/26924306.html" target="_blank" dd_name="7"><img src="http://img3m6.ddimg.cn/68/35/26924306-1_l.jpg"
										alt="拯救温斯洛（荣获纽伯瑞、卡内基双料殿堂级童书大奖，美国著名儿童文坛巨匠莎朗·克里奇生命教育力作！媲美《天蓝色的彼岸》）"></a>
									<p class="name">
										<a title="拯救温斯洛（荣获纽伯瑞、卡内基双料殿堂级童书大奖，美国著名儿童文坛巨匠莎朗·克里奇生命教育力作！媲美《天蓝色的彼岸》）" href="http://product.dangdang.com/26924306.html?ref=mixpage-317715-15640_8-6"
											target="_blank" dd_name="7">拯救温斯洛（荣获纽伯瑞、卡内基双料殿堂级童书大奖，美国著名儿童文坛巨匠莎朗·克里奇生命教育力作！媲美</a>
									</p>
								</li>
								<li class="line8 bar" ddt-pit="8" type="bar"><span class="num num8">8</span>
									<p class="name">
										<a title="女孩指南 动感青春期50课" href="http://product.dangdang.com/26922220.html?ref=mixpage-317715-15640_8-7"
											target="_blank" dd_name="8">女孩指南 动感青春期50课<span></span></a>
									</p>
								</li>
								<li class="line8 item" ddt-pit="8" type="item" style="display: none;"><span class="num num8">8</span><a class="img"
									href="http://product.dangdang.com/26922220.html" target="_blank" dd_name="8"><img src="http://img3m0.ddimg.cn/61/21/26922220-1_l.jpg"
										alt="女孩指南 动感青春期50课"></a>
									<p class="name">
										<a title="女孩指南 动感青春期50课" href="http://product.dangdang.com/26922220.html?ref=mixpage-317715-15640_8-7"
											target="_blank" dd_name="8">女孩指南&nbsp;动感青春期50课<span>9-16岁&nbsp;&nbsp;时尚动感的闺蜜私语，贴心实用的青春期指南。每一位妈妈都应该送给女儿的</span></a>
									</p>
								</li>
								<li class="line9 bar" ddt-pit="9" type="bar"><span class="num num9">9</span>
									<p class="name">
										<a title="小熊很忙系列（新版套装全16册）" href="http://product.dangdang.com/26924000.html?ref=mixpage-317715-15640_8-8"
											target="_blank" dd_name="9">小熊很忙系列（新版套装全16册）<span></span></a>
									</p>
								</li>
								<li class="line9 item" ddt-pit="9" type="item" style="display: none;"><span class="num num9">9</span><a class="img"
									href="http://product.dangdang.com/26924000.html" target="_blank" dd_name="9"><img src="http://img3m0.ddimg.cn/59/25/26924000-1_l.jpg"
										alt="小熊很忙系列（新版套装全16册）"></a>
									<p class="name">
										<a title="小熊很忙系列（新版套装全16册）" href="http://product.dangdang.com/26924000.html?ref=mixpage-317715-15640_8-8"
											target="_blank" dd_name="9">小熊很忙系列（新版套装全16册）<span>风靡全球的中英双语互动游戏纸板书，全球热销1000多万册！附赠地道英文音</span></a>
									</p>
								</li>
								<li class="line10 bar hidden" ddt-pit="10" type="bar"><span class="num num10">10</span>
									<p class="name">
										<a title="亲爱的女儿+亲爱的儿子（全二册，父母送给孩子相伴一生的祝福，子女闯荡世界终身受益的话语）" href="http://product.dangdang.com/27863117.html?ref=mixpage-317715-15640_8-9"
											target="_blank" dd_name="10">亲爱的女儿+亲爱的儿子（全二册，父母送给孩子相伴一生的祝福，子女闯荡世界终身受益的话语）<span></span></a>
									</p>
								</li>
								<li class="line10 item" ddt-pit="10" type="item" style=""><span class="num num10">10</span><a class="img" href="http://product.dangdang.com/27863117.html"
									target="_blank" dd_name="10"><img src="http://img3m7.ddimg.cn/62/8/27863117-1_l.jpg" alt="亲爱的女儿+亲爱的儿子（全二册，父母送给孩子相伴一生的祝福，子女闯荡世界终身受益的话语）"></a>
									<p class="name">
										<a title="亲爱的女儿+亲爱的儿子（全二册，父母送给孩子相伴一生的祝福，子女闯荡世界终身受益的话语）" href="http://product.dangdang.com/27863117.html?ref=mixpage-317715-15640_8-9"
											target="_blank" dd_name="10">亲爱的女儿+亲爱的儿子（全二册，父母送给孩子相伴一生的祝福，子女闯荡世界终身受益的话语）<span>写给所有儿子</span></a>
									</p>
								</li>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<link href="IndexStyle/default-product-list.css" rel="stylesheet" />
	<br />
</asp:Content>
