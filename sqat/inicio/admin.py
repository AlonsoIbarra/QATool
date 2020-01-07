# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib.auth.models import Permission
from django.contrib import admin
from models import *

# Register your models here.
class RolAdmin(admin.ModelAdmin):
    search_fields = ('nombre', 'descripcion')

admin.site.register(Rol, RolAdmin)

class FaseAdmin(admin.ModelAdmin):
    pass

admin.site.register(Fase, FaseAdmin)

class EstatusDeProductosAdmin(admin.ModelAdmin):
    pass

admin.site.register(EstatusDeProductos, EstatusDeProductosAdmin)

class ProductoDeTrabajoAdmin(admin.ModelAdmin):
    search_fields = ('nombre', 'descripcion')

admin.site.register(ProductoDeTrabajo, ProductoDeTrabajoAdmin)

class MetricaAdmin(admin.ModelAdmin):
    pass

admin.site.register(Metrica, MetricaAdmin)

class CriterioDeAceptacionAdmin(admin.ModelAdmin):
    pass

admin.site.register(CriterioDeAceptacion, CriterioDeAceptacionAdmin)

class EventoAdmin(admin.ModelAdmin):
    pass

admin.site.register(Evento, EventoAdmin)

"""class FormatoAdmin(admin.ModelAdmin):
    search_fields = ('programa', 'extension')

admin.site.register(Formato, FormatoAdmin)
"""
class RangoDeMetricaAdmin(admin.ModelAdmin):
    search_fields = ('etiqueta', 'metrica')

admin.site.register(RangoDeMetrica, RangoDeMetricaAdmin)

admin.site.register(Permission)
