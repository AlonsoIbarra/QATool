import sys, os, django, string, subprocess, re, datetime
sys.path.append('/Users/saulalonso/Documents/sqatool/sqat')
os.environ['DJANGO_SETTINGS_MODULE'] = 'sqat.settings'
django.setup()

from inicio.models import *
from django.core.mail import EmailMessage

def sendMailEventNotify():
    eventos = EventoDeProyecto.objects.filter(
        fecha__year=datetime.datetime.now().year,
        fecha__month=datetime.datetime.now().month,
        fecha__day=datetime.datetime.now().day
    )
    title = "Recordatorio de eventos "+datetime.datetime.now().strftime('%Y/%m/%d')
    for evento in eventos:
        try:
            body = "Te recordamos que tienes un evento programado en esta fecha con los siguientes datos: <br>"
            body += "Tipo: "+evento.evento.nombre+"<br>"
            body += "Fecha: "+evento.fecha.strftime('%Y/%m/%d')+"<br>"
            body += "Hora: "+evento.hora.strftime('%H:%m')+"<br>"
            body += "Asistentes: "
            asistentes = [asistente.first_name+" "+asistente.last_name for asistente in evento.asistentes.all()]
            body += ", ".join(asistentes)
            body += "<br><br>"
            body += "Atentamente <br>"
            body += "SQATOOL <br>"
            body += "** Este es un mensaje auto generado no responda a este correo "
            destinatarios = [asistente.email for asistente in evento.asistentes.all()]
            email = EmailMessage(title, body, to=['saul.ibarra@cimat.mx'])
            email.content_subtype = "html"
            email.send()
        except Exception as e:
            EmailMessage('Error notiffy crontab function', str(e), to=['saul.ibarra@cimat.mx']).send()
            pass
    pass

if __name__ == '__main__':
    sendMailEventNotify()
