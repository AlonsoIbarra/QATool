import sys, os, django, string, subprocess, re, datetime
sys.path.append('/Users/saulalonso/Documents/sqatool/sqat')
os.environ['DJANGO_SETTINGS_MODULE'] = 'sqat.settings'
django.setup()

from inicio.models import *

def runMetrics():
    try:
        metricas = MetricaDeProducto.objects.all()#filter(tipo='A')
        #raise str(metricas)
        for metrica in metricas:
            if not metrica.metrica.comando is None:
                #print str(metrica.metrica.tipo+" "+str(metrica.metrica.comando))
                try:
                    dato = get_dato(metrica.metrica, metrica.producto)
                    print str(metrica.metrica.tipo+" "+str(dato))
                    h = HistoricoDeMetrica()
                    h.metrica = metrica
                    h.dato = abs(int(float(dato)))
                    h.save()
                    #print ('metric saved '+metrica.metrica.nombre +" : "+metrica.metrica.comando +" : "+str(dato))
                except Exception as e:
                    #print ('error saving metric '+metrica.metrica.nombre +" : "+metrica.metrica.comando +" :  "+str(e))
                    pass
    except Exception as e:
        print e
    pass

def get_dato(metrica, producto_de_trabajo):
    comando = metrica.comando
    comando = string.replace(comando, 'path', 'media/'+str(producto_de_trabajo.get_url()))
    print comando
    p = subprocess.Popen(comando, stdout=subprocess.PIPE, shell=True)
    (output, err) = p.communicate()
    result = None
    if err == None and output != '':
        result = cleanResult(producto_de_trabajo,metrica.codigo,output)
        return result
    pass

def cleanResult(producto_de_trabajo,codigo, output):
    characters = '[-ABCDEFGHIJKLMNOPQRSTUWVXYZabcdefghijklmnopqrstuvwxyz():_/ ]'
    try:
        if codigo == 'DEC':
            result = output.count(producto_de_trabajo.get_nombre())#Count ocurrences of product name
        elif codigo == 'CC':
            sub = output.splitlines()[-1]
            result = re.sub(characters, '', sub)
        elif codigo == 'MI':
            sub = output.splitlines()[0]
            sub = re.sub(str(producto_de_trabajo.get_url()), '', sub)#Delete url file because it returns url and value in the same line
            result = re.sub(characters, '', sub)
        elif codigo == 'LOC':
            sub = output.splitlines()[1]
            result = re.sub(characters, '', sub)
        elif codigo == 'LLOC':
            sub = output.splitlines()[2]
            result = re.sub(characters, '', sub)
        else:
            return "None option"
    except Exception as e:
        print ('Error comando --- Codigo : '+codigo+" --- Output : "+output+" --- Error : "+str(e))
        print ('***************************************')
        return e
#    print (codigo+" returning : "+result)
#    print ('***********')
    return result

if __name__ == '__main__':
    runMetrics()
