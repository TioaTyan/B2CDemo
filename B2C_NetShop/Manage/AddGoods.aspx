﻿<%@ Page Title="" Language="C#" MasterPageFile="~/WithoutLogin.Master" AutoEventWireup="true" CodeBehind="AddGoods.aspx.cs" Inherits="B2C_NetShop.Manage.AddGoods" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	<style>
		#add_main {
			margin: 0 auto;
		}

		.input-text {
			border: 1px solid #808080;
		}

			.input-text:focus {
				border: 1px solid red;
			}


		.btn-default {
			height: 30px;
			width: 100px;
			background: red;
			color: white;
			border: none;
			border-radius: 5px;
			-webkit-transition-duration: .25s;
			-moz-transition-duration: .25s;
			-o-transition-duration: .25s;
			transition-duration: .25s;
		}

			.btn-default:hover {
				background: black;
				color: white;
			}
	</style>
	<div id="main_content" style="height: 1000px; width: 90%; display: block; margin-top: 50px;">
		<div id="title_welcome" style="padding: 10px; display: block; font-family: 微软雅黑; font-size: 16px;">
			Welcome,<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
		</div>
		<div id="nvg" style="padding: 10px; display: block; font-family: Tahoma; font-size: 12px;">您当前的位置：<a href="../Default.aspx">首页</a> > <a href="main.aspx">系统管理</a> > 图书管理 > 添加图书</div>
		<div id="add_main">

			<div id="detail" style="padding: 10px; width: 45%; display: block; margin: 0 auto;">
				<table style="width: 100%;">
					<tr>
						<td style="text-align: center">选择图片：</td>
						<td>
							<asp:FileUpload ID="FileUpload1" runat="server" />
						</td>
					</tr>
					<tr>
						<td style="width: 20%; height: 30px; text-align: right">名称：</td>
						<td style="width: 60%; height: 30px">
							<asp:TextBox ID="TextBox_Name" runat="server" Width="100%" CssClass="input-text"></asp:TextBox>
						</td>
						<td style="width: 20%; height: 30px">
							<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_Name" ErrorMessage="*名称不允许未空" ForeColor="Red"></asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; height: 30px; text-align: right">作者：</td>
						<td style="width: 60%; height: 30px">
							<asp:TextBox ID="TextBox_Author" runat="server" Width="100%" CssClass="input-text"></asp:TextBox>
						</td>
						<td style="width: 20%; height: 30px">
							<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_Author" ErrorMessage="*作者不允许为空" ForeColor="Red"></asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; height: 30px; text-align: right">类别：</td>
						<td style="width: 60%; height: 30px">
							<asp:DropDownList ID="DropDownList_Class" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName" DataValueField="ClassID">
							</asp:DropDownList>
							<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:B2C_DemoConnectionString %>" SelectCommand="SELECT * FROM [Goods_Class]"></asp:SqlDataSource>
						</td>
						<td style="width: 20%; height: 30px">&nbsp;</td>
					</tr>
					<tr>
						<td style="width: 20%; height: 30px; text-align: right">出版社：</td>
						<td style="width: 60%; height: 30px">
							<asp:TextBox ID="TextBox_Company" runat="server" Width="100%" CssClass="input-text"></asp:TextBox>
						</td>
						<td style="width: 20%; height: 30px">
							<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox_Company" ErrorMessage="*出版社不允许为空" ForeColor="Red"></asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; height: 200px; text-align: right">简介：</td>
						<td style="width: 60%; height: 200px">
							<asp:TextBox ID="TextBox_BookIntroduce" runat="server" Width="100%" Height="100%" TextMode="MultiLine" CssClass="input-text"></asp:TextBox>
						</td>
						<td style="width: 20%; height: 200px">
							<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox_BookIntroduce" ErrorMessage="*简介不允许为空" ForeColor="Red"></asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; height: 30px; text-align: right">定价：</td>
						<td style="width: 60%; height: 30px">
							<asp:TextBox ID="TextBox_MarketPrice" runat="server" Width="100%" CssClass="input-text"></asp:TextBox>
						</td>
						<td style="width: 20%; height: 30px">
							<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox_MarketPrice" ErrorMessage="*定价不允许为空" ForeColor="Red"></asp:RequiredFieldValidator>
							<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox_MarketPrice" ErrorMessage="定价为两位小数的正实数" ForeColor="Red" ValidationExpression="^[0-9]+(.[0-9]{2})?$"></asp:RegularExpressionValidator>
						</td>
					</tr>

					<tr>
						<td style="height: 50px; text-align: center" colspan="3">
							<asp:Button ID="Button_submit" runat="server" CssClass="btn-default" Text="提交" Width="60px" OnClick="Button_submit_Click" />
							<asp:Button ID="Button_clear" runat="server" CssClass="btn-default" Text="清空" Width="60px" CausesValidation="False" OnClick="Button_clear_Click" />
						</td>
					</tr>
				</table>
			</div>
			<div id="div_clear" style="clear: both"></div>
		</div>
	</div>
</asp:Content>
