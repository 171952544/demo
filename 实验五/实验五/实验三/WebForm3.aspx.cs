using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实验三
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = (string)Session["name"];
            Label2.Text = (string)Session["psd"];
            Label3.Text = (string)Session["sex"];
            Label4.Text = (string)Session["jiguan"];
            Label5.Text = (string)Session["email"];
            Label6.Text = (string)Session["tel"];
            Label7.Text = (string)Session["character"];
            Label8.Text = (string)Session["hobby"];
            Label9.Text = (string)Session["birth"];
            Label10.Text = (string)Session["jieshao"];
            // Response.AddHeader("refresh", "5;url='Login.aspx'");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource4.Insert();
            Response.Redirect("登陆.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm5.aspx");
        }
    }
}