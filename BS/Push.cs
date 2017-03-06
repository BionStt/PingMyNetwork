using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DojoNorthSoftware.Pushover;

namespace BS
{
    public class Push
    {

        Fichero fichero_pushover;
        List<string> l1;
        List<tipo> l2;
        List<string> config;

        /// <summary>
        /// Empty constructor
        /// </summary>
        public Push()
        {
        }
        /// <summary>
        /// Constructor that sends a push
        /// </summary>
        /// <param name="app">App or token</param>
        /// <param name="user">User</param>
        /// <param name="text">Text</param>
        public Push(string app, string user, string text)
        {
            PushByTextEnteringTokenApp(app, user, text);

        }

        /// <summary>
        /// Send push by entering app token, user key and text
        /// </summary>
        /// <param name="app">App from Pushover</param>
        /// <param name="user">User from Pushover</param>
        /// <param name="text">Text to send</param>
        private void PushByTextEnteringTokenApp(string app, string user, string text)
        {
            Exception except;
            bool notify = Pushover.SendNotification(app,
                user,
                text,
                out except);
        }



        public void SavePushoverConfiguration(string user, string token)
        {

            SetListas();
            try
            {
                File.Delete(@"C:\pingmynetwork\pushover.txt");
                fichero_pushover = new Fichero(@"C:\pingmynetwork\pushover.txt", l1, l2);
            }
            catch (Exception e1)
            {
                return;
            }
            //Guardando los datos
            try
            {
                if (fichero_pushover.abre())
                {
                    fichero_pushover.fin();
                    config.Add(user);
                    config.Add(token);
                    fichero_pushover.escribe(config);
                }
            }
            catch (Exception e1)
            {
                //MessageBox.Show(e1.Message);
            }
            finally
            {
                fichero_pushover.cierra();
            }

        }


        public List<string> GetPushoverConfiguration()
        {
            List<string> config = new List<string>();
            SetListas();
            fichero_pushover = new Fichero(@"C:\pingmynetwork\pushover.txt", l1, l2);
            fichero_pushover.abre();

            for (int i = 0; i < fichero_pushover.numRegistros; i++)
            {
                try
                {
                    config = fichero_pushover.lee();
                }
                catch (Exception)
                {

                    throw;
                }
            }


            fichero_pushover.cierra();

            return config;

        }

        private void SetListas()
        {

            l1 = new List<string>();
            l2 = new List<tipo>();
            config = new List<string>();

            l1.Add("user");
            l1.Add("token");

            l2.Add(tipo.cadena);
            l2.Add(tipo.cadena);

        }

    }
}
