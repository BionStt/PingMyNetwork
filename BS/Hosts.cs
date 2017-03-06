using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BS
{
    public class Hosts
    {
        Fichero fichero_hosts;
        List<string> l1;
        List<tipo> l2;
        List<string> nhosts;

        public struct host
        {
            //public int id { get; set; }
            public string ip { get; set; }
            public string hostname { get; set; }
            public string mac { get; set; }
            public string device { get; set; }

        }

        /// <summary>
        /// Host list for ScanNetwork
        /// </summary>
        public static List<host> listHostToScanNetwork = new List<host>();

        /// <summary>
        /// Host list for MainWeb
        /// </summary>
        public static List<host> listHostMain = new List<host>();

        /// <summary>
        /// Add a host to the main host list and inserts into database
        /// </summary>
        /// <param name="ip">IP</param>
        /// <param name="hostname">Hostname</param>
        /// <param name="mac">MAC</param>
        public void AddHost(string ip, string hostname, string mac, string device)
        {

            SetListas();

            host newhost = new host()
            {
                ip = ip,
                hostname = hostname,
                mac = mac,
                device = device
            };

            try
            {
                fichero_hosts = new Fichero(@"C:\pingmynetwork\hosts.txt", l1, l2);
            }
            catch (Exception e1)
            {
                return;
            }
            //Guardando los datos
            try
            {
                if (fichero_hosts.abre())
                {
                    fichero_hosts.fin();
                    nhosts.Add(ip);
                    nhosts.Add(hostname);
                    nhosts.Add(mac);
                    nhosts.Add(device);
                    fichero_hosts.escribe(nhosts);
                    listHostMain.Add(newhost);

                }
            }
            catch (Exception e1)
            {
                //MessageBox.Show(e1.Message);
            }
            finally
            {
                fichero_hosts.cierra();
            }

        }


        public List<host> GetHostFromDataBase()
        {
            listHostMain = new List<host>();
            List<string> hosts = new List<string>();
            SetListas();
            fichero_hosts = new Fichero(@"C:\pingmynetwork\hosts.txt", l1, l2);
            fichero_hosts.abre();

            for (int i = 0; i < fichero_hosts.numRegistros; i++)
            {
                try
                {
                    hosts = fichero_hosts.lee();

                    host newhost = new host()
                    {
                        ip = hosts[0],
                        hostname = hosts[1],
                        mac = hosts[2],
                        device = hosts[3]
                    };


                    listHostMain.Add(newhost);


                }
                catch (Exception)
                {

                    throw;
                }
            }


            fichero_hosts.cierra();


            return listHostMain;

        }


        /// <summary>
        /// Method that get client IP and checks entire network
        /// </summary>
        /// <returns>returns a list with online hosts</returns>
        public List<host> FillListWithHost()
        {

            NetworkScan a = new NetworkScan();
            string myIP = a.GetIPAddress();
            string[] l = myIP.Split('.');
            myIP = string.Format("{0}.{1}.{2}.", l[0], l[1], l[2]);

            for (int i = 1; i < 20; i++)
            {
                //CHECK IF IP IS PINGEABLE
                if (a.PingNetwork(myIP + i))
                {
                    //GET HOSTNAME
                    string h = a.CheckHostname(myIP + i);
                    if (h == "")
                    {
                        h = "CANT GET HOSTNAME";
                    }

                    //GET MAC
                    string newmac = MacResolver.FormatMac(MacResolver.GetRemoteMAC(myIP + i), ':');

                    //CREATE HOST WITH VALUES
                    host newHost = new host() { ip = myIP + i, hostname = h, mac = newmac.ToUpper(), device = "device" };

                    //ADD TO LIST

                    listHostToScanNetwork.Add(newHost);
                }
                else
                {
                    //FUCKK OFF
                }
            }
            return listHostToScanNetwork;

        }

        private void SetListas()
        {

            l1 = new List<string>();
            l2 = new List<tipo>();
            nhosts = new List<string>();

            l1.Add("ip");
            l1.Add("hostname");
            l1.Add("mac");
            l1.Add("device");

            l2.Add(tipo.cadena);
            l2.Add(tipo.cadena);
            l2.Add(tipo.cadena);
            l2.Add(tipo.cadena);

        }
    }
}
