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

            if (!IsPostBack)
            {
            }

        }

        protected void btnTestIp_Click(object sender, EventArgs e)
        {
            NetworkScan a = new NetworkScan();
            if (a.PingNetwork(ipaddress.Value))
            {
                ipaddress.Attributes.Add("style", "border-bottom: 1px solid green");
                ActiveLabels();
            }
            else
            {
                ipaddress.Attributes.Add("style", "border-bottom: 1px solid red");

            }
        }

        protected void btnGetHostnameByIP_Click(object sender, EventArgs e)
        {
            NetworkScan a = new NetworkScan();
            string h = a.CheckHostname(ipaddress.Value);
            if (h == "")
            {

                hostname.Attributes.Add("style", "border-bottom: 1px solid red");
                hostname.Value = "Cant get hostname";

            }
            else
            {
                hostname.Value = h;
                hostname.Attributes.Add("style", "border-bottom: 1px solid green");
                ActiveLabels();

            }

        }

        protected void btnGetMACByIP_Click(object sender, EventArgs e)
        {
            string mac = MacResolver.FormatMac(MacResolver.GetRemoteMAC(ipaddress.Value.ToString()), ':');
            if (mac == "00-00-00-00-00-00")
            {
                macaddress.Attributes.Add("style", "border-bottom: 1px solid red");

            }
            else
            {
                macaddress.Value = mac.ToUpper();
                macaddress.Attributes.Add("style", "border-bottom: 1px solid green");
                ActiveLabels();
            }

        }

        private void ActiveLabels()
        {
            if (ipaddress.Value == "")
            {

            }
            else
            {
                lbl_ipaddress.Attributes.Add("class", "active");

            }

            if (hostname.Value == "")
            {

            }
            else
            {
                lbl_hostname.Attributes.Add("class", "active");

            }
            if (macaddress.Value == "")
            {

            }
            else
            {
                lbl_macaddress.Attributes.Add("class", "active");

            }


        }

        //protected void btntest2(object sender, EventArgs e)
        //{
        //    Response.Redirect("https://www.google.es/?gws_rd=ssl");
        //}


        //protected void btntest_Click(object sender, EventArgs e)
        //{
        //    StringBuilder sb = new StringBuilder();
        //    sb.Append("<table>");

        //    NetworkScan a = new NetworkScan();
        //    string myIP = a.GetIPAddress();
        //    myIP = "192.168.1.26";
        //    string[] l = myIP.Split('.');
        //    myIP = string.Format("{0}.{1}.{2}.", l[0], l[1], l[2]);

        //    for (int i = 0; i < 20; i++)
        //    {
        //        try
        //        {
        //            if (a.PingNetwork(myIP + i))
        //            {

        //                string h = a.CheckHostname(myIP + i);
        //                if (h == "")
        //                {
        //                    h = "NOT PC";
        //                }
        //                listaIPS.Add(myIP + i);
        //                sb.AppendFormat("<tr><td>{0}</td><td>{1}</td></tr>", myIP + i, h);
        //            }
        //        }
        //        catch (Exception)
        //        {

        //            throw;
        //        }
        //    }
        //    sb.Append("</table>");
        //    divtest.InnerHtml = sb.ToString();
        //}


    }
}