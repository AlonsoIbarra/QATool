from django.conf.urls import url
from views import *

urlpatterns = [
    url(r'^inicio/$', inicio),
    url(r'^perfil/update$', actualizar_perfil),
    url(r'^password/$', actualizar_contrasena),
    url(r'^proyecto/registrar/$', registrar_proyecto),
    url(r'^proyecto/(\d{1,4})/$', ver_proyecto),
    url(r'^proyecto/aprobar/(\d{1,4})/$', aprobar_proyecto),
    url(r'^proyecto/roles/(\d{1,4})/$', ver_roles_de_proyecto),
    url(r'^proyecto/roles/registrar/(\d{1,4})/$', agregar_rol_de_proyecto),
    url(r'^proyecto/eventos/(\d{1,4})/$', ver_calendario_de_proyecto),
    url(r'^proyecto/eventos/(\d{1,4})/(\d{1,4})/(\d{1,2})/$', ver_calendario_de_proyecto),
    url(r'^proyecto/eventos/evento/(\d{1,4})/$', ver_evento),
    url(r'^proyecto/eventos/registrar/(\d{1,4})/(\d{1,4})/(\d{1,2})/(\d{1,2})/$', agregar_evento_de_proyecto),
    url(r'^proyecto/fase/(\d{1,4})/$', ver_fase_de_proyecto),
    url(r'^proyecto/fases/registrar/(\d{1,4})/$', agregar_fase_de_proyecto),
    url(r'^proyecto/fase/productos/agregar/(\d{1,4})/$', agregar_producto_a_fase),
    url(r'^proyecto/fase/producto/editar/(\d{1,4})/$', editar_producto_de_fase),
    url(r'^proyecto/fase/producto/(\d{1,4})/$', ver_producto),
    url(r'^proyecto/fase/producto/criterios/(\d{1,4})/$', asignar_criterios_a_producto),
    url(r'^proyecto/fase/producto/metricas/(\d{1,4})/$', asignar_metricas_a_producto),
    url(r'^proyecto/fase/producto/metrica/editar/(\d{1,4})/$', editar_metrica_de_producto),
    url(r'^proyecto/fase/producto/metrica/asociacion', obtener_metricas_asociadas),
    url(r'^proyecto/(?P<case>\w+)/delete/(?P<id_registro>\d{1,4})/$', eliminar_registro),
]
