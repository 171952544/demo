using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实验三

{

    public partial class Site1 : MasterPage

    {





        protected void Page_Load(object sender, EventArgs e)

        {

            if (!IsPostBack)

            {

                String str = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True";

                SqlConnection con = new SqlConnection(str);

                SqlCommand cmd = new SqlCommand("select * from users where name=" + "'" + Session["name"] + "'", con);

                SqlDataReader myReader = null;

                try

                {

                    con.Open();

                    myReader = cmd.ExecuteReader();

                    while (myReader.Read())

                    {

                        userid.Text = Session["name"] + "<" + myReader[1] + ">";

                        if (myReader[6] != null)

                        {

                            userPhoto.ImageUrl = "~/UserPhotos/" + myReader[6];

                        }

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



            }

        }

    }



}
