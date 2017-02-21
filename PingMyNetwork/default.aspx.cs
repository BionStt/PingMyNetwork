using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BS;



namespace PingMyNetwork
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lblTest_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnIP_Click(object sender, EventArgs e)
        {
            NetworkScan a = new NetworkScan();
            lblIP.Text = a.PingNetwork(txtIP.Text).ToString();
        }

        protected void btnPushover_Click(object sender, EventArgs e)
        {
            NetworkScan a = new NetworkScan();
            string text = txtIP.Text + " " + a.PingNetwork(txtIP.Text).ToString();
            //Push p = new Push("ap7n7r56xkuttprqi2yyvzuzebcp4w", "u7mqewhsxe5rh6yr4ddbweunuv96t4", text);
            Push p = new Push(txtApp.Text, txtUser.Text, text);
        }
    }
}