﻿using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B2C_NetShop.App_Start;

namespace B2C_NetShop.Goods
{
	public partial class Detail : System.Web.UI.Page
	{
		pageload load = new pageload();
		Database operate = new Database();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.QueryString["id"] == null)
			{
				Response.Redirect("~/Default.aspx");
			}
			HyperLink hl1 = (HyperLink)(Master.FindControl("HyperLink1"));//用户个人资料
			HyperLink hl2 = (HyperLink)(Master.FindControl("HyperLink2"));//后台
			HyperLink hl3 = (HyperLink)(Master.FindControl("HyperLink3"));//注册、注销
			String uid = Convert.ToString(Session["uid"]);
			String nickname = Convert.ToString(Session["nickname"]);
			int status = Convert.ToInt32(Session["Status"]);
			load.HyperLinkBind(hl1, hl2, hl3, uid, status);
		}

		protected void btn_AddtoCart_Click(object sender, EventArgs e)
		{
			String uid = Convert.ToString(Session["uid"]);
			if (uid != "")
			{
				int bookid = Convert.ToInt32(Request.QueryString["id"].ToString());
				int booknum = Convert.ToInt32(TextBox_booknum.Text.ToString());
				Response.Redirect("~/Goods/addTocart.aspx?bookid=" + bookid + "&booknum=" + booknum);
			}
		}
		protected void btnLogin_Click(object sender, EventArgs e)
		{
			String uid = TextBox1.Text.Trim();
			String pwd = TextBox2.Text.Trim();
			if (String.IsNullOrEmpty(uid) || String.IsNullOrEmpty(pwd))
			{
				Response.Write("<script type='text/javascript'>alert('用户名或密码为空！');</script>");
			}
			String sql = "select count(*) from User_Account where UID=@uid and Password=@pwd";
			SqlParameter[] parameters = {
				new SqlParameter("@uid",uid),
				new SqlParameter("@pwd",pwd)
			};
			int n = (int)operate.ExecuteScalar(sql, parameters);
			if (n == 1)
			{
				String userpower = "select NickName,UserType,userImgUrl from User_Info where UID=@uid";
				SqlParameter[] parameters1 = {
				new SqlParameter("@uid",uid)
				};
				DataSet ds = operate.GetTable(userpower, parameters1);
				ds.Dispose();
				String nickname = ds.Tables[0].Rows[0][0].ToString();
				String power = ds.Tables[0].Rows[0][1].ToString();
				String userImgUrl = ds.Tables[0].Rows[0][2].ToString();
				Session["uid"] = uid;
				Session["nickname"] = nickname;
				Session["Status"] = power;   //power=1：普通用户，power=2,3,4：管理员
				Session["userImgUrl"] = userImgUrl;
				Hashtable hashCart = new Hashtable();
				Session["ShopCart"] = hashCart;
				int bookid = Convert.ToInt32(Request.QueryString["id"].ToString());
				int booknum = Convert.ToInt32(TextBox_booknum.Text.ToString());
				Response.Redirect("~/Goods/addTocart.aspx?bookid=" + bookid + "&booknum=" + booknum);
			}
			else
			{
				Response.Write("<script>alert('用户名或密码错误')</script>");
			}
		}

		protected void btn_plus_Click(object sender, EventArgs e)
		{
			int num = Convert.ToInt32(TextBox_booknum.Text.ToString());
			TextBox_booknum.Text = Convert.ToString(num + 1);
		}

		protected void btn_minus_Click(object sender, EventArgs e)
		{
			int num = Convert.ToInt32(TextBox_booknum.Text.ToString());
			if (num >1){
				TextBox_booknum.Text = Convert.ToString(num - 1);
			}
		}
	}
}