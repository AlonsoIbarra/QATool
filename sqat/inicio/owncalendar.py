import datetime
from calendar import HTMLCalendar
from django.contrib.staticfiles.templatetags.staticfiles import static
from models import EventoDeProyecto

class ContestCalendar(HTMLCalendar):

    def __init__(self, id_project, firstweekday=0):
    	self.id_project = id_project
        super(ContestCalendar, self).__init__(firstweekday)

    def formatmonth(self, theyear, themonth, w=0, l=0):
    	self.theyear = theyear
    	self.themonth = themonth
        return super(ContestCalendar, self).formatmonth(theyear, themonth, w)

    def formatday(self, day, weekday, data=''):
        self.theday = day
        if day==0: # note error here in original code
            return '<td class="noday">&nbsp;</td>'
        else:
            dateCalendar = datetime.date(self.theyear,self.themonth,day)
            eventos = EventoDeProyecto.objects.filter(proyecto=self.id_project, fecha__startswith=dateCalendar)
            css = self.cssclasses[weekday]
            eventslist = self.printThumbEvents(eventos)
            if eventos.count()>0:
            	css += ' eventtoday'
            if dateCalendar == datetime.date.today():
            	css += ' today'
            return '<td class="block-day %s"><span class="day-calendar">%s</strong> <span class="eventlist-calendar">%s</span> </td>' % (css, self.addLink(day) , eventslist)

    def addLink(self, day):
        date_link = datetime.date(self.theyear,self.themonth,self.theday)
        link = ''
        if date_link >= datetime.date.today():
            link = '<a class="add_event link-calendar" href="/administrar/proyecto/eventos/registrar/'+str(self.id_project)+'/'+str(self.theyear)+'/'+str(self.themonth)+'/'+str(self.theday)+'">'
            link += str(day)
            link += '</a>'
        else:
            link = str(day)
        return link

    def printThumbEvents(self, eventos):
        thumb = ""
        if eventos.count()>0:
            thumb += " <br>"
            for evento in eventos:
                thumb += '<a href="/administrar/proyecto/eventos/evento/'+str(evento.id)+'" class="thumbevent">'
                thumb += evento.evento.nombre
                thumb += '</a"><br>'
       	return thumb
