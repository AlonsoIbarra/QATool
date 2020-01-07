from django.conf.urls import url
from views import *

urlpatterns = [
    url(r'^inicio/$', inicio),
    url(r'^proyecto/(\d{1,4})/$', fases_de_proyecto),
    url(r'^fase/(\d{1,4})/$', revisar_fase),
    url(r'^producto/update/(\d{1,4})/$', actualizar_producto),
    url(r'^producto/criterios/confirmar/(\d{1,4})/$', aprobar_criterios_de_producto),
    url(r'^producto/criterios/(\d{1,4})/$', revisar_criterios),
    url(r'^producto/metricas/(\d{1,4})/$', revisar_metricas),
    url(r'^producto/metricas/accionescorrectivas', obtener_acciones_correctivas),
    url(r'^producto/metricas/accioncorrectiva/agregar', agregar_accion_correctiva),
    url(r'^producto/metricas/accioncorrectiva/observacion', actualizar_observacion_de_accion),
    url(r'^criterio/update/$', actualizar_criterio),
    url(r'^metrica/update/$', actualizar_metrica),
    url(r'^accion/insert/$', agregar_accion_de_metrica),
    url(r'^accion/change/$', cambiar_estatus_de_accion),
]
