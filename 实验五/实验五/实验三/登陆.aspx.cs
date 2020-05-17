using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace 实验三
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from users where name=@name and psd=@psd and email=@email", conn);
            
            cmd.Parameters.Add("@name", SqlDbType.Char);
            cmd.Parameters.Add("@psd", SqlDbType.Char);
            cmd.Parameters.Add("@email", SqlDbType.Char);
            cmd.Parameters[0].Value = TextBox1.Text;
            cmd.Parameters[1].Value = TextBox2.Text;
            cmd.Parameters[2].Value = TextBox3.Text;
            int count = (int)cmd.ExecuteScalar();

            

            conn.Close();
            if (count == 1)
            {
                Session["CurrentUser"] = TextBox1.Text;
                Session["email"] = TextBox3.Text;
                Response.Redirect("WebForm5.aspx");


            }
            else
            {
                Response.Write("<script>alert('用户名或密码错误')</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("注册.aspx");
        }
    }
}