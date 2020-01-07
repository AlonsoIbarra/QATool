# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.utils import timezone
from graphos.renderers.gchart import LineChart
from graphos.sources.model import ModelDataSource
from graphos.sources.simple import SimpleDataSource
from django.contrib.auth.models import User, Permission
from django.utils.encoding import python_2_unicode_compatible
#from django.core.validators import FileExtensionValidator
from django.core.exceptions import ValidationError, ObjectDoesNotExist
import datetime

METRICASTIPOS = (('A','Automática'),('M','Manual'),('I','Indirecta'))
# Create your models here.
class TokenDeContrasena(models.Model):
    token = models.TextField(max_length = 64)
    usuario = models.ForeignKey(User)
    fecha = models.DateTimeField(blank=False, null=False, default= timezone.now)
    estatus = models.BooleanField(default= True)

    def __str__(self):
        return self.token

    class Meta:
        ordering = ["fecha"]

@python_2_unicode_compatible
class Rol(models.Model):
    nombre = models.CharField(max_length = 50, verbose_name='Nombre')
    descripcion = models.TextField(blank = True, verbose_name='Descripción')
    permisos = models.ManyToManyField(Permission, verbose_name='Permisos de rol')

    def __str__(self):
        return self.nombre

    class Meta:
        ordering = ["nombre"]
        verbose_name_plural = "Roles"
        db_table = 'roles'

@python_2_unicode_compatible
class Proyecto(models.Model):
    nombre = models.CharField(max_length = 50, verbose_name='Nombre del proyecto')
    cliente = models.CharField(max_length = 50, verbose_name='Cliente')
    nombre_del_equipo = models.CharField(max_length = 50, verbose_name='Equipo de desarrollo')
    usuario_registro = models.ForeignKey(User, verbose_name='Usuario propietario')
    estatus =  models.BooleanField(verbose_name='Autorizar configuración', default= False)

    def __str__(self):
        return self.nombre

    def descripcion(self):
        return " Cliente : "+self.cliente+", Equipo : "+self.nombre_del_equipo

    def fases(self):
        return int(FaseDeProyecto.objects.filter(proyecto=self.id).count())

    class Meta:
        ordering = ["nombre"]
        db_table = "proyectos"
        verbose_name_plural = "Proyectos"
        unique_together = ('nombre', 'cliente','nombre_del_equipo')

@python_2_unicode_compatible
class PermisoDeUsuario(models.Model):
    proyecto = models.ForeignKey(Proyecto)
    usuario = models.ForeignKey(User)
    permiso = models.ForeignKey(Permission)

    def __str__(self):
        return self.permiso.codename

    class Meta:
        db_table = "permisos_de_usuario"
        ordering = ["proyecto","usuario"]
        verbose_name_plural = "Permisos"

@python_2_unicode_compatible
class RolDeProyecto(models.Model):
    rol = models.ForeignKey(Rol, verbose_name='Rol')
    usuario = models.ForeignKey(User, verbose_name='Usuario')
    proyecto = models.ForeignKey(Proyecto, verbose_name='Proyecto')
    enterado = models.BooleanField(verbose_name='Enterado', default= False)
    fecha_de_enterado = models.DateTimeField(verbose_name='Fecha de enterado',  blank= True, null=True, default=None)

    class Meta:
        db_table = "roles_de_proyecto"
        unique_together = ("rol", "usuario", "proyecto")

    def __str__(self):
        return self.rol.nombre

    def delete(self, *args, **kwargs):
        if self.usuario:
            usuario = self.usuario
            rol = self.rol
            for permiso in rol.permisos.all():
                usuario.user_permissions.remove(permiso)
                PermisoDeUsuario.objects.filter(proyecto=self.proyecto, usuario=self.usuario,permiso=permiso).delete()
                #raise ValidationError('delete rol'+ str(permiso))
        super(RolDeProyecto, self).delete(*args, **kwargs)

    def save(self, *args, **kwargs):
        if self.usuario:
            usuario = self.usuario
            rol = self.rol
            for permiso in rol.permisos.all():
                PermisoDeUsuario.objects.create(proyecto=self.proyecto, usuario=self.usuario,permiso=permiso)
                usuario.user_permissions.add(permiso)
                #raise ValidationError('add '+str(permiso))
        return super(RolDeProyecto, self).save(*args, **kwargs)

    def descripcion(self):
        return "Asignado a : "+self.usuario.username+", "+self.rol.descripcion

"""@python_2_unicode_compatible
class Formato(models.Model):
    programa = models.TextField(verbose_name='Tipo de documento', default='', null=True, blank=True)
    extension = models.TextField(verbose_name='Extension', default='', max_length=5, null=True, blank=True)
    mimeType = models.TextField(verbose_name='Mime type', default='', null=True, blank=True)

    def __str__(self):
        return self.programa

    class Meta:
        db_table = "formatos"
"""
@python_2_unicode_compatible
class Metrica(models.Model):
    nombre = models.CharField(max_length = 50, verbose_name='Nombre')
    descripcion = models.TextField(blank = True, verbose_name='Descripción')
    tipo = models.CharField(max_length = 20, verbose_name='Tipo de métrica', null = False, blank = False, choices=METRICASTIPOS)
    codigo = models.CharField(max_length = 10, verbose_name='Codigo', null = True, blank = True)
    comando = models.CharField(verbose_name='Comando a ejecutar en terminal', max_length=100, null = True, blank = True)
    metricas_relacionadas = models.ManyToManyField('self', verbose_name="Métricas relacionadas", null=True, blank=True)

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = "metricas"
        ordering = ["nombre"]
        verbose_name_plural = "Métricas"

@python_2_unicode_compatible
class ProductoDeTrabajo(models.Model):
    nombre = models.TextField(verbose_name='Nombre')
    descripcion = models.TextField(verbose_name='Descripción')
    plantilla = models.FileField(upload_to='formats', verbose_name='Formato ejemplo', null = True, blank = True)
    imagen = models.ImageField(upload_to='formats', verbose_name='Imagen ejemplo', null = True, blank = True)
    metricas = models.ManyToManyField(Metrica, verbose_name="Métricas permitidas", blank=True)
#    formatos = models.ManyToManyField(Formato, verbose_name="Formatos permitidos", blank=True)

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = "productos_de_trabajo"
        ordering = ["nombre"]
        verbose_name_plural = "Productos de trabajo"

    def get_url(self):
        if self.plantilla:
            return self.plantilla
        if self.imagen:
            return self.imagen
        return False

@python_2_unicode_compatible
class Fase(models.Model):
    nombre = models.CharField(max_length = 20, verbose_name='Nombre')
    objetivo = models.TextField(verbose_name='Objetivo')
    roles = models.ManyToManyField(Rol, verbose_name='Roles responsables')
    productos_de_trabajo = models.ManyToManyField(ProductoDeTrabajo, verbose_name="Productos de trabajo", blank=True)
    permiso_de_fase = models.ForeignKey(Permission, verbose_name='Permiso de especifico de fase')

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = "fases"
        ordering = ["id"]
        verbose_name_plural = "Fases"
        permissions = (("can_update_analisis_file","Puede actualizar archivos de la fase de análisis"),
            ("can_update_evaluacion_file","Puede actualizar archivos de la fase de evaluación"),
            ("can_update_diseno_file","Puede actualizar archivos de la fase de diseño"),
            ("can_update_desarrollo_file","Puede actualizar archivos de la fase de desarrollo"),
            ("can_update_pruebas_file","Puede actualizar archivos de la fase de pruebas"),
            ("can_update_liberacion_file","Puede actualizar archivos de la fase de liberación"),
            ("can_update_cierre_file","Puede actualizar archivos de la fase de cierre"),)

@python_2_unicode_compatible
class EstatusDeProductos(models.Model):
    valor = models.IntegerField(verbose_name='Valor', blank= True, null=True)
    nombre = models.CharField(max_length = 30, verbose_name='Nombre')
    descripcion = models.TextField(blank = True, verbose_name='Descripción')

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = "estatus_de_productos"
        ordering = ["valor"]
        verbose_name_plural = "Estatus de productos"

@python_2_unicode_compatible
class CriterioDeAceptacion(models.Model):
    nombre = models.CharField(max_length = 50, verbose_name='Nombre')
    descripcion = models.TextField(blank = True, verbose_name='Descripción')
    tipo = models.CharField(max_length = 30, blank = True, verbose_name='Tipo de criterio')

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = "criterios_de_aceptacion"
        ordering = ["nombre"]
        verbose_name_plural = "Criterios de aceptación"

@python_2_unicode_compatible
class RangoDeMetrica(models.Model):
    limite_superior = models.IntegerField(verbose_name='Limite superior')
    limite_inferior = models.IntegerField(verbose_name='Limite inferior')
    etiqueta = models.TextField(verbose_name='Etiqueta')
    metrica = models.ForeignKey(Metrica)

    def __str__(self):
        return self.metrica.nombre+" - "+self.etiqueta

    class Meta:
        ordering = ["etiqueta"]
        verbose_name_plural = "Rangos de métricas"
        db_table = 'rangos_de_metricas'

@python_2_unicode_compatible
class FaseDeProyecto(models.Model):
    proyecto = models.ForeignKey(Proyecto, verbose_name='Proyecto')
    fase = models.ForeignKey(Fase, verbose_name='Fase')
    fecha_de_inicio = models.DateField(verbose_name='Fecha de inicio', blank= False, null=False, default=timezone.now)
    fecha_de_cierre = models.DateField(verbose_name='Fecha de cierre',  blank= False, null=False, default=timezone.now)

    class Meta:
        db_table = "fases_de_proyecto"
        verbose_name_plural = "Fases de proyecto"
        ordering = ["fecha_de_inicio","fecha_de_cierre"]

    def __str__(self):
        return self.fase.nombre

    def productosDeTrabajo(self):
        return ProductoDeTrabajoDeFase.objects.filter(fase=self.id)

    def descripcion(self):
        return "Contiene "+str(self.productosDeTrabajo().count())+" productos de trabajo agregados"

    def productosVerificados(self):
        result = 0
        productos = ProductoDeTrabajoDeFase.objects.filter(fase=self.id)
        for producto in productos:
            if producto.revisarCriterios():
                result += 1
        return result

@python_2_unicode_compatible
class ProductoDeTrabajoDeFase(models.Model):
    producto = models.ForeignKey(ProductoDeTrabajo, verbose_name='Producto de trabajo')
    fase = models.ForeignKey(FaseDeProyecto, verbose_name='Fase', null = True, blank = True)
    ultima_actualizacion = models.DateTimeField(verbose_name='Ultima actualización de archivo', default=timezone.now)
    estatus = models.ForeignKey(EstatusDeProductos, verbose_name='Estatus', default=1)
    plantilla = models.FileField(upload_to='formats', verbose_name='Plantilla ', null = True, blank = True)
    archivo =  models.FileField(upload_to='evidence', verbose_name='Documento / Imagen elaborado', null = True, blank = True)#, validators=[FileExtensionValidator(allowed_extensions=[formato.extension for formato in Formato.objects.all()])])
    #foto = models.ImageField(upload_to='evidence', verbose_name='Imagen / Foto / Captura', null = True, blank = True, validators=[FileExtensionValidator(allowed_extensions=[formato.extension for formato in Formato.objects.all()])])

    class Meta:
        db_table = "productos_de_trabajo_de_fase"
        permissions = (("can_update_file", "Puede actualizar el archivo del producto de trabajo"),
            ("can_commit_acceptance_criteria", "Puede autorizar cumplimiento de criterios")
        )

    def __str__(self):
        return self.producto.nombre

    def save(self, *args, **kwargs):
        if self.archivo and self.estatus.valor == 0:
            self.estatus = EstatusDeProductos.objects.get(valor=1)
        elif self.archivo=='' and self.estatus.valor == 1:
            self.estatus = EstatusDeProductos.objects.get(valor=0)
        return super(ProductoDeTrabajoDeFase, self).save(*args, **kwargs)

    def get_template(self):
        if self.plantilla:
            return self.plantilla
        return False

    def get_url(self):
        if self.archivo:
            return self.archivo
        return False

    def get_nombre(self):
        if self.archivo:
            return str(self.archivo).split("/")[-1]
        return 'Sin asignar'

    def revisarCriterios(self):
        criterios = self.criterios()
        for criterio in criterios:
            if not criterio.estatus:
                return False
        return True

    def revisarMetricas(self):
        metricas = self.metricas()
        for metrica in metricas:
            limite_inferior = metrica.indice - metrica.desviacion
            limite_superior = metrica.indice + metrica.desviacion
            datoHistorico = metrica.ultimoDatoHistorico()
            if limite_inferior > datoHistorico.dato:
                return False#"lower"+metrica.metrica.nombre
            if limite_superior < datoHistorico.dato:
                return False#"upper"+metrica.metrica.nombre
        return True

    def criterios(self):
        return CriterioDeProducto.objects.filter(producto=self.id)

    def metricas(self):
        return MetricaDeProducto.objects.filter(producto=self.id)

@python_2_unicode_compatible
class CriterioDeProducto(models.Model):
    producto = models.ForeignKey(ProductoDeTrabajoDeFase)
    criterio = models.ForeignKey(CriterioDeAceptacion)
    estatus = models.BooleanField(verbose_name='Estatus', default= False, blank= False, null=False)

    def __str__(self):
        return self.criterio.nombre

    def descripcion(self):
        return self.criterio.descripcion

    class Meta:
        db_table = "criterios_de_producto"
        unique_together = ('producto', 'criterio')
        ordering = ["criterio"]
        permissions = (("can_update_product_criteria", "Puede actualizar el estatus del criterio de producto"),)

@python_2_unicode_compatible
class MetricaDeProducto(models.Model):
    producto = models.ForeignKey(ProductoDeTrabajoDeFase, verbose_name='Producto')
    metrica = models.ForeignKey(Metrica, verbose_name='Métrica')
    indice = models.FloatField(blank= True, null=True, verbose_name='Índice')
    limite_superior = models.FloatField(blank= True, null=True, verbose_name='Límite superior')
    limite_inferior = models.FloatField(blank= True, null=True, verbose_name='Límite inferior')
    desviacion = models.IntegerField(blank= True, null=True, verbose_name='Desviación aceptable')

    class Meta:
        db_table = "metricas_de_producto"
        unique_together = ("producto", "metrica")
        ordering = ["metrica"]

    def save(self, *args, **kwargs):
        if self.metrica:
            metrica = self.metrica
            if metrica.tipo == 'I':
                for metrica in metrica.metricas_relacionadas.all():
                    try:
                        match = MetricaDeProducto.objects.get(producto=self.producto,metrica=metrica)
                    except ObjectDoesNotExist:
                        MetricaDeProducto.objects.create(producto=self.producto,metrica=metrica)
        return super(MetricaDeProducto, self).save(*args, **kwargs)

    def __str__(self):
        return self.metrica.nombre

    def descripcion(self):
        return self.metrica.descripcion

    def estatus(self):
        """
        regresa falso cuando esta fuera del limite permitido y 
        no tiene acciones corectivas en proceso
        """
        dato_historico = self.ultimoDatoHistorico()
        limite_superior = self.limite_superior
        limite_inferior = self.limite_inferior
        acciones_por_ejecutar = AccionCorrectivaDeMetrica.objects.filter(metrica_de_producto=self.id, estado=1) ## acciones con estatus en proceso de ejecición que tiene id 1
        if dato_historico.dato < limite_inferior and not acciones_por_ejecutar.count() > 0:
            return False
        if dato_historico.dato > limite_superior and not acciones_por_ejecutar.count() > 0:
            return False
        return True

    def ultimoDatoHistorico(self):
        return HistoricoDeMetrica.objects.filter(metrica=self.id).latest('id')

    def desviacion_porcentual(self):
        dato_historico = self.ultimoDatoHistorico()
        if dato_historico == None:
            return 0
        if self.indice == None:
            return 0
        if self.limite_inferior == None or  self.limite_superior:
            return 0
        if dato_historico.dato < self.indice:
            desviacion = self.indice - self.limite_inferior
        elif dato_historico.dato > self.indice:
            desviacion = self.limite_superior - self.indice
        else:
           desviacion = 0 
        if desviacion != 0:
            desviacion_porcentual = (abs(self.indice - dato_historico.dato) * 100 ) / desviacion
        else:
            desviacion_porcentual = (abs(self.indice - dato_historico.dato) * 100 )
        return desviacion_porcentual

    def rango(self):
        try:
            rangos = RangoDeMetrica.objects.filter(metrica=self.metrica)
            dato = self.ultimoDatoHistorico()
            for rango in rangos:
                if rango.limite_superior >= dato.dato >= rango.limite_inferior:
                    return rango
        except Exception as e:
            pass
        return None

    def acciones_correctivas(self):
        return AccionCorrectivaDeMetrica.objects.filter(metrica_de_producto=self.id)

    def chart(self):
        title = ['Fecha','Dato obtenido']
        historico = HistoricoDeMetrica.objects.filter(metrica=self.id).select_related()
        if not self.indice is None:
            title.append('Índice')
        if not self.limite_superior is None:
            title.append('Limite superior')
        if not self.limite_inferior is None:
            title.append('Limite inferior')
        data_source = [title]
        for dato in historico:
            row =[dato.fecha,dato.dato]
            if not self.indice is None:
                row.append(dato.metrica.indice)
            if not self.limite_superior is None:
                row.append(dato.metrica.limite_superior)
            if not self.limite_inferior is None:
                row.append(dato.metrica.limite_inferior)
            data_source.append(row)
        data_source = SimpleDataSource(data=data_source)
        chart = LineChart(data_source, height=400, width=800, options={'title': 'Datos historicos de '+self.metrica.nombre, 'lineWidth': 3, 'smooth': False})
        return chart

@python_2_unicode_compatible
class HistoricoDeMetrica(models.Model):
    metrica = models.ForeignKey(MetricaDeProducto, verbose_name='Historico')
    dato = models.IntegerField(verbose_name='Dato obtenido')
    fecha = models.DateField(verbose_name='Fecha de recolección', default=timezone.now)

    class Meta:
        db_table = "historico_de_metricas"
        ordering = ["fecha"]
        unique_together = ("metrica", "fecha")

    def __str__(self):
        return self.metrica.metrica.nombre

@python_2_unicode_compatible
class AccionCorrectivaDeMetrica(models.Model):
    metrica_de_producto = models.ForeignKey(MetricaDeProducto, verbose_name='Metrica de producto')
    accion = models.TextField(blank=False, verbose_name='Acción correctiva')
    observacion = models.TextField(verbose_name='Observaciones', null = True, blank = True, default='')
    fecha = models.DateField(default=timezone.now)
    responsable = models.ForeignKey(User, verbose_name='Responsable', null=False, blank=False)
    fecha_limite = models.DateField(verbose_name='Fecha límite', null=False, blank=False, default= datetime.datetime.now())

    class Meta:
        db_table = "acciones_correctivas_de_metrica"
        ordering = ["fecha"]
        permissions =(('can_see_actions','Ver las acciones correctivas realizadas.'),)

    def __str__(self):
        return self.accion

    def estatusForm(self):
#        form = fase.FaseForms.FormularioEstatusDeAccion(instance=self)
#        return form.as_table()
        return None

@python_2_unicode_compatible
class Evento(models.Model):
    nombre = models.CharField(max_length = 30, verbose_name='Nombre')
    descripcion = models.TextField(blank = True, verbose_name='Descripción')

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = "eventos"
        ordering = ["nombre"]
        verbose_name_plural = "Eventos"

@python_2_unicode_compatible
class EventoDeProyecto(models.Model):
    evento = models.ForeignKey(Evento, verbose_name='Evento')
    proyecto = models.ForeignKey(Proyecto, verbose_name='Proyecto')
    asunto = models.TextField(verbose_name='Asunto', blank=True, null=True)
    fecha = models.DateField(verbose_name='Fecha', blank= False, null=False, default=datetime.datetime.now())
    hora = models.TimeField(verbose_name='Hora', blank= False, null=False, default=str(datetime.datetime.now().hour)+":"+str(datetime.datetime.now().minute))
    asistentes = models.ManyToManyField(User, verbose_name='Asistentes')

    def __str__(self):
        return self.evento.nombre

    def descripcion(self):
        return self.evento.descripcion

    class Meta:
        db_table = "eventos_de_proyecto"
        ordering = ["fecha", "hora", "evento"]
