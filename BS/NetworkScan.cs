using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.NetworkInformation;


namespace BS
{
    public class NetworkScan
    {

        public NetworkScan()
        {
        }

        /// <summary>
        /// Get current IP address
        /// </summary>
        /// <returns></returns>
        public string GetIPAddress()
        {
            System.Net.IPHostEntry host;
            string localIP = "?";
            host = System.Net.Dns.GetHostEntry(System.Net.Dns.GetHostName());
            foreach (System.Net.IPAddress ip in host.AddressList)
            {
                if (ip.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork)
                {
                    localIP = ip.ToString();
                }
            }
            return localIP;
        }

        /// <summary>
        /// Ping network function
        /// </summary>
        /// <param name="text">IP address</param>
        /// <returns>Boolean</returns>
        public bool PingNetwork(string ip)
        {
            try
            {
                using (Ping pingSender = new Ping())
                {
                    PingReply reply = pingSender.Send(ip, 500);

                    if (reply.Status == IPStatus.Success)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch (Exception)
            {
                return false;
            }

        }

        /// <summary>
        /// Check ip's hostname if availalble
        /// </summary>
        /// <param name="ip">IP address</param>
        /// <param name="v">value of return</param>
        /// <returns></returns>
        public string CheckHostname(string ip)
        {
            string hostname = "";
            try
            {
                System.Net.IPHostEntry hostip = System.Net.Dns.GetHostEntry(ip);
                hostname = hostip.HostName;
            }
            catch (ArgumentNullException x)
            {
            }
            catch (ArgumentOutOfRangeException x)
            {
            }
            catch (System.Net.Sockets.SocketException x)
            {
            }
            return hostname;
        }

    }
}
