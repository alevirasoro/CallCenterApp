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

        public void armarCorreoNuevoIncidente(string emailDestino, string apellido, string nombre, int nrocliente, string asunto, int idincidente)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@ecommerceprogramacioniii.com");
            email.To.Add(emailDestino);
            email.Subject = "Incidente número: " + idincidente;
            email.IsBodyHtml = true;
            email.Body = "<h1> Estimado: " + nombre + " " + apellido + "</h1> <br>Se ha registrado el siguiente incidente. <br><br><b>Incidente descripción:</b> " + asunto + "<br><br> Se le informará cuando se resuelva <br><br>Muchas gracias. <br> Atentamente Call Center S.A.";
            //email.Body = cuerpo;
            //"values ('" + aux.Asunto + "', '" + aux.Fecha + "', 1, 2, '" + aux.Prioridad.ID + "', '" + aux.Tipo.ID + "', '" + aux.Estado.ID + "')"
        }

        public void armarCorreoResolverIncidente(string emailDestino, string apellido, string nombre, string asunto, int idincidente, string comentariocierre)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@ecommerceprogramacioniii.com");
            email.To.Add(emailDestino);
            email.Subject = "Incidente número: " + idincidente;
            email.IsBodyHtml = true;
            email.Body = "<h1> Estimado: " + nombre + " " + apellido + "</h1> <br>Se ha resuelto el incidente. <br><br><b>Incidente descripción:</b> " + asunto + "<br><br>Comentario de cierre: " + comentariocierre + " <br><br>Muchas gracias. <br> Atentamente Call Center S.A.";
            //email.Body = cuerpo;
            //"values ('" + aux.Asunto + "', '" + aux.Fecha + "', 1, 2, '" + aux.Prioridad.ID + "', '" + aux.Tipo.ID + "', '" + aux.Estado.ID + "')"
        }

        public void armarCorreoCerrarIncidente(string emailDestino, string apellido, string nombre, string asunto, int idincidente, string comentariocierre)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@ecommerceprogramacioniii.com");
            email.To.Add("callcenterutn@gmail.com");
            email.Subject = "Incidente número: " + idincidente;
            email.IsBodyHtml = true;
            email.Body = "<h1> Estimado: " + nombre + " " + apellido + "</h1> <br>Se ha cerrado el incidente. <br><br><b>Incidente descripción:</b> " + asunto + "<br><br>Comentario de cierre: " + comentariocierre + " <br><br>Muchas gracias. <br> Atentamente Call Center S.A.";
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
