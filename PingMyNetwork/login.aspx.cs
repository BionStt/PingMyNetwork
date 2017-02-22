using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace PingMyNetwork
{
    public partial class login : System.Web.UI.Page
    {
        //List<Button> lb;

        protected void Page_Load(object sender, EventArgs e)
        {
            //lb = new List<Button> { Button1, Button2, Button3, Button4, Button5, Button6, Button7, Button8, Button9, Button_clear, Button_remove, Button_login };
            if (!IsPostBack)
            {

            }
            lipw.Attributes.Add("style", "border: 1px solid white");
            //    for (int i = 0; i < lb.Count; i++)
            //    {
            //        lb[i].CssClass += "animated fadeIn";
            //        Thread.Sleep(1000);

            //    }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            string a = btn.Text;
            lipw.Attributes.Remove("class");
            lipw.Attributes.Add("style", "border: 1px solid white");
            if (txtbox_password.Attributes["Value"].Length < 4)
            {
                txtbox_password.Attributes["Value"] += a;
            }


        }

        protected void Button_remove_Click(object sender, EventArgs e)
        {
            if (txtbox_password.Attributes["Value"].Length > 0)
            {
                txtbox_password.Attributes["Value"] = txtbox_password.Attributes["Value"].Substring(0, txtbox_password.Attributes["Value"].Length - 1);
            }
            lipw.Attributes.Remove("class");
            lipw.Attributes.Add("style", "border: 1px solid white");
        }

        protected void Button_clear_Click(object sender, EventArgs e)
        {
            txtbox_password.Attributes["Value"] = "";
            lipw.Attributes.Remove("class");
            lipw.Attributes.Add("style", "border: 1px solid white");
        }

        protected void Button_login_Click(object sender, EventArgs e)
        {
            if (txtbox_password.Attributes["Value"] == "1234")
            {
                Response.Redirect("http://www.google.com");
            }
            else
            {
                lipw.Attributes.Add("class", "animated shake");
                lipw.Attributes.Add("style", "border: 1px solid red");
                txtbox_password.Attributes["Value"] = "";
            }

        }

    }
}