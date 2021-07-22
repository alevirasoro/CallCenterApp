using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;

namespace negocio
{
    public class EmailService
    {
        private MailMessage email;
        private SmtpClient server;

        public EmailService()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("callcenterutn@gmail.com", "callcenter1");
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp.gmail.com";
        }

        public void armarCorreo(string emailDestino, int nrocliente, string asunto)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@ecommerceprogramacioniii.com");
            email.To.Add(emailDestino);
            email.Subject = "Incidente " + nrocliente;
            email.IsBodyHtml = true;
            email.Body = "<h1> INCIDENTE NUMERO: </h1> <br>Incidente descripción: "+ asunto;
            //email.Body = cuerpo;
            //"values ('" + aux.Asunto + "', '" + aux.Fecha + "', 1, 2, '" + aux.Prioridad.ID + "', '" + aux.Tipo.ID + "', '" + aux.Estado.ID + "')"
        }

        public void enviarEmail()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
