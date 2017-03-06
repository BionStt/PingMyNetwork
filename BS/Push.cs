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
    }
}
