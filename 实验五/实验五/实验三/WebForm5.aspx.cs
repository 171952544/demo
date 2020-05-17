using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实验三

{

    public partial class WebForm5 : System.Web.UI.Page

    {

        protected void Page_Load(object sender, EventArgs e)

        {

            if (!IsPostBack)

            {

                //站内信息的初始化赋值以及是否已在通讯录中选中联系人的和加载已选中的联系人

                String str = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True";

                SqlConnection con = new SqlConnection(str);



                SqlCommand cmd = new SqlCommand("select * from users where email=" + "'" + Session["email"] + "'", con);

                SqlDataReader myReader = null;

                try

                {

                    con.Open();

                    myReader = cmd.ExecuteReader();

                    while (myReader.Read())

                    {

                        Session["mail"] = myReader[9] + "";

                        Session["mailpass"] = myReader[10] + "";

                        Session["mailname"] = myReader[11] + "";



                    }



                }

                catch

                {

                }

                finally

                {

                    if (myReader != null)

                    {

                        myReader.Close();

                    }

                    con.Close();

                }

                if (Session["0"] != null)

                {

                    for (int i = 1; i <= (int)Session["0"]; i++)

                    {

                        if (i == (int)Session["0"])

                        {

                            recfContact.Text += Session["" + i];

                        }

                        else

                        {

                            recfContact.Text += Session["" + i] + "||";

                        }

                    }

                }

                if (Session["title"] != null)
                {

                    Title.Text = Session["title"] + "";

                }

            }

        }

        private string SendMail1(string from, string fromname, string to, string subject, string body, string username, string password, string server, string fujian)



        {

            jmail.MessageClass oJmailMessage = new jmail.MessageClass();

            /**//// 字符集

            oJmailMessage.Charset = "GB2312";

            oJmailMessage.ISOEncodeHeaders = false;

            /**//// 优先级

            oJmailMessage.Priority = Convert.ToByte(1);

            /**////发送人邮件地址

            oJmailMessage.From = (string)Session["email"];

            /**////发送人姓名

            oJmailMessage.FromName = fromname;

            /**//// 邮件主题

            oJmailMessage.Subject = subject;

            /**////身份验证的用户名

            oJmailMessage.MailServerUserName = "13260525486@163.com";

            /**////用户密码

            oJmailMessage.MailServerPassWord = "qq171952544";

            /**////添加一个收件人，抄送人和密送人的添加和该方法是一样的，只是分别使用AddRecipientCC和RecipientBCC两个属性

            ///要是需要添加多个收件人，则重复下面的语句即可。添加多个抄送和密送人的方法一样

            oJmailMessage.AddRecipient("13260525486@163.com", "", "");
            /**////邮件内容

            String a = "";

            oJmailMessage.Body = body;

            if (oJmailMessage.Send(server))

            {

                a = "发送成功！";

            }

            else

            {

                a = "发送失败，请检查邮件服务器的设置！";

            }

            oJmailMessage = null;

            return a;

        }

        protected void send_Click(object sender, EventArgs e)

        {

            if (Content.Text == "" || recfContact.Text == "")

            {

                msg1.Text = "发送信息或收件人不能为空";

            }

            else

            {

                if (Session["0"] == null && recfContact.Text != "")

                {



                    if (Title.Text != "")

                    {

                        msg.Text = SendMail1(Session["mail"] + "", Session["mailname"] + "", recfContact.Text, Title.Text, Content.Text, Session["mail"] + "", Session["mailpass"] + "", "smtp.163.com", "");

                    }

                    else
                    {

                        msg1.Text = "主题不能为空！";

                    }



                }

                else if ((int)Session["0"] != 0)

                {

                    for (int i = 1; i <= (int)Session["0"]; i++)

                    {



                        if (Title.Text != "")

                        {

                            msg.Text += "第" + i + "条" + SendMail1(Session["mail"] + "", Session["mailname"] + "", Session["" + i] + "", Title.Text, Content.Text, Session["mail"] + "", Session["mailpass"] + "", "smtp.163.com", "") + "<br/>";

                        }

                        else

                        {

                            msg1.Text = "主题不能为空！";

                        }

                    }

                }

            }

        }

      
    }

}
