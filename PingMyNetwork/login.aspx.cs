using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PingMyNetwork
{
    public partial class login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            string a = btn.Text;
            txtbox_password.Attributes["Value"] += a;


        }

        protected void Button_remove_Click(object sender, EventArgs e)
        {
            if (txtbox_password.Attributes["Value"].Length > 0)
            {
                txtbox_password.Attributes["Value"] = txtbox_password.Attributes["Value"].Substring(0, txtbox_password.Attributes["Value"].Length - 1);
            }
        }

        protected void Button_clear_Click(object sender, EventArgs e)
        {
            txtbox_password.Attributes["Value"] = "";
        }

        protected void Button_login_Click(object sender, EventArgs e)
        {
            if (txtbox_password.Attributes["Value"] == "1234")
            {
                Response.Redirect("http://www.google.com");
            }
        }
    }
}