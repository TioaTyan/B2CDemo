﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using B2C_NetShop.App_Start;

namespace B2C_NetShop
{
	public partial class _Default : Page
	{
		pageload load = new pageload();
		Database operate = new Database();
		DataTable dtTable;
		protected void Page_Load(object sender, EventArgs e)
		{
			HyperLink hl1 = (HyperLink)(Master.FindControl("HyperLink1"));//用户个人资料
			HyperLink hl2 = (HyperLink)(Master.FindControl("HyperLink2"));//后台
			HyperLink hl3 = (HyperLink)(Master.FindControl("HyperLink3"));//注册、注销
			String uid = Convert.ToString(Session["uid"]);
			String nickname = Convert.ToString(Session["nickname"]);
			String url = Convert.ToString(Session["userImgUrl"]);
			int status = Convert.ToInt32(Session["Status"]);
			HtmlGenericControl line = (HtmlGenericControl)this.Master.FindControl("line");
			load.HyperLinkBind(hl1, hl2, hl3, uid, status, line);
			load.MainPageBind(HyperLink1, HyperLink2, Label1, uid, nickname,Image1,url);
			//绑定首页右侧畅销榜/新书榜数据start
			string sql1 = "select BookID,BookName,BookIntroduce,picUrl from Goods_Sales_Rank_Top10 order by BookSalesCount desc";
			string sql2 = "select BookID,BookName,BookIntroduce,picUrl from Goods_Sales_Rank_Top10 order by BookSalesCount asc";
			BindDlGoodMarketTabData(DlGoodMarketTab1,sql1);
			BindDlGoodMarketTabData(DlGoodMarketTab2,sql2);
			//绑定首页商品推荐tab的六个推荐位start
			bind(1, dl_tab2, dl_tab1);
			bind(2, dl_tab4, dl_tab3);
			bind(3, dl_tab6, dl_tab5);
			bind(4, dl_tab8, dl_tab7);
		}

		/// <summary>
		/// 绑定首页商品推荐tab
		/// </summary>
		/// <param name="classNum">类别</param>
		/// <param name="dl">上面两个推荐位</param>
		/// <param name="dl2">下面四个推荐位</param>
		protected void bind(int classNum, DataList dl, DataList dl2)
		{
			dtTable = new DataTable();
			DataColumn[] dataColumns = new DataColumn[6];
			string[] colunm = { "BookID", "BookName", "picUrl", "BookUrl", "OriginalPrice", "MarketPrice" };
			for (int k = 0; k < colunm.Length; k++)
			{
				dataColumns[k] = new DataColumn(colunm[k]);
				dtTable.Columns.Add(dataColumns[k]);
			}
			string sql = "select BookID,BookName,picUrl,OriginalPrice,MarketPrice from  Goods_Recommend_ByClass,dbo.Goods_Class where Goods_Class.ClassID=Goods_Recommend_ByClass.ClassID AND Goods_Recommend_ByClass.ClassID=@Class";
			SqlParameter[] parameters ={
				new SqlParameter("Class",classNum)
			};
			DataSet ds = operate.GetTable(sql, parameters);
			DataRow row;
			for (int j = 0; j <= 3; j++)
			{
				row = dtTable.NewRow();
				row["BookID"] = ds.Tables[0].Rows[j][0].ToString();
				row["BookName"] = ds.Tables[0].Rows[j][1].ToString();
				row["picUrl"] = ds.Tables[0].Rows[j][2].ToString();
				row["OriginalPrice"] = ds.Tables[0].Rows[j][3].ToString();
				row["MarketPrice"] = ds.Tables[0].Rows[j][4].ToString();
				row["BookUrl"] = "Goods/Detail.aspx?id=" + ds.Tables[0].Rows[j][0].ToString();
				dtTable.Rows.Add(row);
			}
			dl.DataSource = dtTable.DefaultView;
			dl.DataBind();

			DataTable dtTable2 = new DataTable();
			DataColumn[] dataColumns2 = new DataColumn[6];
			string[] colunm2 = { "BookID", "BookName", "picUrl", "BookUrl", "OriginalPrice", "MarketPrice" };
			for (int k = 0; k < colunm2.Length; k++)
			{
				dataColumns2[k] = new DataColumn(colunm2[k]);
				dtTable2.Columns.Add(dataColumns2[k]);
			}
			for (int j = 4; j <= 5; j++)
			{
				row = dtTable2.NewRow();
				row["BookID"] = ds.Tables[0].Rows[j][0].ToString();
				row["BookName"] = ds.Tables[0].Rows[j][1].ToString();
				row["picUrl"] = ds.Tables[0].Rows[j][2].ToString();
				row["OriginalPrice"] = ds.Tables[0].Rows[j][3].ToString();
				row["MarketPrice"] = ds.Tables[0].Rows[j][4].ToString();
				row["BookUrl"] = "Goods/Detail.aspx?id=" + ds.Tables[0].Rows[j][0].ToString();
				dtTable2.Rows.Add(row);

			}
			dl2.DataSource = dtTable2.DefaultView;
			dl2.DataBind();
		}

		/// <summary>
		/// 绑定畅销榜数据
		/// </summary>
		/// <param name="DataList">列表</param>
		protected void BindDlGoodMarketTabData(DataList tab,string sql){
			DataTable dtTable = new DataTable();
			DataColumn[] dataColumns = new DataColumn[6];
			string[] colunm = { "Rank", "BookName", "BookIntroduce", "picUrl", "BookUrl" };
			for (int k = 0; k < colunm.Length; k++)
			{
				dataColumns[k] = new DataColumn(colunm[k]);
				dtTable.Columns.Add(dataColumns[k]);
			}
			
			DataSet ds = operate.GetTable(sql);
			DataRow row;
			int i = 0;
			foreach (DataRow drRow in ds.Tables[0].Rows)
			{
				row = dtTable.NewRow();
				row["Rank"] = i + 1;
				row["BookName"] = ds.Tables[0].Rows[i][1].ToString();
				row["BookIntroduce"] = ds.Tables[0].Rows[i][2].ToString();
				row["picUrl"] = ds.Tables[0].Rows[i][3].ToString();
				row["BookUrl"] = "Goods/Detail.aspx?id=" + ds.Tables[0].Rows[i][0].ToString();
				i++;
				dtTable.Rows.Add(row);
			}
			tab.DataSource = dtTable.DefaultView;
			tab.DataBind();
		}
	}
}