using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BS;
using System.Text;

namespace PingMyNetwork
{
    public partial class _default : System.Web.UI.Page
    {
        List<string> listaIPS = new List<string>();
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

        protected void btntest2(object sender, EventArgs e)
        {
            Response.Redirect("https://www.google.es/?gws_rd=ssl");
        }


        protected void btntest_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<table>");

            NetworkScan a = new NetworkScan();
            string myIP = a.GetIPAddress();
            myIP = "192.168.1.26";
            string[] l = myIP.Split('.');
            myIP = string.Format("{0}.{1}.{2}.", l[0], l[1], l[2]);

            for (int i = 0; i < 20; i++)
            {
                try
                {
                    if (a.PingNetwork(myIP + i))
                    {

                        string h = a.CheckHostname(myIP + i);
                        if (h == "")
                        {
                            h = "NOT PC";
                        }
                        listaIPS.Add(myIP + i);
                        sb.AppendFormat("<tr><td>{0}</td><td>{1}</td></tr>", myIP + i, h);
                    }
                }
                catch (Exception)
                {

                    throw;
                }
            }
            sb.Append("</table>");
            divtest.InnerHtml = sb.ToString();
        }


    }
}