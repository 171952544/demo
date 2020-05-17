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
    public partial class WebForm1 : System.Web.UI.Page
    {
        private object TextArea1;

        public object Textarea { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //获取当前日期：
            //TextBox6.Text = Calendar1.TodaysDate.ToLongDateString();

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (DropDownList1.SelectedIndex)
            {
                case 0: DropDownList2.Items.Clear(); DropDownList2.Items.Add("请选择"); break;
                case 1: DropDownList2.Items.Clear(); DropDownList2.Items.Add("请选择"); DropDownList2.Items.Add("长沙市"); DropDownList2.Items.Add("株洲市"); break;
                case 2: DropDownList2.Items.Clear(); DropDownList2.Items.Add("请选择"); DropDownList2.Items.Add("武汉市"); DropDownList2.Items.Add("黄石市"); break;
            }
        }

       

        

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

            TextBox6.Text = Calendar1.TodaysDate.ToLongDateString();

        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {


        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            /*string Msg="";
            Msg += "姓名："+TextBox1.Text+"<br/>";
            Msg += "姓别：";
            for (int i = 0; i <RadioButtonList1.Items.Count; i++)
            {
                if (RadioButtonList1.Items[i].Selected)
                    Msg += RadioButtonList1.Items[i].Text + "<br/>";
            }
            Msg += "籍贯：" + DropDownList1.SelectedValue+ DropDownList2.SelectedValue+"<br/>";

            Msg += "个人照片：" +this.img.Src+"<br/>";


            Msg += "Email：" + TextBox4.Text + "<br/>";
            Msg += "手机号：" + TextBox5.Text + "<br/>";
            Msg += "专业擅长:" + "<br/>";
            for (int i = 0; i < ListBox1.Items.Count; i++)
            {
                if (ListBox1.Items[i].Selected)
                    Msg += ListBox1.Items[i].Text + "<br/>";
            }
            Msg += "您的个人爱好是：<br/>";
            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                    Msg += CheckBoxList1.Items[i].Text + "<br/>";
            }
            TextBox6.Text = Calendar1.SelectedDate.ToShortDateString();
            Msg += "日期：" + TextBox6.Text + "<br/>";
            Msg += "个人简介：" + TextBox7.Text + "<br/>";
            Session["tijiao"] = Msg;*/

            Session["name"] = TextBox1.Text;
            Session["psd"] = TextBox2.Text;
            for (int i = 0; i < RadioButtonList1.Items.Count; i++)
            {
                if (RadioButtonList1.Items[i].Selected)
                    Session["sex"] = RadioButtonList1.Items[i].Text;
            }
            Session["jiguan"] = DropDownList1.SelectedValue + DropDownList2.SelectedValue;
            Session["photo"] = this.img.Src;
            Session["email"] = TextBox4.Text;
            Session["tel"] = TextBox5.Text;
            for (int i = 0; i < ListBox1.Items.Count; i++)
            {
                if (ListBox1.Items[i].Selected)
                    Session["character"]= ListBox1.Items[i].Text;
            }
            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                   Session["hobby"]= CheckBoxList1.Items[i].Text;
            }
            TextBox6.Text = Calendar1.SelectedDate.ToShortDateString();
            Session["birth"] = TextBox6.Text;
            Session["jieshao"] = TextBox7.Text;
            
            Response.Redirect("WebForm3.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("注册.aspx");
        }

        protected void TextBox6_TextChanged(object sender, EventArgs e)
        {
            TextBox6.Text = Calendar1.SelectedDate.ToLongDateString();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            TextBox6.Text = Calendar1.SelectedDate.ToLongDateString();
        }

        protected void BtnUp_Click(object sender, EventArgs e)
        {
            /// <summary>
            /// 上传单一图片——有“选择”+“上传”两个按钮
            /// </summary>
            /// <param name="sender"></param>
            /// <param name="e"></param>

            if (FileUpload.HasFile)
            {
                string savePath = Server.MapPath("~/upload/");//指定上传文件在服务器上的保存路径
                //检查服务器上是否存在这个物理路径，如果不存在则创建
                if (!System.IO.Directory.Exists(savePath))
                {
                    System.IO.Directory.CreateDirectory(savePath);
                }
                savePath = savePath + "\\" + FileUpload.FileName;
                FileUpload.SaveAs(savePath);
                LabMsg.Text = string.Format("<a href='upload/{0}'>upload/{0}</a>", FileUpload.FileName);
                this.img.Src = "upload/" + FileUpload.FileName;

            }
            else
            {
                LabMsg.Text = "你还没有选择上传文件!";
            }
            TextBox2.Attributes["value"] = TextBox2.Text;
            TextBox3.Attributes["value"] = TextBox3.Text;
            Session["image"] = this.img.Src;
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from users where name=@name", conn);
            cmd.Parameters.Add("@name", SqlDbType.Char);

            cmd.Parameters[0].Value = TextBox1.Text;
            int count = (int)cmd.ExecuteScalar();  //返回结果集中第一行的第一列（常用于检索单个值，例如记录个数）
            conn.Close();
            if (count > 0)
            {
                args.IsValid = false;
                CustomValidator1.ErrorMessage = "用户名已存在!";
            }
            else
            {
                args.IsValid = true;
            }
        }



    }
}