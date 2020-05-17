using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实验三
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        public string Msg { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            /*Label1.Text = (string)Session["tijiao"];
            img.ImageUrl = (string)Session["image"];*/
        }
    }
}