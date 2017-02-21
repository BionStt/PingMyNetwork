using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DojoNorthSoftware.Pushover;

namespace BS
{
    public class Push
    {
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
    }
}
